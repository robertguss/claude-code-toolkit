# Pipelines

Pipelines are collections of skills designed to work together in sequence, with structured handoffs between stages.

---

## Why Pipelines?

Complex creative work benefits from specialists, not generalists. Just as traditional publishing has developmental editors, copy editors, fact-checkers, and indexers, skill pipelines provide specialized expertise at each stage.

Each skill in a pipeline:

- Has a **specific job** (not a vague responsibility)
- Receives **structured input** from upstream skills
- Produces **structured output** for downstream skills
- Knows its **scope boundaries** (what it does and doesn't do)

---

## Available Pipelines

### Non-Fiction Book Factory

A complete pipeline for developing nonfiction books from initial idea to chapter-level architecture.

```mermaid
flowchart LR
    A[book-ideation] --> B[book-idea-validator]
    B --> C[book-market-research]
    C --> D[book-architect]
    D --> E[book-research-assistant]
    E --> F[chapter-architect]
```

| Skill | Job | Scope Boundary |
|-------|-----|----------------|
| book-ideation | Develop raw ideas into structured concepts | Concept only, not validation |
| book-idea-validator | Test intellectual merit | Merit only, not market |
| book-market-research | Assess commercial viability | Market only, not structure |
| book-architect | Design reader journey and structure | Architecture only, not content |
| book-research-assistant | Fill research gaps | Research only, not drafting |
| chapter-architect | Plan chapters at beat level | Planning only, not drafting |

### Ebook Factory

A streamlined pipeline for creating ebooks—shorter, concentrated solutions.

```mermaid
flowchart LR
    A[ebook-discovery] --> B[ebook-concept-development]
```

| Skill | Job |
|-------|-----|
| ebook-discovery | Surface ebook ideas from various sources |
| ebook-concept-development | Develop ideas into structured concepts |

### Writing Pipeline

A pipeline for capturing and replicating authentic writing voices.

```mermaid
flowchart LR
    A[writing-dna-discovery] --> B[ghost-writer]
```

| Skill | Job |
|-------|-----|
| writing-dna-discovery | Capture voice patterns through interview and analysis |
| ghost-writer | Produce drafts at ~80% voice accuracy |

---

## Pipeline Principles

### 1. Skills Hand Off to Each Other

Each skill produces structured output that the next skill consumes. This creates a consistent, repeatable workflow.

```
Skill A → [Handoff Document] → Skill B → [Handoff Document] → Skill C
```

### 2. Validate Before Investing

Pipelines include explicit validation gates to prevent wasted effort:

- **book-idea-validator** — Is the idea intellectually sound?
- **book-market-research** — Is there commercial potential?

These gates produce Go/Revise/Kill recommendations before significant investment.

### 3. Each Skill Knows Its Boundaries

Skills are explicit about what they do and don't do:

```markdown
This skill validates **intellectual merit**, not:
- Commercial viability (that's market-research)
- Structural decisions (that's book-architect)
- Writing quality (that's the editing pipeline)
```

This prevents scope creep and keeps each skill focused.

### 4. Upstream Skills Can Receive Feedback

Information flows both ways:

- **Forward:** Handoff documents move work downstream
- **Backward:** If a downstream skill discovers problems, feedback goes upstream

Example: If book-research-assistant discovers the thesis is flawed, feedback goes to book-architect for structural revision.

---

## When to Use Pipelines

**Use a pipeline when:**

- Work is complex enough to benefit from specialized stages
- You want consistent quality through structured processes
- Multiple skills naturally chain together

**Use standalone skills when:**

- Work is self-contained (like general brainstorming)
- You need just one capability
- The task doesn't fit a multi-stage process

---

## Entering a Pipeline

You don't have to start at the beginning:

| Entry Point | What You Bring |
|-------------|----------------|
| Start of pipeline | Raw idea or nothing |
| Middle of pipeline | Outputs from earlier stages |
| Specific skill | Whatever that skill requires |

For example, if you already have a Book Concept Document, you can skip book-ideation and start at book-idea-validator.

---

## Pipeline vs. Standalone

| Aspect | Pipeline Skills | Standalone Skills |
|--------|-----------------|-------------------|
| Dependencies | Require upstream outputs | Self-contained |
| Handoffs | Produce structured docs for downstream | Produce general outputs |
| Scope | Narrow and specialized | Broader and flexible |
| Example | book-architect | brainstorm |

---

## Related Concepts

- [Handoffs](handoffs.md) — The structured documents that pass between skills
- [Session Continuity](session-continuity.md) — How work persists within a skill
- [Modes & Registers](modes-and-registers.md) — Adapting to different situations
