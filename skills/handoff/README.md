# Handoff

Create structured session handoff documents for continuity across Claude sessions.

## The Problem

Claude sessions don't persist. When you end a session and start a new one, you lose:

- The decisions you made and why
- The context of what you were building
- Where you left off in the task
- The nuances and constraints you'd established

Starting fresh means re-explaining everything, often losing important context in the translation.

## The Solution

The `/handoff` skill creates structured documents that capture everything a future session needs to pick up where you left off:

- Current task state and progress
- Decisions made with their reasoning
- Code changes with intent
- Open questions and blockers
- User-provided context that took time to establish
- Clear next steps

## When to Use

- **Ending a work session** — Capture state before signing off
- **Before a break** — Even mid-task, if you might lose context
- **Switching projects** — Save state before context-switching
- **Before known resets** — When you know compaction or reset is coming

## How It Works

**Step 1:** Claude assesses the current session state

**Step 2:** Asks what you want to capture:

> "I'll create a handoff document. Is there anything specific you want to make sure I capture?"

**Step 3:** Generates a structured handoff document

**Step 4:** Saves to `.claude/handoffs/[date]-[description].md`

## Handoff Document Structure

```markdown
# Session Handoff: [Brief Description]

**Date:** 2025-01-15
**Project:** /path/to/project
**Session Duration:** ~2 hours

## Current State

Task, phase, and progress

## What We Did

2-3 sentence summary

## Decisions Made

- Decision — Rationale
- Decision — Rationale

## Code Changes

Files modified with what and why

## Open Questions

Unresolved items needing attention

## Context to Remember

Important background, constraints, preferences

## Next Steps

Clear, actionable items to resume with

## Files to Review on Resume

Key files to read to get back up to speed
```

## Using a Handoff Document

When starting a new session:

1. Share the handoff file at session start
2. Say "Resume from this handoff" and paste or reference the file
3. Use @ mention if supported

The handoff lets Claude hit the ground running without lengthy re-explanation.

## Related: Compaction Hook

For in-session continuity (when context compacts but session continues), see the [compaction-hook](../compaction-hook/). It automatically improves what gets preserved during compaction.

| Handoff Skill            | Compaction Hook           |
| ------------------------ | ------------------------- |
| Cross-session continuity | In-session continuity     |
| Manual, explicit         | Automatic, silent         |
| Creates files you keep   | Influences internal state |
| Full context capture     | Preservation priorities   |

Use both for complete coverage.
