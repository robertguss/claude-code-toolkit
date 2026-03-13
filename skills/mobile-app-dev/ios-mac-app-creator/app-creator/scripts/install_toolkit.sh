#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
TARGET="$SKILLS_ROOT/xcode-makefiles/scripts/install.sh"

if [[ ! -x "$TARGET" ]]; then
  echo "Missing xcode-makefiles installer at $TARGET" >&2
  exit 1
fi

"$TARGET" "$@"
