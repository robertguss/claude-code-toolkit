# Session Continuity

How skills maintain context across sessions spanning days or weeks.

---

## The Problem

Creative and analytical work rarely completes in one sitting. You might brainstorm today, think overnight, and continue tomorrow. Traditional AI conversations lose context between sessions—you have to re-explain everything each time.

Session continuity solves this through **versioned documents** that capture the full state of work.

---

## How It Works

### Versioned Documents

Each session produces a new version of the working document:

```
project-name/
├── _index.md           # Version history, decision log
├── project-name-v1.md  # Session 1 output
├── project-name-v2.md  # Session 2 output
├── project-name-v3.md  # Session 3 output
└── ...
```

When you return, you provide the latest version file. Claude reads it and picks up exactly where you left off.

### What Gets Captured

Version documents typically include:

| Section | Purpose |
|---------|---------|
| **Quick Context** | 2-3 sentences on current state |
| **Session Log** | Date, duration, energy level, methods used |
| **Current Thinking** | The substance of where things stand |
| **Ideas/Elements** | Organized by maturity or development status |
| **Decisions Made** | With reasoning, not just conclusions |
| **Open Questions** | Unresolved items needing thought |
| **Next Steps** | Clear actionable items |

### The Index File

A separate index file tracks the project across all versions:

```markdown
# Project Index

## Version History
- v1 (Jan 15): Initial brainstorm, identified 3 directions
- v2 (Jan 18): Deep dive on direction A, parked B and C
- v3 (Jan 22): Refined direction A, ready for validation

## Major Decisions
1. Target reader is mid-career professionals (v2)
2. Focus on transformation, not information (v3)
```

---

## Session Patterns

### Starting a New Session

```
You: Let's continue the productivity app brainstorm.

Claude: I'll need the latest version file to pick up where we left off.
        Can you share project-name-v3.md?

You: [uploads file]

Claude: Got it. Reading through v3...

        Last session (Jan 22), we refined the target reader to
        mid-career professionals and identified three key pain points.
        The overnight question was "Would you pay for this yourself?"

        How did that land? Ready to pick up there?
```

### During a Session

Claude tracks the conversation and captures significant developments:

- When decisions crystallize
- When thinking shifts meaningfully
- When new questions emerge
- At natural breakpoints

### Ending a Session

Every session concludes with:

1. **Exit Summary** — Current state, key decisions, open questions, next steps
2. **The Overnight Test** — A question to sit with before next session
3. **Version Creation** — New versioned document capturing everything

---

## Session Energy

Many skills ask about "session energy" at the start:

| Mode | Best For | Behavior |
|------|----------|----------|
| **Deep exploration** | Long sessions, open-ended thinking | More questions, more methods, embrace tangents |
| **Quick progress** | Short sessions, need decisions | Clear scope, primarily convergent, time-boxed |

This lets the skill adapt to your available time and mental state.

---

## Multi-Week Projects

For projects spanning weeks:

### Synthesis Documents

After 3+ sessions, skills may offer:

> "We've had 5 sessions on this. Want me to create a synthesis document that distills our current best thinking?"

Synthesis documents consolidate learning without losing the version history.

### Returning After a Break

If significant time has passed, Claude won't assume you remember the context:

```
Claude: Welcome back! It's been 12 days since our last session.
        Reading through v4, here's where things stand...
        [provides comprehensive status summary]

        Does this still feel current, or has your thinking shifted?
```

---

## Best Practices

### Do

- **Keep version files** — The history matters; don't delete old versions
- **Provide the latest version** — Always share the most recent file when continuing
- **Use the overnight test** — Percolation between sessions often yields breakthroughs
- **Let Claude summarize** — The status recap catches you up and verifies shared understanding

### Don't

- **Overwrite files** — Create new versions, don't modify old ones
- **Skip the exit summary** — This captures crucial context for next session
- **Rush session endings** — Proper closure enables proper continuation

---

## Technical Implementation

Skills implement continuity through:

1. **Document Templates** — Consistent structure for version files
2. **Session Flow** — Start/during/end patterns in SKILL.md
3. **Status Checks** — Questions at session start to orient
4. **Update Triggers** — When to capture changes in the document

---

## Related Concepts

- [Pipelines](pipelines.md) — How skills chain together
- [Handoffs](handoffs.md) — Documents that pass between skills
- [Modes & Registers](modes-and-registers.md) — Adapting to different situations
