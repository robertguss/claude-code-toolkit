# Skill Anatomy

Understanding the structure of a skill.

---

## Overview

Skills are modular, self-contained packages that extend Claude's capabilities. They consist of a required SKILL.md file and optional bundled resources.

```
skill-name/
├── SKILL.md              # Required - core instructions
├── references/           # Optional - documentation loaded on-demand
└── assets/               # Optional - templates and files for output
```

---

## SKILL.md (Required)

Every skill must have a SKILL.md file containing:

### YAML Frontmatter

```yaml
---
name: my-skill
description: A clear description of what this skill does and when Claude should use it. Must be at least 20 characters.
---
```

| Field | Required | Description |
|-------|----------|-------------|
| `name` | Yes | Skill identifier (should match folder name) |
| `description` | Yes | When to activate (min 20 chars) |

The description is critical—it's what Claude reads to determine when to activate the skill. Be clear and comprehensive.

### Markdown Body

The body contains instructions for Claude:

```markdown
# Skill Name

[Brief overview]

## Core Philosophy

[Guiding principles]

## Workflow

[Step-by-step process]

## Inputs

[What the skill needs]

## Outputs

[What the skill produces]

## References

[Pointers to bundled resources]
```

---

## References (Optional)

Documentation intended to be loaded into context as needed.

```
references/
├── detailed-guide.md
├── patterns.md
└── examples.md
```

### When to Use References

- Documentation Claude should reference while working
- Database schemas, API specifications
- Domain knowledge, company policies
- Detailed workflow guides
- Anything too long for SKILL.md but needed during execution

### Best Practices

- **Keep SKILL.md lean** — Move details to references
- **Clear pointers** — Tell Claude when to load each reference
- **Structure long files** — Include table of contents for files >100 lines
- **Avoid duplication** — Information lives in one place, not both

### Example Reference Pattern

In SKILL.md:
```markdown
## Methods

For detailed method explanations, see `references/methods-detailed.md`.

For quick method selection, see `references/methods-quick.md`.
```

Claude loads only what's needed for the current task.

---

## Assets (Optional)

Files not intended for context, but used in Claude's output.

```
assets/
├── templates/
│   └── project-template.md
├── icons/
│   └── logo.png
└── boilerplate/
    └── starter-code/
```

### When to Use Assets

- Templates that get filled in or modified
- Images and icons for output
- Boilerplate code to copy
- Sample documents
- Fonts, styles, or other resources

### Best Practices

- **Separate from references** — Assets are for output, references are for context
- **Clear organization** — Use subfolders for different asset types
- **Minimal footprint** — Only include what's actually needed

---

## What NOT to Include

Skills should only contain essential files. Do NOT create:

- README.md (for the skill itself)
- INSTALLATION_GUIDE.md
- QUICK_REFERENCE.md
- CHANGELOG.md
- User-facing documentation

The skill is for Claude, not human readers. It should contain only what Claude needs to do the job.

---

## Progressive Disclosure

Skills use three levels of loading:

| Level | Content | When Loaded | Size |
|-------|---------|-------------|------|
| 1 | name + description | Always | ~100 words |
| 2 | SKILL.md body | When triggered | <5k words |
| 3 | References | As needed | Unlimited |

This keeps context lean while making depth available on demand.

### Level 1: Metadata

Always in context. Claude reads this to decide whether to activate the skill.

```yaml
---
name: brainstorm
description: Collaborative brainstorming partner for multi-session ideation projects. Use when the user wants to brainstorm, ideate, explore ideas...
---
```

### Level 2: SKILL.md Body

Loaded only when skill triggers. Should contain:

- Core workflow
- Key decisions
- Navigation to references
- Essential behaviors

Target: <500 lines, <5k words

### Level 3: References

Loaded only when Claude determines they're needed. Can contain:

- Detailed method catalogs
- Extensive examples
- Domain-specific knowledge
- Any depth required

---

## Skill Patterns

### Simple Skill

Single-purpose, no references needed:

```
simple-skill/
└── SKILL.md
```

### Skill with References

Core instructions plus depth:

```
research-skill/
├── SKILL.md
└── references/
    ├── source-evaluation.md
    └── citation-standards.md
```

### Skill with Templates

Produces structured output:

```
report-skill/
├── SKILL.md
├── references/
│   └── formatting-guide.md
└── assets/
    └── templates/
        └── report-template.md
```

### Complex Pipeline Skill

Full-featured skill with everything:

```
book-architect/
├── SKILL.md
├── references/
│   ├── structural-frameworks.md
│   ├── chapter-architecture.md
│   ├── pacing-cognitive-load.md
│   └── common-problems.md
└── assets/
    └── templates/
        ├── master-architecture-template.md
        └── section-blueprint-template.md
```

---

## Related

- [Writing SKILL.md](writing-skill-md.md) — Best practices for instructions
- [References & Assets](references-and-assets.md) — Bundling resources
- [Building & Packaging](building-and-packaging.md) — Create .skill files
