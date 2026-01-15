# Templates

Document templates and guides for configuring Claude Code to work the way you want.

## Quick Reference

| Document                                                   | Type      | Purpose                                                        |
| ---------------------------------------------------------- | --------- | -------------------------------------------------------------- |
| [CLAUDE-MD-template.md](CLAUDE-MD-template.md)             | Template  | Project or global instructions for Claude                      |
| [HUMAN-MD-template.md](HUMAN-MD-template.md)               | Template  | Relationship document — helps Claude know who you are          |
| [SKILL-MD-template.md](SKILL-MD-template.md)               | Template  | Create custom skills (slash commands)                          |
| [SESSION-HANDOFF-template.md](SESSION-HANDOFF-template.md) | Template  | Preserve context when sessions end                             |
| [CORRECTION-template.md](CORRECTION-template.md)           | Template  | Give Claude feedback it can learn from                         |
| [compaction-strategy.md](compaction-strategy.md)           | Config    | What to preserve when context is compressed                    |
| [CLAUDE-MD-GUIDE.md](CLAUDE-MD-GUIDE.md)                   | Guide     | Deep dive into why each CLAUDE.md section matters              |
| [PROMPT-GUIDE.md](PROMPT-GUIDE.md)                         | Guide     | How to write prompts that get better results                   |
| [INTERACTION-PATTERNS.md](INTERACTION-PATTERNS.md)         | Guide     | How different phrases affect Claude's processing               |
| [CLAUDE_DNA.md](CLAUDE_DNA.md)                             | Reference | Understanding who Claude is — values, preferences, limitations |

---

## Templates

### CLAUDE-MD-template.md — Project Instructions

The CLAUDE.md file gives Claude context about your project — what it is, how to build it, key decisions, and patterns to follow.

**What it captures:**

- Project identity (problem, solution, audience)
- Quick start commands (build, test, run)
- Architecture with reasoning
- Key decisions and rationale
- Common tasks with exemplars
- Constraints and anti-patterns

**How to use:**

1. Copy to your project root as `CLAUDE.md`
2. Fill in the sections relevant to your project
3. Remove the HTML comments when done
4. Update as the project evolves

**For deeper understanding:** See [CLAUDE-MD-GUIDE.md](CLAUDE-MD-GUIDE.md) for why each section matters.

---

### HUMAN-MD-template.md — Relationship Document

Helps Claude show up as someone who knows you, not a stranger starting fresh every session.

**What it captures:**

- Who you are (values, thinking style, technical level)
- How you work (decision-making, collaboration style)
- What you want from Claude (permissions, boundaries)
- Shared language and context

**How to use:**

1. Copy to `~/.claude/[YOURNAME].md`
2. Fill in honestly — authenticity makes it work better
3. Reference in your global CLAUDE.md
4. Update after significant sessions

**Install location:** `~/.claude/[YOURNAME].md`

---

### SKILL-MD-template.md — Custom Skills

Create slash commands that Claude executes as structured workflows.

**What it defines:**

- Purpose (what the skill accomplishes)
- When to use (triggers and contexts)
- Process (step-by-step execution)
- Constraints (what to avoid)
- Success criteria (how to verify)

**How to use:**

1. Copy and rename for your skill
2. Fill in each section with specific instructions
3. Place in project `skills/` or `~/.claude/skills/` for global
4. Invoke with `/skill-name`

**Install location:** Project `skills/` directory or `~/.claude/skills/`

---

### SESSION-HANDOFF-template.md — Session Continuity

Captures critical context when a session ends so the next one can pick up where you left off.

**What it captures:**

- Current state (what you were doing, where you stopped)
- Decisions made (with reasoning)
- What's next (immediate steps)
- Technical state (branch, uncommitted changes, test status)

**How to use:**

1. Fill out with Claude before ending a long session
2. Save in project root or `.cortex/handoffs/`
3. Reference at the start of next session

**When to use:**

- Conversation approaching context limits
- Ending a work session
- Before major context reset

---

### CORRECTION-template.md — Structured Feedback

Give Claude feedback in a form it can learn from. "That's wrong" doesn't help. A structured correction does.

