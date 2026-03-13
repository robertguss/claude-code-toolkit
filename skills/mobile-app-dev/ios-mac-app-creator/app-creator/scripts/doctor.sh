#!/usr/bin/env bash
set -euo pipefail

required_missing=0
missing_xcodegen=0
missing_xcode_select=0
missing_xcodebuild=0

usage() {
  cat <<USAGE
Usage: doctor.sh
USAGE
}

check_cmd() {
  local name="$1"
  if command -v "$name" >/dev/null 2>&1; then
    echo "ok: $name"
  else
    echo "missing: $name"
    required_missing=1
  fi
}

check_optional() {
  local name="$1"
  if command -v "$name" >/dev/null 2>&1; then
    echo "optional: $name (found)"
  else
    echo "optional: $name (missing)"
  fi
}

if [[ $# -gt 0 ]]; then
  case "$1" in
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
fi

echo "App Creator doctor"
echo "Generator: xcodegen"

if command -v xcode-select >/dev/null 2>&1; then
  selected_dev_dir="$(xcode-select -p)"
  echo "xcode-select: $selected_dev_dir"

  selected_app="${selected_dev_dir%/Contents/Developer}"
  xcode_apps=()
  if [[ -d "/Applications" ]]; then
    shopt -s nullglob
    for app in /Applications/Xcode*.app; do
      xcode_apps+=("$app")
    done
    shopt -u nullglob
  fi

  if [[ ${#xcode_apps[@]} -gt 0 ]]; then
    echo "Xcode installs:"
    found_selected=0
    for app in "${xcode_apps[@]}"; do
      if [[ "$app" == "$selected_app" ]]; then
        echo "  * $app (selected)"
        found_selected=1
      else
        echo "  - $app"
      fi
    done
    if [[ $found_selected -eq 0 ]]; then
      echo "Warning: selected Xcode is not under /Applications. Ensure xcode-select points to the intended install." >&2
    fi
  fi
else
  echo "missing: xcode-select"
  required_missing=1
  missing_xcode_select=1
fi

if command -v xcodebuild >/dev/null 2>&1; then
  xcodebuild -version
else
  echo "missing: xcodebuild"
  required_missing=1
  missing_xcodebuild=1
fi

check_cmd xcrun
check_cmd python3

if command -v xcodegen >/dev/null 2>&1; then
  echo "ok: xcodegen"
else
  echo "missing: xcodegen"
  required_missing=1
  missing_xcodegen=1
fi

check_optional xcbeautify
check_optional jq

if [[ $required_missing -ne 0 ]]; then
  echo ""
  echo "Missing required tools. Install Xcode and XcodeGen before continuing."
  if [[ $missing_xcodegen -eq 1 ]]; then
    echo ""
    echo "Install: brew install xcodegen"
  fi
  if [[ $missing_xcode_select -eq 1 || $missing_xcodebuild -eq 1 ]]; then
    echo ""
    echo "Xcode appears to be missing or not selected."
    echo "Install Xcode, then select it:"
    echo "  sudo xcode-select -s /Applications/Xcode.app"
    echo "Reference:"
    cat <<'REF'
  https://xcodereleases.com
REF
  fi
  exit 1
fi

echo ""
echo "Doctor check passed."
