#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LABEL="${AGENT_NAME:-}"
ACTION="build"

usage() {
  cat <<USAGE
Usage: scripts/xcbuild.sh [--label NAME] [--action ACTION] -- <xcodebuild args>
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --label)
      [[ $# -ge 2 ]] || { echo "Missing value for --label" >&2; exit 1; }
      LABEL="$2"
      shift 2
      ;;
    --action)
      [[ $# -ge 2 ]] || { echo "Missing value for --action" >&2; exit 1; }
      ACTION="$2"
      shift 2
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    --)
      shift
      break
      ;;
    *)
      break
      ;;
  esac
done

if [[ -z "$LABEL" ]]; then
  echo "ERROR: Set AGENT_NAME=<name> or pass --label <name>." >&2
  exit 1
fi

if [[ $# -eq 0 ]]; then
  echo "ERROR: No xcodebuild arguments provided. Use -- before the arguments." >&2
  usage
  exit 1
fi

SANITIZED_LABEL="$(echo "$LABEL" | tr ' /' '__')"
SANITIZED_ACTION="$(echo "$ACTION" | tr ' /' '__')"
LOG_DIR="${LOG_DIR:-build/logs/$SANITIZED_LABEL}"
mkdir -p "$LOG_DIR"

LOG_PATH="$LOG_DIR/${SANITIZED_ACTION}.log"
RESULT_BUNDLE="$LOG_DIR/${SANITIZED_ACTION}.xcresult"
ARCHIVE_DIR="$LOG_DIR/archive"
mkdir -p "$ARCHIVE_DIR"
STAMP="$(date '+%Y%m%d%H%M%S')"

if [[ -e "$LOG_PATH" ]]; then
  mv "$LOG_PATH" "$ARCHIVE_DIR/${SANITIZED_ACTION}-${STAMP}.log"
fi

if [[ -d "$RESULT_BUNDLE" ]]; then
  mv "$RESULT_BUNDLE" "$ARCHIVE_DIR/${SANITIZED_ACTION}-${STAMP}.xcresult"
fi

CACHE_ROOT="${CACHE_ROOT:-$PWD/build/cache/$SANITIZED_LABEL}"
CLANG_MODULE_CACHE_PATH="${CLANG_MODULE_CACHE_PATH:-$CACHE_ROOT/clang/ModuleCache}"
SWIFT_MODULE_CACHE_PATH="${SWIFT_MODULE_CACHE_PATH:-$CACHE_ROOT/swift/ModuleCache}"
SWIFT_PACKAGE_CACHE_PATH="${SWIFT_PACKAGE_CACHE_PATH:-$CACHE_ROOT/swiftpm}"
SWIFT_PACKAGE_CLONED_SOURCE_PACKAGES_DIR="${SWIFT_PACKAGE_CLONED_SOURCE_PACKAGES_DIR:-$CACHE_ROOT/swiftpm/SourcePackages}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-$CACHE_ROOT/xdg}"
HOME_PATH="${HOME_PATH:-$PWD/build/home/$SANITIZED_LABEL}"
CFFIXED_USER_HOME="${CFFIXED_USER_HOME:-$HOME_PATH}"
TMPDIR="${TMPDIR:-$PWD/build/tmp/$SANITIZED_LABEL}"

mkdir -p \
  "$HOME_PATH" \
  "$CFFIXED_USER_HOME" \
  "$HOME_PATH/Library" \
  "$HOME_PATH/Library/Caches" \
  "$CLANG_MODULE_CACHE_PATH" \
  "$SWIFT_MODULE_CACHE_PATH" \
  "$SWIFT_PACKAGE_CACHE_PATH" \
  "$SWIFT_PACKAGE_CLONED_SOURCE_PACKAGES_DIR" \
  "$XDG_CACHE_HOME" \
  "$TMPDIR"

export \
  HOME="$HOME_PATH" \
  CFFIXED_USER_HOME \
  CLANG_MODULE_CACHE_PATH \
  SWIFT_MODULE_CACHE_PATH \
  SWIFT_PACKAGE_CACHE_PATH \
  SWIFT_PACKAGE_CLONED_SOURCE_PACKAGES_DIR \
  XDG_CACHE_HOME \
  TMPDIR

if command -v xcbeautify >/dev/null 2>&1; then
  FILTER_CMD=(xcbeautify --is-ci)
else
  FILTER_CMD=(cat)
fi

set +e
{
  SWIFT_OTHER_FLAGS="\$(inherited) -Xfrontend -module-cache-path -Xfrontend $SWIFT_MODULE_CACHE_PATH -Xfrontend -disable-sandbox"
  xcodebuild \
    "$@" \
    -clonedSourcePackagesDirPath "$SWIFT_PACKAGE_CLONED_SOURCE_PACKAGES_DIR" \
    CLANG_MODULE_CACHE_PATH="$CLANG_MODULE_CACHE_PATH" \
    SWIFT_MODULE_CACHE_PATH="$SWIFT_MODULE_CACHE_PATH" \
    OTHER_SWIFT_FLAGS="$SWIFT_OTHER_FLAGS" \
    -resultBundlePath "$RESULT_BUNDLE"
} 2>&1 | tee "$LOG_PATH" | "${FILTER_CMD[@]}"
PIPESTATUSES=(${PIPESTATUS[@]})
XCBUILD_STATUS=${PIPESTATUSES[0]:-1}
FILTER_STATUS=${PIPESTATUSES[2]:-0}
set -e

if [[ $FILTER_STATUS -ne 0 ]]; then
  echo "Warning: output filter exited with status $FILTER_STATUS" >&2
fi

if [[ $XCBUILD_STATUS -ne 0 ]]; then
  echo "xcodebuild failed (status $XCBUILD_STATUS). See $LOG_PATH" >&2
  echo "Result bundle: $RESULT_BUNDLE" >&2
  exit $XCBUILD_STATUS
fi

echo "xcodebuild succeeded. Log: $LOG_PATH  Result: $RESULT_BUNDLE"
