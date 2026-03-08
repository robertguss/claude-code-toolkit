#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<USAGE
Usage: scaffold_app.sh [options]

New project mode:
  --project-mode new \
  --name "AppName" \
  --bundle-id "com.example.AppName" \
  --platform ios|macos \
  --ui swiftui|uikit|appkit \
  --output /path/to/output

Adopt existing mode:
  --project-mode adopt \
  --output /path/to/project

Options:
  --agent-name NAME
  --regenerate
  --deployment-target 18.0|15.4
  --sim-name "iPhone 16"
  --git-init auto|never
  --git-commit prompt|always|never
  --with-xcode-makefiles | --skip-xcode-makefiles
  --with-simple-tasks | --skip-simple-tasks
  --dry-run
USAGE
}

PROJECT_MODE="new"
APP_NAME=""
BUNDLE_ID=""
PLATFORM=""
UI="swiftui"
OUTPUT=""
DEPLOYMENT_TARGET=""
SIM_NAME=""
AGENT_NAME_INPUT="${AGENT_NAME:-}"
REGENERATE=0
INSTALL_XCODE_MAKEFILES=1
INSTALL_SIMPLE_TASKS=1
GIT_INIT_MODE="auto"
GIT_COMMIT_MODE="prompt"
DRY_RUN=0
PREEXISTING_GIT_REPO=0
PREEXISTING_DIRTY=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project-mode)
      PROJECT_MODE="$2"
      shift 2
      ;;
    --name)
      APP_NAME="$2"
      shift 2
      ;;
    --bundle-id)
      BUNDLE_ID="$2"
      shift 2
      ;;
    --platform)
      PLATFORM="$2"
      shift 2
      ;;
    --ui)
      UI="$2"
      shift 2
      ;;
    --output)
      OUTPUT="$2"
      shift 2
      ;;
    --agent-name)
      AGENT_NAME_INPUT="$2"
      shift 2
      ;;
    --regenerate)
      REGENERATE=1
      shift
      ;;
    --deployment-target)
      DEPLOYMENT_TARGET="$2"
      shift 2
      ;;
    --sim-name)
      SIM_NAME="$2"
      shift 2
      ;;
    --git-init)
      GIT_INIT_MODE="$2"
      shift 2
      ;;
    --git-commit)
      GIT_COMMIT_MODE="$2"
      shift 2
      ;;
    --with-xcode-makefiles)
      INSTALL_XCODE_MAKEFILES=1
      shift
      ;;
    --skip-xcode-makefiles)
      INSTALL_XCODE_MAKEFILES=0
      shift
      ;;
    --with-simple-tasks)
      INSTALL_SIMPLE_TASKS=1
      shift
      ;;
    --skip-simple-tasks)
      INSTALL_SIMPLE_TASKS=0
      shift
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

if [[ "$PROJECT_MODE" != "new" && "$PROJECT_MODE" != "adopt" ]]; then
  echo "Invalid --project-mode: $PROJECT_MODE (expected new or adopt)." >&2
  exit 1
fi

if [[ "$GIT_INIT_MODE" != "auto" && "$GIT_INIT_MODE" != "never" ]]; then
  echo "Invalid --git-init: $GIT_INIT_MODE (expected auto or never)." >&2
  exit 1
fi

if [[ "$GIT_COMMIT_MODE" != "prompt" && "$GIT_COMMIT_MODE" != "always" && "$GIT_COMMIT_MODE" != "never" ]]; then
  echo "Invalid --git-commit: $GIT_COMMIT_MODE (expected prompt, always, or never)." >&2
  exit 1
fi

if [[ -z "$OUTPUT" ]]; then
  echo "Missing --output" >&2
  usage
  exit 1
fi

if [[ -d "$OUTPUT" ]] && git -C "$OUTPUT" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  PREEXISTING_GIT_REPO=1
  if [[ -n "$(git -C "$OUTPUT" status --porcelain 2>/dev/null)" ]]; then
    PREEXISTING_DIRTY=1
  fi
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
XCODE_INSTALLER="$SKILLS_ROOT/xcode-makefiles/scripts/install.sh"
TASK_INSTALLER="$SKILLS_ROOT/simple-tasks/scripts/install.sh"

if [[ $INSTALL_XCODE_MAKEFILES -eq 1 && ! -x "$XCODE_INSTALLER" ]]; then
  echo "Missing xcode-makefiles installer at $XCODE_INSTALLER" >&2
  exit 1
fi

if [[ $INSTALL_SIMPLE_TASKS -eq 1 && ! -x "$TASK_INSTALLER" ]]; then
  echo "Missing simple-tasks installer at $TASK_INSTALLER" >&2
  exit 1
fi

