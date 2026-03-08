#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CURRENT_FILE="$PROJECT_ROOT/agents/current_name.txt"
DEFAULT_AGENT_NAME="${AGENT_DEFAULT_NAME:-CODEX}"

if [[ -n "${AGENT_NAME:-}" ]]; then
  echo "$AGENT_NAME"
  exit 0
fi

if [[ -f "$CURRENT_FILE" ]]; then
  name="$(tr -d '\n\r' < "$CURRENT_FILE")"
  if [[ -n "$name" ]]; then
    echo "$name"
    exit 0
  fi
fi

mkdir -p "$(dirname "$CURRENT_FILE")"
echo "$DEFAULT_AGENT_NAME" > "$CURRENT_FILE" 2>/dev/null || true
echo "$DEFAULT_AGENT_NAME"
echo "Info: using default agent name '$DEFAULT_AGENT_NAME'. Set AGENT_NAME to override." >&2
