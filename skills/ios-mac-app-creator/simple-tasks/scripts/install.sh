#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<USAGE
Usage: install.sh --project-dir PATH [--mode install|upgrade] [--dry-run]
USAGE
}

PROJECT_DIR=""
MODE="install"
DRY_RUN=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project-dir)
      PROJECT_DIR="$2"
      shift 2
      ;;
    --mode)
      MODE="$2"
      shift 2
      ;;
    --dry-run)
      DRY_RUN=1
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
  echo "Missing --project-dir" >&2
  usage
  exit 1
fi

if [[ "$MODE" != "install" && "$MODE" != "upgrade" ]]; then
  echo "Invalid mode: $MODE" >&2
  usage
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_ROOT="$SCRIPT_DIR/../templates/simple-tasks"

TASK_SCRIPT_TARGET="$PROJECT_DIR/scripts/task.sh"
AGENTS_TARGET="$PROJECT_DIR/AGENTS.md"
AGENTS_FRAGMENT_TARGET="$PROJECT_DIR/AGENTS.simple-tasks.md"
TASKS_FILE="$PROJECT_DIR/tasks/TASKS.md"
DETAILS_DIR="$PROJECT_DIR/tasks/details"

if [[ -e "$TASK_SCRIPT_TARGET" && "$MODE" == "install" ]]; then
  echo "Refusing to overwrite existing $TASK_SCRIPT_TARGET in install mode." >&2
  echo "Re-run with --mode upgrade to replace it." >&2
  exit 1
fi

if [[ $DRY_RUN -eq 1 ]]; then
  echo "[dry-run] Would install simple-tasks"
  echo "[dry-run]   project: $PROJECT_DIR"
  echo "[dry-run]   script:  $TASK_SCRIPT_TARGET"
  if [[ -f "$AGENTS_TARGET" ]]; then
    echo "[dry-run]   agents:  $AGENTS_FRAGMENT_TARGET"
  else
    echo "[dry-run]   agents:  $AGENTS_TARGET"
  fi
  if [[ ! -f "$TASKS_FILE" ]]; then
    echo "[dry-run]   tasks:   $TASKS_FILE (new)"
  fi
  exit 0
fi

mkdir -p "$PROJECT_DIR/scripts"
cp "$TEMPLATE_ROOT/scripts/task.sh" "$TASK_SCRIPT_TARGET"
chmod +x "$TASK_SCRIPT_TARGET"

if [[ -f "$AGENTS_TARGET" ]]; then
  cp "$TEMPLATE_ROOT/AGENTS.md" "$AGENTS_FRAGMENT_TARGET"
  echo "Note: AGENTS.md exists. Wrote fragment to $AGENTS_FRAGMENT_TARGET"
else
  cp "$TEMPLATE_ROOT/AGENTS.md" "$AGENTS_TARGET"
fi

mkdir -p "$DETAILS_DIR"
if [[ ! -f "$TASKS_FILE" ]]; then
  cat > "$TASKS_FILE" <<'TASKS'
# Tasks

## Task IDs

TASKS
fi

echo "Installed simple-tasks to $PROJECT_DIR"
