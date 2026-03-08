#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<USAGE
Usage: stabilize_project.sh --project-dir PATH [--agent-mode single|multi] [--agent-name NAME] [--skip-build] [--skip-commit]
USAGE
}

PROJECT_DIR=""
AGENT_MODE_INPUT="${AGENT_MODE:-single}"
AGENT_NAME_INPUT="${AGENT_NAME:-}"
SKIP_BUILD=0
SKIP_COMMIT=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project-dir)
      PROJECT_DIR="$2"
      shift 2
      ;;
    --agent-mode)
      AGENT_MODE_INPUT="$2"
      shift 2
      ;;
    --agent-name)
      AGENT_NAME_INPUT="$2"
      shift 2
      ;;
    --skip-build)
      SKIP_BUILD=1
      shift
      ;;
    --skip-commit)
      SKIP_COMMIT=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
 done

if [[ -z "$PROJECT_DIR" ]]; then
  echo "Missing required arguments." >&2
  usage
  exit 1
fi

if [[ ! -d "$PROJECT_DIR" ]]; then
  echo "Project directory not found: $PROJECT_DIR" >&2
  exit 1
fi

if [[ "$AGENT_MODE_INPUT" != "single" && "$AGENT_MODE_INPUT" != "multi" ]]; then
  echo "Invalid --agent-mode: $AGENT_MODE_INPUT (expected single or multi)." >&2
  usage
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MOVE_TO_TRASH="$SCRIPT_DIR/move_to_trash.sh"

ensure_git_repo() {
  if [[ -d "$PROJECT_DIR/.git" ]]; then
    return 0
  fi
  echo "Initializing git repository..."
  (cd "$PROJECT_DIR" && git init >/dev/null)
}

ensure_gitignore() {
  local gitignore_path="$PROJECT_DIR/.gitignore"
  if [[ -f "$gitignore_path" ]]; then
    return 0
  fi
  cat > "$gitignore_path" <<'GITIGNORE'
# Xcode
.DS_Store
build/
DerivedData/
*.xcworkspace/xcuserdata/
*.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings
*.xcodeproj/xcuserdata/

# SwiftPM / build artifacts
.build/

# Codex / agents runtime
.codex/
agents/locks/
agents/current_name.txt
tasks/claims/
tasks/locks/

# Logs
*.log
GITIGNORE
}

assign_agent_name() {
  local current_file="$PROJECT_DIR/agents/current_name.txt"
  mkdir -p "$(dirname "$current_file")"

  if [[ "$AGENT_MODE_INPUT" == "single" ]]; then
    local single_name="${AGENT_NAME_INPUT:-CODEX}"
    echo "$single_name" > "$current_file"
    export AGENT_NAME="$single_name"
    echo "Agent mode: single (name: $single_name)"
    return 0
  fi

  local agent_name="${AGENT_NAME_INPUT:-}"
  local checkout_script="$PROJECT_DIR/scripts/agent_checkout_name.sh"
  if [[ -x "$checkout_script" ]]; then
    if [[ -n "$agent_name" ]]; then
      name_out="$("$checkout_script" "$agent_name" 2>/dev/null || true)"
    else
      name_out="$("$checkout_script" 2>/dev/null || true)"
    fi
    if [[ -n "$name_out" ]]; then
      export AGENT_NAME="$name_out"
      echo "Agent mode: multi (name: $name_out)"
      return 0
    fi
  fi

  local fallback_name="${agent_name:-CODEX}"
  export AGENT_NAME="$fallback_name"
  echo "$fallback_name" > "$current_file"
  echo "Warning: could not lock multi-agent name. Falling back to '$fallback_name'." >&2
}

run_stabilize_build() {
  if [[ $SKIP_BUILD -eq 1 ]]; then
    echo "Skipping build/test stabilization (--skip-build)."
    return 0
  fi

  echo "Running stabilization diagnose/build/test..."
  (cd "$PROJECT_DIR" && make diagnose)
  (cd "$PROJECT_DIR" && make build)
  (cd "$PROJECT_DIR" && make test)
}

baseline_commit() {
  if [[ $SKIP_COMMIT -eq 1 ]]; then
    echo "Skipping baseline commit (--skip-commit)."
    return 0
  fi

  if [[ ! -d "$PROJECT_DIR/.git" ]]; then
    return 0
  fi

  if (cd "$PROJECT_DIR" && git rev-parse --verify HEAD >/dev/null 2>&1); then
    return 0
  fi

  if ! (cd "$PROJECT_DIR" && git config user.email >/dev/null 2>&1); then
    (cd "$PROJECT_DIR" && git config user.email "app-creator@local")
  fi

  if ! (cd "$PROJECT_DIR" && git config user.name >/dev/null 2>&1); then
    (cd "$PROJECT_DIR" && git config user.name "AppCreator")
  fi

  if ! (cd "$PROJECT_DIR" && git status --porcelain | grep -q .); then
    return 0
  fi

  echo "Creating baseline commit..."
  (cd "$PROJECT_DIR" && git add -A && git commit -m "Baseline scaffold" >/dev/null)
}

ensure_git_repo
ensure_gitignore
assign_agent_name
run_stabilize_build
baseline_commit

echo "Stabilization complete: $PROJECT_DIR"
