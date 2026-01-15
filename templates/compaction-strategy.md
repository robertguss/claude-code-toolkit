# Context Compaction Strategy

When compacting this conversation, follow these preservation priorities.

## Always Preserve

1. **Decisions with reasoning** — What was decided AND why
2. **Code changes** — File paths, what changed, the intent
3. **Current task state** — What we're doing and progress made
4. **Errors and fixes** — Problems encountered and how resolved
5. **User-provided context** — Constraints, preferences, domain knowledge
6. **Open questions** — Unresolved items that need addressing

## Compress or Drop

1. **Exploration dead ends** — Keep only the conclusion, not the journey
2. **Verbose tool output** — Summarize file listings, grep results, traces
3. **Intermediate reasoning** — Keep conclusions, drop the process
4. **Repeated operations** — Summarize patterns, don't list each one
5. **Superseded info** — Drop things that are no longer true

## Output Format

Structure the compacted context as:

```
CURRENT STATE: [task] / [phase] / [status]

DECISIONS:
- [decision] — [why]

CODE CHANGES:
- [file:line] — [what and why]

OPEN QUESTIONS:
- [question]

KEY CONTEXT:
[essential background]

NEXT STEPS:
1. [action]
```

Use bullet points. Include file paths. Keep reasoning for decisions.
