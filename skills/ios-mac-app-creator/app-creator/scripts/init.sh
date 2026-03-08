#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<USAGE
Usage: init.sh [options]

Options:
  --project-mode new|adopt
  --name "AppName"
  --bundle-id "com.example.AppName"
  --platform ios|macos
  --ui swiftui|uikit|appkit
  --output /path/to/output
  --agent-name NAME
  --deployment-target 18.0|15.4
  --sim-name "iPhone 16"
  --git-init auto|never
  --git-commit prompt|always|never
  --with-xcode-makefiles | --skip-xcode-makefiles
  --with-simple-tasks | --skip-simple-tasks
  --dry-run
  --no-prompt
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
INSTALL_XCODE_MAKEFILES=1
INSTALL_SIMPLE_TASKS=1
GIT_INIT_MODE="auto"
GIT_COMMIT_MODE="prompt"
DRY_RUN=0
NO_PROMPT=0

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
    --no-prompt)
      NO_PROMPT=1
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

if [[ "$GIT_INIT_MODE" != "auto" && "$GIT_INIT_MODE" != "never" ]]; then
  echo "Invalid --git-init: $GIT_INIT_MODE (expected auto or never)." >&2
  usage
  exit 1
fi

if [[ "$GIT_COMMIT_MODE" != "prompt" && "$GIT_COMMIT_MODE" != "always" && "$GIT_COMMIT_MODE" != "never" ]]; then
  echo "Invalid --git-commit: $GIT_COMMIT_MODE (expected prompt, always, or never)." >&2
  usage
  exit 1
fi

prompt_if_missing() {
  local prompt="$1"
  local current="$2"
  local default="$3"

  if [[ -n "$current" ]]; then
    echo "$current"
    return 0
  fi

  if [[ $NO_PROMPT -eq 1 ]]; then
    echo "$default"
    return 0
  fi

  local input
  if [[ -n "$default" ]]; then
    read -r -p "$prompt [$default]: " input
    input="${input:-$default}"
  else
    read -r -p "$prompt: " input
  fi

  echo "$input"
}

prompt_yes_no() {
  local prompt="$1"
  local default="$2"
  local current="$3"

  if [[ "$current" == "0" || "$current" == "1" ]]; then
    echo "$current"
    return 0
  fi

  if [[ $NO_PROMPT -eq 1 ]]; then
    echo "$default"
    return 0
  fi

  local hint="Y/n"
  if [[ "$default" == "0" ]]; then
    hint="y/N"
  fi

  local input
  read -r -p "$prompt [$hint]: " input
  input="$(printf '%s' "$input" | tr '[:upper:]' '[:lower:]')"

  if [[ -z "$input" ]]; then
    echo "$default"
  elif [[ "$input" == "y" || "$input" == "yes" ]]; then
    echo "1"
  else
    echo "0"
  fi
}

PROJECT_MODE="$(prompt_if_missing "Project mode (new|adopt)" "$PROJECT_MODE" "new")"
if [[ "$PROJECT_MODE" != "new" && "$PROJECT_MODE" != "adopt" ]]; then
  echo "Invalid project mode: $PROJECT_MODE" >&2
  usage
  exit 1
fi

OUTPUT="$(prompt_if_missing "Project output directory" "$OUTPUT" "")"
if [[ -z "$OUTPUT" ]]; then
  echo "Missing output directory." >&2
  usage
  exit 1
fi

if [[ "$PROJECT_MODE" == "new" ]]; then
  APP_NAME="$(prompt_if_missing "App name" "$APP_NAME" "")"
  BUNDLE_ID="$(prompt_if_missing "Bundle id" "$BUNDLE_ID" "")"
  PLATFORM="$(prompt_if_missing "Platform (ios|macos)" "$PLATFORM" "ios")"
  UI="$(prompt_if_missing "UI (swiftui|uikit|appkit)" "$UI" "swiftui")"
else
  if [[ $INSTALL_XCODE_MAKEFILES -eq 1 ]]; then
    APP_NAME="$(prompt_if_missing "App name (for Makefile scheme defaults)" "$APP_NAME" "")"
    PLATFORM="$(prompt_if_missing "Platform for project (ios|macos)" "$PLATFORM" "macos")"
  fi
fi

if [[ -z "$AGENT_NAME_INPUT" ]]; then
  AGENT_NAME_INPUT="CODEX"
fi

INSTALL_XCODE_MAKEFILES="$(prompt_yes_no "Install xcode-makefiles toolkit" "1" "$INSTALL_XCODE_MAKEFILES")"
INSTALL_SIMPLE_TASKS="$(prompt_yes_no "Install simple-tasks workflow" "1" "$INSTALL_SIMPLE_TASKS")"
GIT_INIT_MODE="$(prompt_if_missing "Git init behavior (auto|never)" "$GIT_INIT_MODE" "auto")"
GIT_COMMIT_MODE="$(prompt_if_missing "Baseline commit behavior (prompt|always|never)" "$GIT_COMMIT_MODE" "prompt")"

if [[ "$GIT_INIT_MODE" != "auto" && "$GIT_INIT_MODE" != "never" ]]; then
  echo "Invalid git init behavior: $GIT_INIT_MODE" >&2
  exit 1
fi

if [[ "$GIT_COMMIT_MODE" != "prompt" && "$GIT_COMMIT_MODE" != "always" && "$GIT_COMMIT_MODE" != "never" ]]; then
  echo "Invalid baseline commit behavior: $GIT_COMMIT_MODE" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $DRY_RUN -eq 0 ]]; then
  "$SCRIPT_DIR/doctor.sh"
fi

scaffold_args=(
  --project-mode "$PROJECT_MODE"
  --output "$OUTPUT"
)

if [[ -n "$APP_NAME" ]]; then
  scaffold_args+=(--name "$APP_NAME")
fi
if [[ -n "$BUNDLE_ID" ]]; then
  scaffold_args+=(--bundle-id "$BUNDLE_ID")
fi
if [[ -n "$PLATFORM" ]]; then
  scaffold_args+=(--platform "$PLATFORM")
fi
if [[ -n "$UI" ]]; then
  scaffold_args+=(--ui "$UI")
fi
if [[ -n "$AGENT_NAME_INPUT" ]]; then
  scaffold_args+=(--agent-name "$AGENT_NAME_INPUT")
fi
if [[ -n "$DEPLOYMENT_TARGET" ]]; then
  scaffold_args+=(--deployment-target "$DEPLOYMENT_TARGET")
fi
if [[ -n "$SIM_NAME" ]]; then
  scaffold_args+=(--sim-name "$SIM_NAME")
fi
scaffold_args+=(--git-init "$GIT_INIT_MODE")
scaffold_args+=(--git-commit "$GIT_COMMIT_MODE")
if [[ "$INSTALL_XCODE_MAKEFILES" == "1" ]]; then
  scaffold_args+=(--with-xcode-makefiles)
else
  scaffold_args+=(--skip-xcode-makefiles)
fi
if [[ "$INSTALL_SIMPLE_TASKS" == "1" ]]; then
  scaffold_args+=(--with-simple-tasks)
else
  scaffold_args+=(--skip-simple-tasks)
fi
if [[ $DRY_RUN -eq 1 ]]; then
  scaffold_args+=(--dry-run)
fi

"$SCRIPT_DIR/scaffold_app.sh" "${scaffold_args[@]}"
