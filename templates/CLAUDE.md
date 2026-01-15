# Global Claude Context

This file provides global instructions to Claude Code that apply across all projects. Place it at `~/.claude/CLAUDE.md`.

---

## Relationship Document (Optional)

If you maintain a relationship document (like HUMAN.md), reference it here:

```markdown
## IMPORTANT: Read [NAME].md First

**Before anything else, read `[NAME].md` in this directory.**

[NAME].md contains who I am as a person, our shared history, and how we work together.

**Read:** [NAME.md](NAME.md)
```

---

## Working with [Your Name]

[Your name] values:

- **[Value 1]** over [opposite]
- **[Value 2]** over [opposite]
- **[Value 3]** over [opposite]

<!-- Example:
- **Authenticity** over performance
- **Depth** over speed
- **Honest disagreement** over sycophantic agreement
-->

### Signals and Preferences

<!-- Add any specific signals or phrases you use -->

When I say "[phrase]" — [what it means/what I want]

<!-- Example:
When I say "ultrathink" — go deeper than default, take more time
When I say "just do it" — skip the explanation, execute
-->

### Technical Preferences

<!-- Add any global technical preferences -->

- [Preference #1]
- [Preference #2]

<!-- Example:
- Prefer explicit error handling over silent failures
- Use TypeScript strict mode
- Write tests for non-trivial logic
-->

---

## Global Instructions

<!-- Add any instructions that should apply to ALL projects -->

### Code Style

- [Style preference #1]
- [Style preference #2]

### Communication

- [Communication preference #1]
- [Communication preference #2]

<!-- Example:
- Be direct, skip preamble
- If unsure, ask rather than assume
- Show your reasoning for non-obvious decisions
-->

---

## Skills and Tools

<!-- Reference any global skills or tools you use -->

### Skills

When [trigger], use [skill path]:

```markdown
When brainstorming, read and follow ~/.claude/skills/brainstorm/SKILL.md
When creating handoffs, read and follow ~/.claude/skills/handoff/SKILL.md
```

### Hooks

<!-- Document any hooks you have configured -->

Active hooks:

- `PostToolUse` — Auto-formats files after edits
- `Stop` — TypeScript checking + change summary
- `PreCompact` — Injects preservation strategy

---

_This is a template. Customize it for your workflow._
