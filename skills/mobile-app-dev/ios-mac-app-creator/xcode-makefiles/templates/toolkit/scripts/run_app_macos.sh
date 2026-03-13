#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<USAGE
Usage: run_app_macos.sh --app-path /path/to/App.app [--background] [--replace-app-path]
USAGE
}

APP_PATH=""
BACKGROUND=0
REPLACE_APP_PATH=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --app-path)
      APP_PATH="$2"
      shift 2
      ;;
    --background)
      BACKGROUND=1
      shift
      ;;
    --replace-app-path)
      REPLACE_APP_PATH=1
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

if [[ -z "$APP_PATH" ]]; then
  echo "Missing --app-path" >&2
  usage
  exit 1
fi

if [[ ! -d "$APP_PATH" ]]; then
  echo "App not found: $APP_PATH" >&2
  exit 1
fi

INFO_PLIST="$APP_PATH/Contents/Info.plist"
EXECUTABLE_NAME=""
if [[ -f "$INFO_PLIST" ]]; then
  EXECUTABLE_NAME="$(/usr/libexec/PlistBuddy -c "Print :CFBundleExecutable" "$INFO_PLIST" 2>/dev/null || true)"
fi

EXECUTABLE_PATH=""
if [[ -n "$EXECUTABLE_NAME" ]]; then
  EXECUTABLE_PATH="$APP_PATH/Contents/MacOS/$EXECUTABLE_NAME"
fi

if [[ $REPLACE_APP_PATH -eq 1 && -n "$EXECUTABLE_PATH" && -x "$EXECUTABLE_PATH" ]]; then
  while IFS= read -r pid; do
    [[ -n "$pid" ]] || continue
    /bin/kill "$pid" >/dev/null 2>&1 || true
  done < <(/usr/bin/pgrep -f "$EXECUTABLE_PATH" || true)
fi

if [[ $BACKGROUND -eq 1 ]]; then
  open -gjn "$APP_PATH"
else
  open -n "$APP_PATH"
fi
