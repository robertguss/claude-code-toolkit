# Templates

Document templates for configuring Claude Code to work the way you want.

## Available Templates

| Template                                         | Purpose                                                                   | Install Location                   |
| ------------------------------------------------ | ------------------------------------------------------------------------- | ---------------------------------- |
| [HUMAN.md](HUMAN.md)                             | Relationship document — helps Claude remember who you are across sessions | `~/.claude/[YOURNAME].md`          |
| [CLAUDE.md](CLAUDE.md)                           | Global instructions — preferences and settings that apply to all projects | `~/.claude/CLAUDE.md`              |
| [compaction-strategy.md](compaction-strategy.md) | Compaction priorities — what to preserve when context is compressed       | `~/.claude/compaction-strategy.md` |

## HUMAN.md — Relationship Document

The relationship document helps Claude show up as someone who knows you, not a stranger starting fresh every session.

**What it captures:**

- Who you are (values, thinking style, technical context)
- How you work together (dynamics, what works, what to avoid)
- Shared history (significant sessions, what was learned)
- Shared language (terms and phrases that mean something to you)
- Current state (trust level, rapport, recent work)

**How to use:**

1. Copy `HUMAN.md` to `~/.claude/[YOURNAME].md`
2. Fill in the template with your information
3. Reference it from your `CLAUDE.md`
4. Update it after significant sessions

The document grows with the relationship. Start minimal and add detail as patterns emerge.

## CLAUDE.md — Global Instructions

The global CLAUDE.md file contains instructions that apply across all projects.

**What it captures:**

- Reference to your relationship document
- Your values and preferences
- Signals and phrases you use (e.g., "ultrathink" means go deeper)
- Technical preferences
- Global code style and communication preferences
- References to skills and hooks you use

**How to use:**

1. Copy `CLAUDE.md` to `~/.claude/CLAUDE.md`
2. Customize the sections for your workflow
3. Add references to skills you want available globally

Note: Project-specific `CLAUDE.md` files (in `.claude/CLAUDE.md` within a project) can override or extend these global settings.

## compaction-strategy.md — Compaction Priorities

Used by the [compaction hook](../hooks/compaction/) to improve what gets preserved when Claude compacts context.

**What it defines:**

- What to always preserve (decisions, code changes, user context)
- What to compress aggressively (dead ends, verbose output)
- Output format for compacted context

**How to use:**

1. Copy to `~/.claude/compaction-strategy.md`
2. Install the compaction hook (see [hooks/compaction](../hooks/compaction/))
3. Customize preservation priorities for your workflow

## Installation

```bash
# Create the .claude directory if it doesn't exist
mkdir -p ~/.claude

# Copy templates (customize the filenames as needed)
cp HUMAN.md ~/.claude/YOURNAME.md
cp CLAUDE.md ~/.claude/CLAUDE.md
cp compaction-strategy.md ~/.claude/compaction-strategy.md
```

Then edit each file to match your preferences and workflow.

## Tips

### Start Small

You don't need to fill in every section immediately. Start with the basics:

- A few key values
- Technical context (experience level, languages)
- One or two "what works" items

Add more as you discover patterns in how you work with Claude.

### Update After Breakthroughs

When a session produces something meaningful — a new understanding, a better way of working, a term that captures something important — add it to your documents.

### Reference from Projects

Project-level `CLAUDE.md` files can reference your global templates:

```markdown
# Project CLAUDE.md

See global context at ~/.claude/CLAUDE.md

## Project-Specific Instructions

...
```
