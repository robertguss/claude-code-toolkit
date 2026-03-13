#!/usr/bin/env bash
set -euo pipefail

ALL=0
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TRASH="$SCRIPT_DIR/move_to_trash.sh"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --all)
      ALL=1
      shift
      ;;
    -h|--help)
      echo "Usage: clean.sh [--all]"
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
 done

if [[ $ALL -eq 1 ]]; then
  if [[ -d build/DerivedData || -d build/logs || -d build/cache || -d build/tmp ]]; then
    "$TRASH" build/DerivedData build/logs build/cache build/tmp
  fi
  echo "Cleaned all build artifacts."
  exit 0
fi

AGENT_NAME_VALUE="${AGENT_NAME:-}"
if [[ -z "$AGENT_NAME_VALUE" && -x ./scripts/resolve_agent_name.sh ]]; then
  AGENT_NAME_VALUE="$(./scripts/resolve_agent_name.sh)"
fi

if [[ -n "$AGENT_NAME_VALUE" ]]; then
  "$TRASH" \
    "build/DerivedData/$AGENT_NAME_VALUE" \
    "build/logs/$AGENT_NAME_VALUE" \
    "build/cache/$AGENT_NAME_VALUE" \
    "build/tmp/$AGENT_NAME_VALUE"
  echo "Cleaned build artifacts for agent: $AGENT_NAME_VALUE"
else
  "$TRASH" build/DerivedData build/logs build/cache build/tmp
  echo "Cleaned build artifacts."
fi
