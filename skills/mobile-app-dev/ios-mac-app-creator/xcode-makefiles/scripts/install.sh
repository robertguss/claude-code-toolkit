#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<USAGE
Usage: install.sh --project-dir PATH --app-name NAME --platform ios|macos [options]

Options:
  --sim-name NAME           iOS simulator name (default: auto)
  --namespace NAME          Install as Makefile.NAME + scripts/NAME/
  --mode install|upgrade    install: fail if target exists, upgrade: replace targets
  --dry-run                 Show actions only
USAGE
}

PROJECT_DIR=""
APP_NAME=""
PLATFORM=""
SIM_NAME=""
NAMESPACE=""
MODE="install"
DRY_RUN=0
APP_GENERATOR="xcodegen"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project-dir)
      PROJECT_DIR="$2"
      shift 2
      ;;
    --app-name)
      APP_NAME="$2"
      shift 2
      ;;
    --platform)
      PLATFORM="$2"
      shift 2
      ;;
    --sim-name)
      SIM_NAME="$2"
      shift 2
      ;;
    --namespace)
      NAMESPACE="$2"
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

if [[ -z "$PROJECT_DIR" || -z "$APP_NAME" || -z "$PLATFORM" ]]; then
  echo "Missing required arguments." >&2
  usage
  exit 1
fi

if [[ "$PLATFORM" != "ios" && "$PLATFORM" != "macos" ]]; then
  echo "Invalid platform: $PLATFORM" >&2
  usage
  exit 1
fi

if [[ "$MODE" != "install" && "$MODE" != "upgrade" ]]; then
  echo "Invalid mode: $MODE" >&2
  usage
  exit 1
fi

if [[ -z "$SIM_NAME" && "$PLATFORM" == "ios" ]]; then
  SIM_NAME="auto"
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_ROOT="$SCRIPT_DIR/../templates/toolkit"
RENDER="$SCRIPT_DIR/render_template.py"
TMP_DIR="$(mktemp -d)"
MAKEFILE_NAME="Makefile"
SCRIPTS_DIR="./scripts"
TARGET_PREFIX=""

if [[ -n "$NAMESPACE" ]]; then
  MAKEFILE_NAME="Makefile.${NAMESPACE}"
  SCRIPTS_DIR="./scripts/${NAMESPACE}"
  TARGET_PREFIX="${NAMESPACE}-"
fi

python3 "$RENDER" \
  --src "$TEMPLATE_ROOT" \
  --dst "$TMP_DIR" \
  --var APP_NAME="$APP_NAME" \
  --var PLATFORM="$PLATFORM" \
  --var SIM_NAME="$SIM_NAME" \
  --var SCRIPTS_DIR="$SCRIPTS_DIR" \
  --var TARGET_PREFIX="$TARGET_PREFIX" \
  --var APP_GENERATOR="$APP_GENERATOR"

TARGET_MAKEFILE="$PROJECT_DIR/$MAKEFILE_NAME"
if [[ -e "$TARGET_MAKEFILE" && "$MODE" == "install" ]]; then
  echo "Refusing to overwrite existing $TARGET_MAKEFILE in install mode." >&2
  echo "Re-run with --mode upgrade to replace it." >&2
  "$SCRIPT_DIR/move_to_trash.sh" "$TMP_DIR"
  exit 1
fi

if [[ $DRY_RUN -eq 1 ]]; then
  echo "[dry-run] Would install xcode-makefiles toolkit"
  echo "[dry-run]   project:   $PROJECT_DIR"
  echo "[dry-run]   makefile:  $TARGET_MAKEFILE"
  if [[ -n "$NAMESPACE" ]]; then
    echo "[dry-run]   scripts:   $PROJECT_DIR/scripts/$NAMESPACE"
  else
    echo "[dry-run]   scripts:   $PROJECT_DIR/scripts"
  fi
  "$SCRIPT_DIR/move_to_trash.sh" "$TMP_DIR"
  exit 0
fi

cp "$TMP_DIR/Makefile" "$TARGET_MAKEFILE"

mkdir -p "$PROJECT_DIR/scripts"
if [[ -n "$NAMESPACE" ]]; then
  mkdir -p "$PROJECT_DIR/scripts/$NAMESPACE"
  cp -R "$TMP_DIR/scripts/." "$PROJECT_DIR/scripts/$NAMESPACE/"
  SCRIPT_INSTALL_DIR="$PROJECT_DIR/scripts/$NAMESPACE"
else
  cp -R "$TMP_DIR/scripts/." "$PROJECT_DIR/scripts/"
  SCRIPT_INSTALL_DIR="$PROJECT_DIR/scripts"
fi

chmod +x "$SCRIPT_INSTALL_DIR/xcbuild.sh" \
  "$SCRIPT_INSTALL_DIR/atomic_commit.sh" \
  "$SCRIPT_INSTALL_DIR/resolve_agent_name.sh" \
  "$SCRIPT_INSTALL_DIR/resolve_sim_destination.sh" \
  "$SCRIPT_INSTALL_DIR/diagnose.sh" \
  "$SCRIPT_INSTALL_DIR/move_to_trash.sh" \
  "$SCRIPT_INSTALL_DIR/run_app_macos.sh" \
  "$SCRIPT_INSTALL_DIR/run_app_ios_sim.sh" \
  "$SCRIPT_INSTALL_DIR/clean.sh"

"$SCRIPT_DIR/move_to_trash.sh" "$TMP_DIR"

echo "Installed xcode-makefiles to $PROJECT_DIR"