if [[ "$PROJECT_MODE" == "new" ]]; then
  if [[ -z "$APP_NAME" || -z "$BUNDLE_ID" || -z "$PLATFORM" ]]; then
    echo "Missing required arguments for new mode: --name, --bundle-id, --platform" >&2
    usage
    exit 1
  fi

  if [[ "$PLATFORM" != "ios" && "$PLATFORM" != "macos" ]]; then
    echo "Invalid platform: $PLATFORM" >&2
    exit 1
  fi

  if [[ "$UI" != "swiftui" && "$UI" != "uikit" && "$UI" != "appkit" ]]; then
    echo "Invalid UI: $UI" >&2
    exit 1
  fi

  if [[ "$PLATFORM" == "ios" && "$UI" == "appkit" ]]; then
    echo "AppKit is not valid for iOS." >&2
    exit 1
  fi

  if [[ "$PLATFORM" == "macos" && "$UI" == "uikit" ]]; then
    echo "UIKit is not valid for macOS." >&2
    exit 1
  fi

  if [[ -z "$DEPLOYMENT_TARGET" ]]; then
    if [[ "$PLATFORM" == "ios" ]]; then
      DEPLOYMENT_TARGET="18.0"
    else
      DEPLOYMENT_TARGET="15.4"
    fi
  fi

  if [[ -z "$SIM_NAME" && "$PLATFORM" == "ios" ]]; then
    SIM_NAME="auto"
  fi

  TEMPLATE_ROOT="$SCRIPT_DIR/../templates/xcodegen"
  RENDER="$SCRIPT_DIR/render_template.py"
  TEMPLATE_DIR="$TEMPLATE_ROOT/${PLATFORM}-${UI}"

  if [[ ! -d "$TEMPLATE_DIR" ]]; then
    echo "Template not found: $TEMPLATE_DIR" >&2
    exit 1
  fi

  existing_project=0
  if [[ -d "$OUTPUT" ]]; then
    if ls "$OUTPUT"/*.xcodeproj >/dev/null 2>&1 || ls "$OUTPUT"/*.xcworkspace >/dev/null 2>&1; then
      existing_project=1
    fi
  fi

  if [[ -e "$OUTPUT" && -n "$(ls -A "$OUTPUT" 2>/dev/null)" ]]; then
    if [[ $existing_project -eq 1 && $REGENERATE -eq 0 ]]; then
      echo "Existing Xcode project detected in $OUTPUT. Skipping regeneration." >&2
    else
      echo "Output directory exists and is not empty: $OUTPUT" >&2
      if [[ $existing_project -eq 1 ]]; then
        echo "Use --regenerate to refresh an existing project in-place." >&2
      else
        echo "Use an empty output directory to generate a new project." >&2
      fi
      exit 1
    fi
  fi

  if [[ $DRY_RUN -eq 1 ]]; then
    echo "[dry-run] New project scaffold"
    echo "[dry-run]   output: $OUTPUT"
    echo "[dry-run]   app:    $APP_NAME"
    echo "[dry-run]   bundle: $BUNDLE_ID"
    echo "[dry-run]   mode:   $PROJECT_MODE"
  else
    mkdir -p "$OUTPUT"

    if [[ $existing_project -eq 0 || $REGENERATE -eq 1 ]]; then
      python3 "$RENDER" \
        --src "$TEMPLATE_DIR" \
        --dst "$OUTPUT" \
        --var APP_NAME="$APP_NAME" \
        --var BUNDLE_ID="$BUNDLE_ID" \
        --var DEPLOYMENT_TARGET="$DEPLOYMENT_TARGET" \
        --var SIM_NAME="$SIM_NAME" \
        --var PLATFORM="$PLATFORM"
    fi

    pushd "$OUTPUT" >/dev/null
    USER_NAME="${USER:-${LOGNAME:-$(id -un 2>/dev/null || whoami)}}"
    if [[ $existing_project -eq 0 || $REGENERATE -eq 1 ]]; then
      USER="${USER:-$USER_NAME}" LOGNAME="${LOGNAME:-$USER_NAME}" xcodegen generate
    fi
    popd >/dev/null
  fi
else
  if [[ ! -d "$OUTPUT" ]]; then
    echo "Adopt mode requires an existing --output directory: $OUTPUT" >&2
    exit 1
  fi

  if [[ $INSTALL_XCODE_MAKEFILES -eq 1 ]]; then
    if [[ -z "$APP_NAME" ]]; then
      detected_project="$(ls "$OUTPUT"/*.xcodeproj 2>/dev/null | head -n 1 || true)"
      if [[ -n "$detected_project" ]]; then
        APP_NAME="$(basename "$detected_project" .xcodeproj)"
      fi
    fi

    if [[ -z "$APP_NAME" ]]; then
      echo "Adopt mode with xcode-makefiles requires --name or an existing .xcodeproj." >&2
      exit 1
    fi

    if [[ -z "$PLATFORM" ]]; then
      echo "Adopt mode with xcode-makefiles requires --platform ios|macos." >&2
      exit 1
    fi
  fi

  if [[ $DRY_RUN -eq 1 ]]; then
    echo "[dry-run] Adopt existing project"
    echo "[dry-run]   output: $OUTPUT"
  fi
fi

prompt_yes_default_yes() {
  local prompt="$1"
  local input=""
  read -r -p "$prompt [Y/n]: " input
  input="$(printf '%s' "$input" | tr '[:upper:]' '[:lower:]')"
  if [[ -z "$input" || "$input" == "y" || "$input" == "yes" ]]; then
    return 0
  fi
  return 1
}

apply_git_lifecycle() {
  if [[ $DRY_RUN -eq 1 ]]; then
    if [[ "$GIT_INIT_MODE" == "auto" ]]; then
      echo "[dry-run] Would initialize git repository if missing."
    fi
    if [[ "$GIT_COMMIT_MODE" != "never" ]]; then
      echo "[dry-run] Would evaluate auto-commit policy: $GIT_COMMIT_MODE"
    fi
    return 0
  fi

  local in_repo=0
  if git -C "$OUTPUT" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    in_repo=1
  fi

  if [[ $in_repo -eq 0 && "$GIT_INIT_MODE" == "auto" ]]; then
    git -C "$OUTPUT" init >/dev/null
    in_repo=1
    echo "Initialized git repository in $OUTPUT"
  fi

  if [[ $in_repo -eq 0 || "$GIT_COMMIT_MODE" == "never" ]]; then
    return 0
  fi

  if [[ $PREEXISTING_DIRTY -eq 1 ]]; then
    echo "Skipping auto-commit: repository had pre-existing uncommitted changes." >&2
    return 0
  fi

  if [[ -z "$(git -C "$OUTPUT" status --porcelain 2>/dev/null)" ]]; then
    echo "No git changes to commit."
    return 0
  fi

  local should_commit=0
  case "$GIT_COMMIT_MODE" in
    always)
      should_commit=1
      ;;
    prompt)
      if prompt_yes_default_yes "Commit generated/adopted changes now?"; then
        should_commit=1
      fi
      ;;
  esac

  if [[ $should_commit -eq 0 ]]; then
    echo "Skipped auto-commit."
    return 0
  fi

  local commit_message=""
  if [[ "$PROJECT_MODE" == "new" ]]; then
    commit_message="chore: scaffold project with app-creator"
  else
    commit_message="chore: install app-creator subskills"
  fi

  git -C "$OUTPUT" add -A
  if git -C "$OUTPUT" commit -m "$commit_message" >/dev/null 2>&1; then
    echo "Created baseline commit: $commit_message"
  else
    echo "Auto-commit failed. Check git identity/config and commit manually." >&2
  fi
}

SUBSKILL_MODE="install"
if [[ "$PROJECT_MODE" == "adopt" ]]; then
  SUBSKILL_MODE="upgrade"
fi

if [[ $INSTALL_XCODE_MAKEFILES -eq 1 ]]; then
  xcode_args=(
    --project-dir "$OUTPUT"
    --app-name "$APP_NAME"
    --platform "$PLATFORM"
    --mode "$SUBSKILL_MODE"
  )
  if [[ -n "$SIM_NAME" ]]; then
    xcode_args+=(--sim-name "$SIM_NAME")
  fi
  if [[ $DRY_RUN -eq 1 ]]; then
    xcode_args+=(--dry-run)
  fi

  "$XCODE_INSTALLER" "${xcode_args[@]}"
fi

if [[ $INSTALL_SIMPLE_TASKS -eq 1 ]]; then
  task_args=(
    --project-dir "$OUTPUT"
    --mode "$SUBSKILL_MODE"
  )
  if [[ $DRY_RUN -eq 1 ]]; then
    task_args+=(--dry-run)
  fi

  "$TASK_INSTALLER" "${task_args[@]}"
fi

apply_git_lifecycle

echo ""
echo "App creator orchestration complete: $OUTPUT"
echo ""
echo "Next commands:"
echo "  cd $OUTPUT"
if [[ $INSTALL_XCODE_MAKEFILES -eq 1 ]]; then
  echo "  make diagnose"
  echo "  make build"
  echo "  make test"
fi
if [[ $INSTALL_SIMPLE_TASKS -eq 1 ]]; then
  echo "  scripts/task.sh summary --last-24h"
fi
