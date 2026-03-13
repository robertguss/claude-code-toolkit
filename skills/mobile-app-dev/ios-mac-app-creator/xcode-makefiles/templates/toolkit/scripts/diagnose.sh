#!/usr/bin/env bash
set -euo pipefail

print_cmd() {
  local name="$1"
  if command -v "$name" >/dev/null 2>&1; then
    echo "ok: $name"
  else
    echo "missing: $name"
  fi
}

echo "Project: ${APP_PROJECT:-unknown}"
echo "Workspace: ${APP_WORKSPACE:-unknown}"
echo "Build file: ${APP_BUILD_FILE:-unknown}"
echo "Scheme: ${APP_SCHEME:-unknown}"
echo "Platform: ${APP_PLATFORM:-unknown}"
echo "Generator: ${APP_GENERATOR:-xcodegen}"
echo "Destination: ${APP_DESTINATION:-unknown}"
echo "Agent: ${AGENT_NAME:-unknown}"

echo ""
if command -v xcode-select >/dev/null 2>&1; then
  echo "xcode-select: $(xcode-select -p)"
else
  echo "missing: xcode-select"
fi

if command -v xcodebuild >/dev/null 2>&1; then
  xcodebuild -version
else
  echo "missing: xcodebuild"
fi

echo ""
print_cmd xcrun
print_cmd python3
print_cmd xcodegen
print_cmd xcbeautify
print_cmd jq
