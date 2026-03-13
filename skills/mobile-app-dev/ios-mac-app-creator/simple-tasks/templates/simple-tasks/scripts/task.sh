#!/usr/bin/env bash
set -eo pipefail
shopt -s nullglob

usage() {
  cat <<USAGE
Usage: task.sh <claim|done|status|next|plan|finished|upcoming|needs-planning|blocked|summary|learn> [options]

Examples:
  AGENT_NAME=CODEX scripts/task.sh claim 2 --note "Starting work"
  AGENT_NAME=CODEX scripts/task.sh done 2 --note "Finished + build/test status"
  scripts/task.sh status
  scripts/task.sh status --mine
  scripts/task.sh status --agent CODEX
  scripts/task.sh next
  scripts/task.sh plan editor-hud-overlay-rework --scope "UI" --files "Sources/ContentView.swift" --note "Initial plan"
  scripts/task.sh finished --last-24h
  scripts/task.sh upcoming --limit 15
  scripts/task.sh blocked --stale-hours 8
  scripts/task.sh summary --last-week
USAGE
}

cmd="${1:-}"
shift || true

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TASKS_DIR="$PROJECT_ROOT/tasks"
TASKS_FILE="$TASKS_DIR/TASKS.md"
DETAILS_DIR="$TASKS_DIR/details"

mkdir -p "$TASKS_DIR" "$DETAILS_DIR"

require_agent_name() {
  if [[ -z "${AGENT_NAME:-}" ]]; then
    echo "AGENT_NAME is required for this command." >&2
    exit 1
  fi
}

timestamp_iso() {
  date -u "+%Y-%m-%dT%H:%M:%SZ"
}

