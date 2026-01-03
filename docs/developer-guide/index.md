# Developer Guide

Learn how to create, structure, and package your own Claude skills.

---

## Getting Started

<div class="grid cards" markdown>

-   :material-puzzle:{ .lg .middle } **[Skill Anatomy](skill-anatomy.md)**

    ---

    Understand the structure of a skill: SKILL.md, references, assets, and how they work together.

-   :material-file-document:{ .lg .middle } **[Writing SKILL.md](writing-skill-md.md)**

    ---

    Best practices for writing effective skill instructions.

-   :material-folder-multiple:{ .lg .middle } **[References & Assets](references-and-assets.md)**

    ---

    How to use bundled resources for progressive disclosure.

-   :material-package-variant:{ .lg .middle } **[Building & Packaging](building-and-packaging.md)**

    ---

    Package skills for Claude.ai upload.

-   :material-source-branch:{ .lg .middle } **[Contributing](contributing.md)**

    ---

    Guidelines for contributing to the skills repository.

</div>

---

## Core Principles

### Concise is Key

The context window is a public good. Skills share it with everything else Claude needs: system prompt, conversation history, and user requests.

**Default assumption: Claude is already very smart.** Only add context Claude doesn't already have. Challenge each piece of information:

- "Does Claude really need this explanation?"
- "Does this paragraph justify its token cost?"

Prefer concise examples over verbose explanations.

### Set Appropriate Degrees of Freedom

Match specificity to the task's fragility and variability:

| Freedom Level | When to Use | Example |
|---------------|-------------|---------|
| **High** | Multiple approaches valid, context-dependent | Text-based heuristics |
| **Medium** | Preferred pattern exists, some variation OK | Pseudocode with parameters |
| **Low** | Fragile operations, consistency critical | Specific scripts |

Think of Claude as exploring a path: a narrow bridge needs specific guardrails (low freedom), while an open field allows many routes (high freedom).

### Progressive Disclosure

Skills use a three-level loading system:

1. **Metadata** (name + description) — Always in context (~100 words)
2. **SKILL.md body** — When skill triggers (<5k words ideal)
3. **Bundled resources** — As needed by Claude (unlimited)

This keeps context lean while making depth available on demand.

---

## Quick Start: Creating a Skill

### 1. Create the folder structure

```
my-skill/
├── SKILL.md              # Required
├── references/           # Optional
│   └── detailed-guide.md
└── assets/               # Optional
    └── template.md
```

### 2. Write the SKILL.md frontmatter

```yaml
---
name: my-skill
description: A clear description of what this skill does and when to use it. Should be at least 20 characters.
---
```

### 3. Write the instructions

```markdown
# My Skill

[Core instructions for Claude]

## Workflow

[Step-by-step guidance]

## References

For detailed information on X, see `references/detailed-guide.md`.
```

### 4. Package for Claude.ai

```bash
python build.py my-skill
```

### 5. Upload

Go to Claude.ai → Settings → Skills → Upload `dist/my-skill.skill`

---

## What Makes a Good Skill?

| Quality | Description |
|---------|-------------|
| **Focused** | One job, done well |
| **Concise** | Only essential information |
| **Structured** | Clear workflow with defined inputs/outputs |
| **Progressive** | Core in SKILL.md, details in references |
| **Tested** | Validated with real usage |

---

## Next Steps

1. [:octicons-arrow-right-24: Skill Anatomy](skill-anatomy.md) — Start here to understand structure
2. [:octicons-arrow-right-24: Writing SKILL.md](writing-skill-md.md) — Best practices for instructions
3. [:octicons-arrow-right-24: References & Assets](references-and-assets.md) — Bundling resources
4. [:octicons-arrow-right-24: Building & Packaging](building-and-packaging.md) — Create .skill files
