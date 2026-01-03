# References & Assets

How to use bundled resources for progressive disclosure.

---

## Overview

Skills can bundle additional resources beyond SKILL.md:

| Folder | Purpose | When Loaded |
|--------|---------|-------------|
| `references/` | Documentation for Claude to read | On-demand, when needed |
| `assets/` | Files for Claude's output | Used, not loaded into context |

This enables progressive disclosure: core instructions in SKILL.md, depth available when needed.

---

## References

Documentation Claude loads into context as needed.

### When to Use References

- **Detailed method catalogs** — Full explanations too long for SKILL.md
- **Domain knowledge** — Schemas, specifications, policies
- **Examples and patterns** — Extensive examples for specific scenarios
- **Workflow variants** — Different approaches for different situations

### Directory Structure

```
references/
├── methods-detailed.md      # Full method explanations
├── methods-quick.md         # Quick reference table
├── common-problems.md       # Antipatterns to avoid
└── best-practices.md        # Recommendations
```

### Pointing to References

In SKILL.md, tell Claude when to load each reference:

```markdown
## Methods

For quick method selection, see `references/methods-quick.md`.

For full method explanations (to share with user), see `references/methods-detailed.md`.
```

```markdown
## Troubleshooting

When encountering structural problems, load `references/common-problems.md`.
```

### Conditional Loading

References are powerful when loaded conditionally:

```markdown
## Framework Selection

Based on book type:
- Argument-driven → Load `references/argument-frameworks.md`
- Narrative → Load `references/narrative-frameworks.md`
- How-to → Load `references/how-to-frameworks.md`
```

Claude only loads what's relevant to the current task.

### Structuring Long References

For files >100 lines, include a table of contents:

```markdown
# Methods Detailed Reference

## Table of Contents

1. [Divergent Methods](#divergent-methods)
2. [Convergent Methods](#convergent-methods)
3. [Problem-Framing Methods](#problem-framing-methods)
4. [Evaluation Methods](#evaluation-methods)

---

## Divergent Methods

### SCAMPER
[content]

### Random Stimulus
[content]
```

This lets Claude see the full scope when previewing.

---

## Assets

Files used in Claude's output, not loaded into context.

### When to Use Assets

- **Templates** — Document structures to fill in
- **Boilerplate** — Starter code or project structures
- **Visual assets** — Images, icons, fonts
- **Sample files** — Examples to copy or modify

### Directory Structure

```
assets/
├── templates/
│   ├── project-template.md
│   ├── index-template.md
│   └── report-template.md
├── boilerplate/
│   └── starter-project/
└── images/
    └── logo.png
```

### Using Templates

Reference templates in SKILL.md:

```markdown
## Outputs

Use `assets/templates/project-template.md` for new project documents.

Use `assets/templates/index-template.md` for project index files.
```

Claude uses the template structure without loading the entire file into context.

### Template Design

Good templates include:

```markdown
# [Project Name] - v[N]

## Quick Context
[2-3 sentences: what is this, current state]

## Session Log
- Date: [DATE]
- Duration: [TIME]
- Energy: [Deep/Quick]
- Mode: [Connected/Clean-slate]
- Methods used: [LIST]

## Current Thinking
[The substance of where things stand]

## Ideas Inventory

### Raw
[Unexamined ideas]

### Developing
[Being explored]

### Refined
[Ready for evaluation]

## Decisions Made
[With reasoning]

## Open Questions
[Unresolved items]

## Next Steps
[Clear actionable items]
```

---

## Progressive Disclosure Patterns

### Pattern 1: High-Level Guide with References

SKILL.md contains core workflow; references contain depth:

```markdown
# Document Processing

## Quick Start

Extract text with pdfplumber:
[brief example]

## Advanced Features

- **Form filling**: See `references/forms.md`
- **OCR processing**: See `references/ocr.md`
- **Batch operations**: See `references/batch.md`
```

### Pattern 2: Domain-Specific Organization

For multi-domain skills:

```
analytics-skill/
├── SKILL.md (overview and navigation)
└── references/
    ├── sales-metrics.md
    ├── marketing-metrics.md
    ├── product-metrics.md
    └── finance-metrics.md
```

When user asks about sales, Claude only loads `sales-metrics.md`.

### Pattern 3: Framework Variants

For skills supporting multiple frameworks:

```
deployment-skill/
├── SKILL.md (workflow + selection guidance)
└── references/
    ├── aws-patterns.md
    ├── gcp-patterns.md
    └── azure-patterns.md
```

### Pattern 4: Conditional Details

Show basic in SKILL.md, link to advanced:

```markdown
## Document Editing

For simple edits, modify XML directly.

**For tracked changes**: See `references/redlining.md`
**For complex formatting**: See `references/ooxml.md`
```

---

## Best Practices

### References

| Do | Don't |
|----|-------|
| Clear pointers from SKILL.md | Assume Claude knows references exist |
| One level deep from SKILL.md | Deeply nested references |
| Table of contents for long files | Unstructured walls of text |
| Conditional loading | Load everything always |

### Assets

| Do | Don't |
|----|-------|
| Clear template structures | Overly complex templates |
| Organized subfolders | Flat directory with many files |
| Only what's needed | Every possible template |

### General

| Do | Don't |
|----|-------|
| Single source of truth | Duplicate across SKILL.md and references |
| Describe when to load | Leave loading implicit |
| Keep SKILL.md lean | Put everything in SKILL.md |

---

## Example: Complete Structure

A skill with well-organized resources:

```
book-architect/
├── SKILL.md
├── references/
│   ├── structural-frameworks.md    # Framework options
│   ├── chapter-architecture.md     # Chapter design
│   ├── pacing-cognitive-load.md    # Pacing guidance
│   ├── reader-resistance.md        # Objection handling
│   ├── proof-burden-mapping.md     # Evidence requirements
│   └── common-problems.md          # Antipatterns
└── assets/
    └── templates/
        ├── master-architecture-template.md
        ├── section-blueprint-template.md
        ├── research-gaps-template.md
        ├── progress-tracker-template.md
        └── decision-log-template.md
```

SKILL.md points to references:
```markdown
## References

Load as needed:
- `references/structural-frameworks.md` — When selecting framework
- `references/chapter-architecture.md` — When designing chapters
- `references/common-problems.md` — When troubleshooting

## Templates

Use templates from `assets/templates/` for outputs.
```

---

## Related

- [Skill Anatomy](skill-anatomy.md) — Overall structure
- [Writing SKILL.md](writing-skill-md.md) — Instructions best practices
- [Building & Packaging](building-and-packaging.md) — Create .skill files