trim_ws() {
  local s="$1"
  s="${s#"${s%%[![:space:]]*}"}"
  s="${s%"${s##*[![:space:]]}"}"
  printf '%s' "$s"
}

slugify() {
  local s="$1"
  s="$(printf '%s' "$s" | tr '[:upper:]' '[:lower:]')"
  s="$(printf '%s' "$s" | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//; s/--+/-/g')"
  if [[ -z "$s" ]]; then
    s="task"
  fi
  printf '%s' "$s"
}

to_epoch() {
  local value="$1"
  local epoch=""
  if epoch="$(TZ=UTC date -j -f "%Y-%m-%dT%H:%M:%SZ" "$value" "+%s" 2>/dev/null)"; then
    echo "$epoch"
    return 0
  fi
  if epoch="$(date -j -f "%Y-%m-%d %H:%M:%S" "$value" "+%s" 2>/dev/null)"; then
    echo "$epoch"
    return 0
  fi
  if epoch="$(date -d "$value" "+%s" 2>/dev/null)"; then
    echo "$epoch"
    return 0
  fi
  return 1
}

start_of_today_epoch() {
  local epoch=""
  if epoch="$(date -j -v0H -v0M -v0S "+%s" 2>/dev/null)"; then
    echo "$epoch"
    return 0
  fi
  if epoch="$(date -d "today 00:00:00" "+%s" 2>/dev/null)"; then
    echo "$epoch"
    return 0
  fi
  local now
  now="$(date +%s)"
  echo $((now - (now % 86400)))
}

start_of_last_month_epoch() {
  local epoch=""
  if epoch="$(date -v-1m "+%s" 2>/dev/null)"; then
    echo "$epoch"
    return 0
  fi
  if epoch="$(date -d "1 month ago" "+%s" 2>/dev/null)"; then
    echo "$epoch"
    return 0
  fi
  local now
  now="$(date +%s)"
  echo $((now - (30 * 86400)))
}

ensure_tasks_file() {
  if [[ ! -f "$TASKS_FILE" ]]; then
    cat > "$TASKS_FILE" <<'TASKS'
# Tasks

## Task IDs

TASKS
  fi
}

list_task_entries() {
  [[ -f "$TASKS_FILE" ]] || return 0
  # Use a non-whitespace delimiter so empty fields are preserved when parsing in bash.
  local delim=$'\034'
  awk '
    BEGIN { delim = sprintf("%c", 28) }
    function trim(s) {
      gsub(/^[[:space:]]+/, "", s)
      gsub(/[[:space:]]+$/, "", s)
      return s
    }
    function emit() {
      if (n == "") return
      if (id == "") id = n "-" slug
      print n delim slug delim id delim scope delim files delim note delim claimed_by delim claimed_at delim done_by delim done_at delim detail
    }
    {
      if ($0 ~ /^[[:space:]]*[0-9]+\.[[:space:]]+/) {
        emit()
        n = $0
        sub(/^[[:space:]]*/, "", n)
        sub(/\..*$/, "", n)
        n = trim(n)

        slug = $0
        sub(/^[[:space:]]*[0-9]+\.[[:space:]]*/, "", slug)
        slug = trim(slug)

        id = scope = files = note = claimed_by = claimed_at = done_by = done_at = detail = ""
        next
      }
      if (n == "") next
      if ($0 ~ /^[[:space:]]+Id:[[:space:]]*/) {
        id = $0
        sub(/^[[:space:]]+Id:[[:space:]]*/, "", id)
        id = trim(id)
        next
      }
      if ($0 ~ /^[[:space:]]+Scope:[[:space:]]*/) {
        scope = $0
        sub(/^[[:space:]]+Scope:[[:space:]]*/, "", scope)
        scope = trim(scope)
        next
      }
      if ($0 ~ /^[[:space:]]+Files:[[:space:]]*/) {
        files = $0
        sub(/^[[:space:]]+Files:[[:space:]]*/, "", files)
        files = trim(files)
        next
      }
      if ($0 ~ /^[[:space:]]+Note:[[:space:]]*/) {
        note = $0
        sub(/^[[:space:]]+Note:[[:space:]]*/, "", note)
        note = trim(note)
        next
      }
      if ($0 ~ /^[[:space:]]+Claimed by:[[:space:]]*/) {
        claimed_by = $0
        sub(/^[[:space:]]+Claimed by:[[:space:]]*/, "", claimed_by)
        claimed_by = trim(claimed_by)
        next
      }
      if ($0 ~ /^[[:space:]]+Claimed at:[[:space:]]*/) {
        claimed_at = $0
        sub(/^[[:space:]]+Claimed at:[[:space:]]*/, "", claimed_at)
        claimed_at = trim(claimed_at)
        next
      }
      if ($0 ~ /^[[:space:]]+Done by:[[:space:]]*/) {
        done_by = $0
        sub(/^[[:space:]]+Done by:[[:space:]]*/, "", done_by)
        done_by = trim(done_by)
        next
      }
      if ($0 ~ /^[[:space:]]+Done at:[[:space:]]*/) {
        done_at = $0
        sub(/^[[:space:]]+Done at:[[:space:]]*/, "", done_at)
        done_at = trim(done_at)
        next
      }
      if ($0 ~ /^[[:space:]]+Detail:[[:space:]]*/) {
        detail = $0
        sub(/^[[:space:]]+Detail:[[:space:]]*/, "", detail)
        detail = trim(detail)
        next
      }
    }
    END { emit() }
  ' "$TASKS_FILE"
}

numbers=()
slugs=()
ids=()
scopes=()
files_arr=()
notes=()
claimed_bys=()
claimed_ats=()
done_bys=()
done_ats=()
details=()

load_tasks() {
  numbers=()
  slugs=()
  ids=()
  scopes=()
  files_arr=()
  notes=()
  claimed_bys=()
  claimed_ats=()
  done_bys=()
  done_ats=()
  details=()

  local n slug id scope files note claimed_by claimed_at done_by done_at detail
  while IFS=$'\034' read -r n slug id scope files note claimed_by claimed_at done_by done_at detail; do
    [[ -n "$n" ]] || continue
    numbers+=("$n")
    slugs+=("$slug")
    ids+=("$id")
    scopes+=("$scope")
    files_arr+=("$files")
    notes+=("$note")
    claimed_bys+=("$claimed_by")
    claimed_ats+=("$claimed_at")
    done_bys+=("$done_by")
    done_ats+=("$done_at")
    details+=("$detail")
  done < <(list_task_entries)
}

write_tasks() {
  {
    echo "# Tasks"
    echo ""
    echo "## Task IDs"
    echo ""

    local i detail_path
    for ((i=0; i<${#numbers[@]}; i++)); do
      echo "${numbers[$i]}. ${slugs[$i]}"
      echo "   Id: ${ids[$i]}"
      if [[ -n "${scopes[$i]}" ]]; then
        echo "   Scope: ${scopes[$i]}"
      fi
      if [[ -n "${files_arr[$i]}" ]]; then
        echo "   Files: ${files_arr[$i]}"
      fi
      if [[ -n "${notes[$i]}" ]]; then
        echo "   Note: ${notes[$i]}"
      fi

      detail_path="${details[$i]}"
      if [[ -z "$detail_path" ]]; then
        detail_path="tasks/details/${ids[$i]}.md"
      fi
      echo "   Detail: $detail_path"

      if [[ -n "${claimed_bys[$i]}" ]]; then
        echo "   Claimed by: ${claimed_bys[$i]}"
      fi
      if [[ -n "${claimed_ats[$i]}" ]]; then
        echo "   Claimed at: ${claimed_ats[$i]}"
      fi
      if [[ -n "${done_bys[$i]}" ]]; then
        echo "   Done by: ${done_bys[$i]}"
      fi
      if [[ -n "${done_ats[$i]}" ]]; then
        echo "   Done at: ${done_ats[$i]}"
      fi
      echo ""
    done
  } > "$TASKS_FILE"
}

next_number() {
  ensure_tasks_file
  load_tasks
  local max=0 n
  for n in "${numbers[@]}"; do
    if [[ "$n" =~ ^[0-9]+$ ]] && (( n > max )); then
      max="$n"
    fi
  done
  echo $((max + 1))
}

resolve_task_index() {
  local query="$1"
  local matches=()
  local i full

  for ((i=0; i<${#numbers[@]}; i++)); do
    full="${numbers[$i]}.${slugs[$i]}"
    if [[ "$query" =~ ^[0-9]+$ ]]; then
      [[ "${numbers[$i]}" == "$query" ]] && matches+=("$i")
    else
      if [[ "${ids[$i]}" == "$query" || "$full" == "$query" ]]; then
        matches+=("$i")
      fi
    fi
  done

  if (( ${#matches[@]} == 0 )); then
    echo "Task not found: $query" >&2
    exit 1
  fi
  if (( ${#matches[@]} > 1 )); then
    echo "Task selector is ambiguous: $query" >&2
    exit 1
  fi

  echo "${matches[0]}"
}

ensure_detail_file() {
  local idx="$1"
  local detail_path="${details[$idx]}"
  if [[ -z "$detail_path" ]]; then
    detail_path="tasks/details/${ids[$idx]}.md"
    details[$idx]="$detail_path"
  fi

  local absolute_path="$PROJECT_ROOT/$detail_path"
  mkdir -p "$(dirname "$absolute_path")"
  if [[ ! -f "$absolute_path" ]]; then
    {
      echo "# ${ids[$idx]}"
      echo ""
      echo "- Number: ${numbers[$idx]}"
      echo "- Slug: ${slugs[$idx]}"
      echo ""
      echo "## Notes"
      echo ""
    } > "$absolute_path"
  fi
}

planning_reasons_for_task() {
  local scope="$1"
  local files="$2"
  local note="$3"
  local reasons=""

  if [[ -z "$scope" ]]; then
    reasons="missing Scope"
  fi

  if [[ -z "$files" ]]; then
    if [[ -n "$reasons" ]]; then
      reasons="$reasons; missing Files"
    else
      reasons="missing Files"
    fi
  fi

  if [[ -z "$note" ]]; then
    if [[ -n "$reasons" ]]; then
      reasons="$reasons; missing Note"
    else
      reasons="missing Note"
    fi
  fi

  if [[ -n "$note" ]]; then
    local note_lc
    note_lc="$(printf '%s' "$note" | tr '[:upper:]' '[:lower:]')"
    if printf '%s' "$note_lc" | grep -Eq '(^|[^a-z])(tbd|todo|fixme|later|pending|unknown|needs plan|to discuss)([^a-z]|$)|\?\?\?'; then
      if [[ -n "$reasons" ]]; then
        reasons="$reasons; placeholder Note"
      else
        reasons="placeholder Note"
      fi
    fi
  fi

  echo "$reasons"
}

looks_blocked_note() {
  local value="$1"
  [[ -z "$value" ]] && return 1
  local text_lc
  text_lc="$(printf '%s' "$value" | tr '[:upper:]' '[:lower:]')"
  printf '%s' "$text_lc" | grep -Eq '(^|[^a-z])(blocked|waiting|stuck|needs human|human input|required review|planning session|awaiting)([^a-z]|$)'
}

resolve_agent_filter() {
  local mine="$1"
  local explicit="$2"
  if (( mine == 1 )); then
    if [[ -z "${AGENT_NAME:-}" ]]; then
      echo "AGENT_NAME is required for --mine." >&2
      exit 1
    fi
    echo "$AGENT_NAME"
    return 0
  fi
  echo "$explicit"
}

command_status() {
  ensure_tasks_file
  load_tasks

  local mine=0
  local explicit_agent=""
  local agent_filter=""
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --mine)
        mine=1
        shift
        ;;
      --agent)
        [[ $# -ge 2 ]] || { echo "Missing value for --agent" >&2; exit 1; }
        explicit_agent="$2"
        shift 2
        ;;
      *)
        echo "Unknown option for status: $1" >&2
        usage
        exit 1
        ;;
    esac
  done

  agent_filter="$(resolve_agent_filter "$mine" "$explicit_agent")"

  local shown=0 i
  for ((i=0; i<${#numbers[@]}; i++)); do
    [[ -n "${done_ats[$i]}" ]] && continue
    [[ -n "${claimed_ats[$i]}" ]] || continue
    if [[ -n "$agent_filter" && "${claimed_bys[$i]}" != "$agent_filter" ]]; then
      continue
    fi

    shown=$((shown + 1))
    if (( shown == 1 )); then
      if [[ -n "$agent_filter" ]]; then
        echo "Active tasks for $agent_filter:"
      else
        echo "Active tasks:"
      fi
    fi

    echo "- ${numbers[$i]}. ${slugs[$i]} | id=${ids[$i]} | claimed by ${claimed_bys[$i]} at ${claimed_ats[$i]}"
    if [[ -n "${notes[$i]}" ]]; then
      echo "  note: ${notes[$i]}"
    fi
  done

  if (( shown == 0 )); then
    if [[ -n "$agent_filter" ]]; then
      echo "No active tasks for $agent_filter."
    else
      echo "No active tasks."
    fi
  fi
}

command_finished() {
  ensure_tasks_file
  load_tasks

  local window="today"
  local days=""
  local limit=0
  local mine=0
  local explicit_agent=""
  local agent_filter=""

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --today)
        window="today"
        shift
        ;;
      --last-24h)
        window="last24"
        shift
        ;;
      --last-week)
        window="lastweek"
        shift
        ;;
      --last-month)
        window="lastmonth"
        shift
        ;;
      --days)
        [[ $# -ge 2 ]] || { echo "Missing value for --days" >&2; exit 1; }
        window="days"
        days="$2"
        shift 2
        ;;
      --limit)
        [[ $# -ge 2 ]] || { echo "Missing value for --limit" >&2; exit 1; }
        limit="$2"
        shift 2
        ;;
      --mine)
        mine=1
        shift
        ;;
      --agent)
        [[ $# -ge 2 ]] || { echo "Missing value for --agent" >&2; exit 1; }
        explicit_agent="$2"
        shift 2
        ;;
      *)
        echo "Unknown option for finished: $1" >&2
        usage
        exit 1
        ;;
    esac
  done

  local now_epoch
  now_epoch="$(date +%s)"
  local start_epoch label
  case "$window" in
    today)
      start_epoch="$(start_of_today_epoch)"
      label="today"
      ;;
    last24)
      start_epoch=$((now_epoch - 86400))
      label="last 24 hours"
      ;;
    lastweek)
      start_epoch=$((now_epoch - (7 * 86400)))
      label="last 7 days"
      ;;
    lastmonth)
      start_epoch="$(start_of_last_month_epoch)"
      label="last month"
      ;;
    days)
      if [[ ! "$days" =~ ^[0-9]+$ || "$days" -le 0 ]]; then
        echo "Invalid --days value: $days" >&2
        exit 1
      fi
      start_epoch=$((now_epoch - (days * 86400)))
      label="last $days days"
      ;;
    *)
      echo "Invalid window: $window" >&2
      exit 1
      ;;
  esac

  if [[ ! "$limit" =~ ^[0-9]+$ ]]; then
    echo "Invalid --limit value: $limit" >&2
    exit 1
  fi

  agent_filter="$(resolve_agent_filter "$mine" "$explicit_agent")"

  local tmp_file
  tmp_file="$(mktemp)"
  local i done_epoch
  for ((i=0; i<${#numbers[@]}; i++)); do
    [[ -n "${done_ats[$i]}" ]] || continue
    if ! done_epoch="$(to_epoch "${done_ats[$i]}")"; then
      continue
    fi
    if (( done_epoch < start_epoch || done_epoch > now_epoch )); then
      continue
    fi
    if [[ -n "$agent_filter" && "${done_bys[$i]}" != "$agent_filter" ]]; then
      continue
    fi
    printf "%s\t%s\t%s\t%s\n" "$done_epoch" "${numbers[$i]}. ${slugs[$i]}" "${done_ats[$i]}" "${done_bys[$i]}" >> "$tmp_file"
  done

  if [[ ! -s "$tmp_file" ]]; then
    echo "No completed tasks in $label."
    rm -f "$tmp_file"
    return 0
  fi

  if [[ -n "$agent_filter" ]]; then
    echo "Completed tasks ($label, agent=$agent_filter):"
  else
    echo "Completed tasks ($label):"
  fi

  local count=0 shown=0
  while IFS=$'\t' read -r _epoch task_label done_at done_by; do
    count=$((count + 1))
    if (( limit > 0 && shown >= limit )); then
      continue
    fi
    shown=$((shown + 1))
    echo "$shown. $task_label | $done_at | by $done_by"
  done < <(sort -nr -k1,1 "$tmp_file")

  if (( limit > 0 && count > shown )); then
    echo "Shown: $shown (limited). Total completed: $count"
  else
    echo "Total completed: $count"
  fi

  rm -f "$tmp_file"
}

command_upcoming() {
  ensure_tasks_file
  load_tasks

  local only_needs_planning=0
  local include_all=0
  local limit=0

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --needs-planning)
        only_needs_planning=1
        shift
        ;;
      --all)
        include_all=1
        shift
        ;;
      --limit)
        [[ $# -ge 2 ]] || { echo "Missing value for --limit" >&2; exit 1; }
        limit="$2"
        shift 2
        ;;
      *)
        echo "Unknown option for upcoming: $1" >&2
        usage
        exit 1
        ;;
    esac
  done

  if [[ ! "$limit" =~ ^[0-9]+$ ]]; then
    echo "Invalid --limit value: $limit" >&2
    exit 1
  fi

  local total=0 i status reasons
  for ((i=0; i<${#numbers[@]}; i++)); do
    if [[ -n "${done_ats[$i]}" ]]; then
      status="done"
    elif [[ -n "${claimed_ats[$i]}" ]]; then
      status="claimed"
    else
      status="todo"
    fi

    if (( include_all == 0 )) && [[ "$status" == "done" ]]; then
      continue
    fi

    reasons="$(planning_reasons_for_task "${scopes[$i]}" "${files_arr[$i]}" "${notes[$i]}")"
    if (( only_needs_planning == 1 )) && [[ -z "$reasons" ]]; then
      continue
    fi

    total=$((total + 1))
    if (( limit == 0 || total <= limit )); then
      echo "$total. ${numbers[$i]}. ${slugs[$i]} | status=$status | id=${ids[$i]}"
      if [[ -n "${scopes[$i]}" ]]; then
        echo "   scope: ${scopes[$i]}"
      fi
      if [[ -n "${files_arr[$i]}" ]]; then
        echo "   files: ${files_arr[$i]}"
      fi
      if [[ -n "$reasons" ]]; then
        echo "   needs-planning: $reasons"
      else
        echo "   needs-planning: no"
      fi
      if [[ -n "${details[$i]}" ]]; then
        echo "   detail: ${details[$i]}"
      fi
    fi
  done

  if (( total == 0 )); then
    if (( only_needs_planning == 1 )); then
      echo "No tasks require additional planning details."
    elif (( include_all == 1 )); then
      echo "No tasks found."
    else
      echo "No upcoming tasks."
    fi
  elif (( limit > 0 && total > limit )); then
    echo "Shown: $limit (limited). Total upcoming: $total"
  fi
}

command_needs_planning() {
  command_upcoming --needs-planning "$@"
}

command_blocked() {
  ensure_tasks_file
  load_tasks

  local stale_hours=24
  local limit=0

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --stale-hours)
        [[ $# -ge 2 ]] || { echo "Missing value for --stale-hours" >&2; exit 1; }
        stale_hours="$2"
        shift 2
        ;;
      --limit)
        [[ $# -ge 2 ]] || { echo "Missing value for --limit" >&2; exit 1; }
        limit="$2"
        shift 2
        ;;
      *)
        echo "Unknown option for blocked: $1" >&2
        usage
        exit 1
        ;;
    esac
  done

  if [[ ! "$stale_hours" =~ ^[0-9]+$ ]]; then
    echo "Invalid --stale-hours value: $stale_hours" >&2
    exit 1
  fi
  if [[ ! "$limit" =~ ^[0-9]+$ ]]; then
    echo "Invalid --limit value: $limit" >&2
    exit 1
  fi

  local now_epoch stale_seconds
  now_epoch="$(date +%s)"
  stale_seconds=$((stale_hours * 3600))

  local total=0 i reasons blocked_reasons claimed_epoch
  for ((i=0; i<${#numbers[@]}; i++)); do
    [[ -n "${done_ats[$i]}" ]] && continue

    blocked_reasons=""
    reasons="$(planning_reasons_for_task "${scopes[$i]}" "${files_arr[$i]}" "${notes[$i]}")"
    if [[ -n "$reasons" ]]; then
      blocked_reasons="planning: $reasons"
    fi

    if looks_blocked_note "${notes[$i]}"; then
      if [[ -n "$blocked_reasons" ]]; then
        blocked_reasons="$blocked_reasons; note indicates blocker"
      else
        blocked_reasons="note indicates blocker"
      fi
    fi

    if [[ -n "${claimed_ats[$i]}" ]] && claimed_epoch="$(to_epoch "${claimed_ats[$i]}")"; then
      if (( now_epoch - claimed_epoch > stale_seconds )); then
        if [[ -n "$blocked_reasons" ]]; then
          blocked_reasons="$blocked_reasons; stale claim > ${stale_hours}h"
        else
          blocked_reasons="stale claim > ${stale_hours}h"
        fi
      fi
    fi

    [[ -n "$blocked_reasons" ]] || continue

    total=$((total + 1))
    if (( limit == 0 || total <= limit )); then
      echo "$total. ${numbers[$i]}. ${slugs[$i]} | id=${ids[$i]}"
      echo "   blocked: $blocked_reasons"
      if [[ -n "${claimed_ats[$i]}" ]]; then
        echo "   claimed: ${claimed_bys[$i]} at ${claimed_ats[$i]}"
      fi
    fi
  done

  if (( total == 0 )); then
    echo "No blocked tasks."
  elif (( limit > 0 && total > limit )); then
    echo "Shown: $limit (limited). Total blocked: $total"
  fi
}

command_summary() {
  local finished_args=()
  local upcoming_limit=15
  local blocked_limit=15
  local finished_limit=20
  local mine=0
  local explicit_agent=""
  local agent_filter=""

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --today|--last-24h|--last-week|--last-month)
        finished_args+=("$1")
        shift
        ;;
      --days)
        [[ $# -ge 2 ]] || { echo "Missing value for --days" >&2; exit 1; }
        finished_args+=("$1" "$2")
        shift 2
        ;;
      --upcoming-limit)
        [[ $# -ge 2 ]] || { echo "Missing value for --upcoming-limit" >&2; exit 1; }
        upcoming_limit="$2"
        shift 2
        ;;
      --blocked-limit)
        [[ $# -ge 2 ]] || { echo "Missing value for --blocked-limit" >&2; exit 1; }
        blocked_limit="$2"
        shift 2
        ;;
      --finished-limit)
        [[ $# -ge 2 ]] || { echo "Missing value for --finished-limit" >&2; exit 1; }
        finished_limit="$2"
        shift 2
        ;;
      --mine)
        mine=1
        shift
        ;;
      --agent)
        [[ $# -ge 2 ]] || { echo "Missing value for --agent" >&2; exit 1; }
        explicit_agent="$2"
        shift 2
        ;;
      *)
        echo "Unknown option for summary: $1" >&2
        usage
        exit 1
        ;;
    esac
  done

  agent_filter="$(resolve_agent_filter "$mine" "$explicit_agent")"

  echo "== Current =="
  if [[ -n "$agent_filter" ]]; then
    "$0" status --agent "$agent_filter"
  else
    "$0" status
  fi
  echo ""
  echo "== Blocked =="
  "$0" blocked --limit "$blocked_limit"
  echo ""
  echo "== Upcoming =="
  "$0" upcoming --limit "$upcoming_limit"
  echo ""
  echo "== Completed =="
  if [[ -n "$agent_filter" ]]; then
    "$0" finished "${finished_args[@]}" --agent "$agent_filter" --limit "$finished_limit"
  else
    "$0" finished "${finished_args[@]}" --limit "$finished_limit"
  fi
}

case "$cmd" in
  claim)
    require_agent_name
    ensure_tasks_file
    load_tasks

    task_query="${1:-}"
    shift || true
    note=""
    while [[ $# -gt 0 ]]; do
      case "$1" in
        --note)
          note="$2"
          shift 2
          ;;
        *)
          shift
          ;;
      esac
    done

    if [[ -z "$task_query" ]]; then
      echo "Missing task id/number." >&2
      usage
      exit 1
    fi

    idx="$(resolve_task_index "$task_query")"
    if [[ -n "${done_ats[$idx]}" ]]; then
      echo "Task already completed: ${numbers[$idx]}. ${slugs[$idx]}" >&2
      exit 1
    fi

    claimed_bys[$idx]="$AGENT_NAME"
    claimed_ats[$idx]="$(timestamp_iso)"
    if [[ -n "$note" ]]; then
      notes[$idx]="$note"
    fi

    ensure_detail_file "$idx"
    write_tasks

    echo "Claimed: ${numbers[$idx]}. ${slugs[$idx]}"
    ;;

  done)
    require_agent_name
    ensure_tasks_file
    load_tasks

    task_query="${1:-}"
    shift || true
    note=""
    while [[ $# -gt 0 ]]; do
      case "$1" in
        --note)
          note="$2"
          shift 2
          ;;
        *)
          shift
          ;;
      esac
    done

    if [[ -z "$task_query" ]]; then
      echo "Missing task id/number." >&2
      usage
      exit 1
    fi

    idx="$(resolve_task_index "$task_query")"

    if [[ -z "${claimed_bys[$idx]}" ]]; then
      claimed_bys[$idx]="$AGENT_NAME"
      claimed_ats[$idx]="$(timestamp_iso)"
    fi

    done_bys[$idx]="$AGENT_NAME"
    done_ats[$idx]="$(timestamp_iso)"
    if [[ -n "$note" ]]; then
      notes[$idx]="$note"
    fi

    ensure_detail_file "$idx"
    write_tasks

    echo "Done: ${numbers[$idx]}. ${slugs[$idx]}"
    ;;

  status)
    command_status "$@"
    ;;

  next)
    next_number
    ;;

  plan)
    ensure_tasks_file
    load_tasks

    slug_input="${1:-}"
    shift || true
    scope=""
    files=""
    note=""
    while [[ $# -gt 0 ]]; do
      case "$1" in
        --scope)
          scope="$2"
          shift 2
          ;;
        --files)
          files="$2"
          shift 2
          ;;
        --note)
          note="$2"
          shift 2
          ;;
        *)
          shift
          ;;
      esac
    done

    if [[ -z "$slug_input" ]]; then
      echo "Missing task slug." >&2
      usage
      exit 1
    fi

    slug="$(slugify "$slug_input")"
    number="$(next_number)"
    id="${number}-${slug}"

    numbers+=("$number")
    slugs+=("$slug")
    ids+=("$id")
    scopes+=("$scope")
    files_arr+=("$files")
    notes+=("$note")
    claimed_bys+=("")
    claimed_ats+=("")
    done_bys+=("")
    done_ats+=("")
    details+=("tasks/details/${id}.md")

    idx=$((${#numbers[@]} - 1))
    ensure_detail_file "$idx"
    write_tasks

    echo "${number}.${slug}"
    ;;

  finished)
    command_finished "$@"
    ;;

  upcoming)
    command_upcoming "$@"
    ;;

  needs-planning)
    command_needs_planning "$@"
    ;;

  blocked)
    command_blocked "$@"
    ;;

  summary)
    command_summary "$@"
    ;;

  learn)
    if [[ -f "$PROJECT_ROOT/Learnings.md" ]]; then
      cat "$PROJECT_ROOT/Learnings.md"
    else
      echo "No Learnings.md found."
    fi
    ;;

  ""|help|-h|--help)
    usage
    exit 0
    ;;

  *)
    echo "Unknown command: $cmd" >&2
    usage
    exit 1
    ;;
esac