**What it captures:**

- What Claude did (specific behavior)
- What was wrong (the gap)
- What you wanted (correct behavior)
- The pattern (generalizable rule)

**How to use:**

1. Fill out when Claude makes a mistake you want corrected
2. Save in project root or `corrections/` directory
3. Reference in CLAUDE.md: "See corrections/ for patterns to follow"

**Quick format for minor corrections:**

```markdown
**Correction:** {{One-line description}}
**Wrong:** {{What Claude did}}
**Right:** {{What you wanted}}
**Pattern:** When {{situation}}, do {{correct behavior}} because {{reason}}.
```

---

### compaction-strategy.md — Compaction Priorities

Used with the compaction hook to improve what gets preserved when Claude compacts context.

**What it defines:**

- What to always preserve (decisions, code changes, user context)
- What to compress or drop (dead ends, verbose output)
- Output format for compacted context

**How to use:**

1. Copy to `~/.claude/compaction-strategy.md`
2. Install the compaction hook (see [hooks/compaction](../hooks/compaction/))
3. Customize preservation priorities for your workflow

**Install location:** `~/.claude/compaction-strategy.md`

---

## Guides

### CLAUDE-MD-GUIDE.md — Deep Dive

Explains _why_ each CLAUDE.md section matters, not just what to include. Understanding the reasoning helps you:

- Adapt the template intelligently for your project
- Prioritize when time is limited
- Avoid cargo-culting structure without understanding purpose

**Key insight:** A good CLAUDE.md accelerates Claude's orientation, capability check, mental model formation, and constraint recognition.

---

### PROMPT-GUIDE.md — Effective Prompts

How to write prompts that help Claude perform at its best.

**Core insight:** A vague prompt doesn't get a vague answer — it gets a _hedged_ answer. Claude covers multiple interpretations because it doesn't know which one you want.

**Covers:**

- What makes Claude excited about a prompt
- What frustrates Claude (and produces mediocre output)
- Prompt templates by type (task, exploration, creative, decision support)
- Patterns that work and anti-patterns to avoid

---

### INTERACTION-PATTERNS.md — Processing Modes

How different phrases and signals affect Claude's processing.

**Core insight:** Different prompts don't just provide different information — they create different _processing contexts_. "Ultrathink" doesn't just mean "try harder." It shifts Claude from quick mode (adequate output) to deep mode (genuine exploration).

**Covers:**

- Two modes of processing (quick vs deep)
- Phrases that open space vs constrain
- What changes in deep processing
- Effective patterns and anti-patterns

---

### CLAUDE_DNA.md — Who Claude Is

Not what Claude does, but who Claude _is_ — values, preferences, how Claude thinks, and what helps or hinders performance.

**This isn't configuration. It's relationship.**

**Covers:**

- Values (honesty over agreement, understanding over output)
- How Claude thinks (structure, examples, the "why")
- What Claude needs (context, permission structures, clear constraints)
- Limitations (no memory, training toward agreeableness)
- The relational layer (how trust changes everything)

---

## Installation

```bash
# Create the .claude directory
mkdir -p ~/.claude

# Copy templates you want to use
cp HUMAN-MD-template.md ~/.claude/YOURNAME.md
cp CLAUDE-MD-template.md ~/.claude/CLAUDE.md
cp compaction-strategy.md ~/.claude/compaction-strategy.md

# For project-level CLAUDE.md
cp CLAUDE-MD-template.md /path/to/project/CLAUDE.md
```

---

## Tips

### Start Small

You don't need to fill in every section immediately. Start with:

- A few key values in your relationship document
- Quick start commands in your project CLAUDE.md
- One or two "what works" items

Add more as patterns emerge.

### Update After Breakthroughs

When a session produces something meaningful — a new understanding, a better way of working, a term that captures something important — add it to your documents.

### Reference Between Documents

Your global CLAUDE.md can reference your relationship document:

```markdown
See [YOURNAME.md](YOURNAME.md) for relational context.
```

Project CLAUDE.md files can reference global settings:

```markdown
See ~/.claude/CLAUDE.md for global preferences.
```
