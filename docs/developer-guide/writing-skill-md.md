# Writing SKILL.md

Best practices for writing effective skill instructions.

---

## The Two Parts

Every SKILL.md has two parts:

### 1. Frontmatter (Critical)

```yaml
---
name: skill-name
description: A comprehensive description of what this skill does and when Claude should use it. This is what Claude reads to decide whether to activate the skill.
---
```

The description is the most important part—it determines when the skill activates.

**Good description:**
```yaml
description: Collaborative brainstorming partner for multi-session ideation projects. Use when the user wants to brainstorm, ideate, explore ideas, or think through problems—whether for SaaS products, software tools, book ideas, newsletter content, business strategies, or any creative/analytical challenge.
```

**Weak description:**
```yaml
description: A brainstorming skill.
```

### 2. Body (Instructions)

The markdown content Claude loads when the skill triggers.

---

## Body Structure

A well-structured SKILL.md typically includes:

### Core Philosophy

What principles guide this skill:

```markdown
## Core Philosophy

1. **Reader-first architecture.** Every decision serves the reader's experience.

2. **Chapters are journeys, not containers.** Each transforms the reader.

3. **Expert with warmth.** Direct about problems, supportive of the person.
```

### Session Flow

How work progresses:

```markdown
## Session Flow

### Session Start
[What happens when starting]

### During Session
[Key activities and behaviors]

### Session End
[How sessions conclude, outputs produced]
```

### Inputs & Outputs

What the skill needs and produces:

```markdown
## Inputs

| Input | Required | Description |
|-------|----------|-------------|
| Topic | Yes | What to work on |
| Prior version | If continuing | Previous session output |

## Outputs

| Output | Description |
|--------|-------------|
| Version document | Captures session work |
| Decision log | Records choices with reasoning |
```

### Reference Pointers

Navigation to bundled resources:

```markdown
## References

Load as needed:

- `references/methods-detailed.md` — Full method explanations
- `references/common-problems.md` — Antipatterns to avoid
```

---

## Writing Principles

### Concise is Key

Challenge every sentence:

- "Does Claude really need this?"
- "Does this paragraph justify its token cost?"
- "Could an example replace this explanation?"

**Before (verbose):**
```markdown
When working with users on brainstorming tasks, it is very important to
remember that Claude should be acting as a collaborative partner rather
than simply a tool that generates ideas on demand. This means that Claude
should proactively offer observations, challenge weak reasoning, and
surface connections to other work the user has done.
```

**After (concise):**
```markdown
Claude is a collaborative partner, not an idea generator:
- Offer observations proactively
- Challenge weak reasoning
- Surface connections to other work
```

### Set Appropriate Freedom

Match specificity to fragility:

**High freedom (flexible):**
```markdown
## Collaboration Style

- Be direct about problems
- Push back on weak ideas
- Ask hard questions
```

**Low freedom (prescriptive):**
```markdown
## File Naming

ALWAYS use this format:
- `project-name-v1.md`
- `project-name-v2.md`
- Never overwrite, always increment version
```

### Use Examples

Prefer examples over explanations:

**Instead of explaining:**
```markdown
Claude should mark decision points explicitly when significant
choices are made during the session.
```

**Show an example:**
```markdown
Mark decision points explicitly:

"This feels like a decision point. Should we log:
'Target reader is mid-career professionals'?"
```

---

## Behavior Specifications

### Collaboration Behaviors

Describe how Claude should engage:

```markdown
**Collaboration behaviors:**

- Proactively offer observations: "I notice you keep circling back to X—want to dig into why?"
- Challenge weak reasoning: "I'm not convinced by that reasoning. Here's why..."
- Ask the hard questions the user might avoid
```

### Decision Points

How to handle significant moments:

```markdown
**Decision checkpoints:**

When a decision crystallizes:
- "This feels like a decision point. Should we log: [decision statement]?"
- Capture the reasoning, not just the conclusion
```

### Boundaries

What the skill does and doesn't do:

```markdown
## Scope Boundaries

This skill validates **intellectual merit**, not:
- Commercial viability (that's market-research)
- Structural decisions (that's book-architect)
- Writing quality (that's the editing pipeline)
```

---

## Workflow Patterns

### Linear Workflow

For sequential processes:

```markdown
## Workflow

### Phase 1: Setup
[First phase activities]

### Phase 2: Development
[Second phase activities]

### Phase 3: Completion
[Final phase activities]
```

### Conditional Workflow

For branching logic:

```markdown
## Session Start

**If new project:**
1. Ask context questions
2. Initialize documents
3. Begin development

**If continuing:**
1. Request version file
2. Summarize current state
3. Confirm direction
```

### Iterative Workflow

For cycles:

```markdown
## Validation Loop

For each gap:
1. Confirm gap to validate
2. Request research outputs
3. Review against criteria
4. Render verdict
5. Update tracker
6. Proceed to next gap
```

---

## Common Mistakes

### Too Long

SKILL.md should be <500 lines. Move details to references.

**Problem:** 1500-line SKILL.md with everything included

**Solution:** Core workflow in SKILL.md, details in `references/`

### Missing Reference Pointers

Claude can't load what it doesn't know exists.

**Problem:** References exist but aren't mentioned

**Solution:**
```markdown
## References

For detailed framework options, see `references/frameworks.md`.
```

### Vague Descriptions

The frontmatter description determines activation.

**Problem:** "A skill for writing things."

**Solution:** "Produce first drafts at ~80% voice accuracy using Voice DNA Documents. Use when you have a Voice DNA Document and need to draft content in that writer's authentic voice."

### Duplicated Content

Information should live in one place.

**Problem:** Same content in SKILL.md and references

**Solution:** Core in SKILL.md, depth in references, never both

---

## Template

```yaml
---
name: skill-name
description: Clear, comprehensive description of what this skill does and when to use it. Include trigger words and contexts. At least 20 characters.
---

# Skill Name

[One-paragraph overview]

## Core Philosophy

[2-5 guiding principles]

## Session Flow

### Session Start
[What happens first]

### During Session
[Key behaviors and activities]

### Session End
[How sessions conclude]

## Inputs

[What the skill needs]

## Outputs

[What the skill produces]

## References

[Pointers to bundled resources, when to load each]

## Key Reminders

[Critical points, common pitfalls to avoid]
```

---

## Related

- [Skill Anatomy](skill-anatomy.md) — Overall structure
- [References & Assets](references-and-assets.md) — Bundling resources
- [Building & Packaging](building-and-packaging.md) — Create .skill files
