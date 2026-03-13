#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
TARGET="$SKILLS_ROOT/simple-tasks/scripts/install.sh"

if [[ ! -x "$TARGET" ]]; then
  echo "Missing simple-tasks installer at $TARGET" >&2
  exit 1
fi

"$TARGET" "$@"
