# Skill Connections

This guide explains how skills in the toolkit relate to each other and can be combined for complex workflows.

## Overview

Skills in the Claude Code Toolkit are designed to work independently, but many complement each other. Understanding these connections helps you:

- Choose the right skill for your task
- Combine skills for complex projects
- Build custom workflows from existing pieces

## Skill Categories

### Ideation & Planning

| Skill | Purpose | Works Well With |
|-------|---------|-----------------|
| **brainstorm** | Multi-session ideation with method catalog | book-ideation, ebook-discovery |

The brainstorm skill is a general-purpose ideation tool. Use it early in any project to explore ideas before committing to a direction.

### Documentation

| Skill | Purpose | Works Well With |
|-------|---------|-----------------|
| **code-documenter** | Generate project documentation | handoff (for session continuity) |

Code-documenter analyzes codebases and generates comprehensive docs. After a documentation session, use handoff to preserve context for future updates.

### Session Management

| Skill | Purpose | Works Well With |
|-------|---------|-----------------|
| **handoff** | Preserve session context | Any long-running skill workflow |

Handoff creates structured documents for picking up work later. Especially useful with:
- Multi-day brainstorming projects
- Book writing pipelines
- Complex documentation updates

### Writing Pipelines

The writing skills form a progression from idea to finished content:

```
Ideation → Validation → Architecture → Research → Writing → Editing
```

**Ebook Pipeline (10,000-20,000 words):**

| Phase | Skill | Output |
|-------|-------|--------|
| Discovery | ebook-discovery | Concept exploration |
| Development | ebook-concept-development | Refined concept |
| Writing | writing (voice-capture, ghost-writer) | Draft content |
| Editing | compound-writing (review) | Polished content |

**Full Book Pipeline (40,000+ words):**

| Phase | Skill | Output |
|-------|-------|--------|
| Ideation | book-ideation | Book Concept Document |
| Validation | book-idea-validator | Go/Revise/Kill decision |
| Market Research | book-market-research | Commercial viability report |
| Architecture | book-architect | Structure and emotional arc |
| Research | book-research-assistant | Research plan and validation |
| Chapter Planning | chapter-architect | Beat-level chapter plans |
| Writing | writing skills | Draft chapters |
| Editing | compound-writing | Final polish |

### Compound Writing Plugin

The compound-writing plugin adds a complete writing system:

**Commands:**
- `/writing:plan` — Create content outlines
- `/writing:draft` — Execute outlines into prose
- `/writing:review` — Multi-agent editorial review
- `/writing:compound` — Capture patterns from successful writing

**Agents (internal):**
- clarity-editor, fact-checker, publishing-optimizer
- researcher, structure-architect, voice-guardian

Use compound-writing for:
- Blog posts and articles
- Newsletter content
- Any prose that needs multiple revision passes

## Combining Skills: Example Workflows

### Workflow 1: Technical Blog Post

```
1. /brainstorm → Generate topic ideas
2. /writing:plan → Create outline
3. /writing:draft → Write first draft
4. /writing:review → Multi-agent editing
```

### Workflow 2: Open Source Documentation

```
1. /code-documenter → Generate initial docs (comprehensive mode)
2. /handoff → Preserve session for future updates
3. [Later] /code-documenter → Incremental updates (quick mode)
```

### Workflow 3: Ebook from Scratch

```
1. /brainstorm → Explore ideas (2-3 sessions)
2. ebook-discovery → Refine concept
3. ebook-concept-development → Finalize structure
4. voice-capture → Establish voice profile
5. ghost-writer → Draft chapters
6. /writing:review → Polish
```

### Workflow 4: Non-Fiction Book

```
1. /brainstorm → Initial exploration
2. book-ideation → Develop concept
3. book-idea-validator → Stress test (Go/Revise/Kill)
4. book-market-research → Validate commercial viability
5. book-architect → Design structure
6. book-research-assistant → Plan research
7. chapter-architect → Detail each chapter
8. [Writing phase with voice + ghost-writer skills]
```

## Hooks That Support Skills

| Hook | How It Helps |
|------|--------------|
| **compaction** | Preserves skill context during long sessions |
| **auto-format** | Keeps generated code clean |
| **change-summary** | Reviews session output at end |

The compaction hook is especially important for multi-session skills like brainstorm and the book pipelines—it ensures Claude remembers what matters when context compresses.

## Choosing the Right Skill

**For ideation:**
- General ideas → brainstorm
- Book concepts → book-ideation
- Ebook concepts → ebook-discovery

**For writing:**
- Short content (articles, posts) → compound-writing
- Medium content (ebooks) → ebook-factory pipeline
- Long content (books) → non-fiction-book-factory pipeline

**For documentation:**
- Code projects → code-documenter
- Session context → handoff

**For session management:**
- Always use handoff before ending multi-day projects
- Configure compaction hook for long sessions

## Building Custom Workflows

Skills are modular. You can:

1. **Use skills independently** — Each skill is self-contained
2. **Chain skills manually** — Run one skill, then another
3. **Reference in CLAUDE.md** — Tell Claude when to use which skill
4. **Create new skills** — Use skill-creator to build custom workflows

Example CLAUDE.md for a book project:

```markdown
# Book Project Instructions

When brainstorming book ideas, read /path/to/skills/brainstorm/SKILL.md

When validating a book concept, read /path/to/skills/non-fiction-book-factory/skills/book-idea-validator/SKILL.md

When preserving session context, read /path/to/skills/handoff/SKILL.md
```

This gives Claude clear guidance on which skill to use for each phase of your project.
