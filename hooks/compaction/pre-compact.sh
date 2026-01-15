#!/bin/bash
# PreCompact Hook - Injects preservation strategy before context compaction
#
# This hook fires whenever Claude Code compacts context (manual /compact or automatic).
# It injects the compaction strategy as additional context, guiding what gets preserved.
#
# Installation:
#   1. Copy this file to ~/.claude/hooks/pre-compact.sh
#   2. Make it executable: chmod +x ~/.claude/hooks/pre-compact.sh
#   3. Copy compaction-strategy.md to ~/.claude/compaction-strategy.md
#   4. Add the hook configuration to ~/.claude/settings.json (see README.md)

STRATEGY_FILE="$HOME/.claude/compaction-strategy.md"

if [[ -f "$STRATEGY_FILE" ]]; then
    cat "$STRATEGY_FILE"
fi

exit 0
