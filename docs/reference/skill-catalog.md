# Skill Catalog

Complete reference of all available skills.

---

## All Skills at a Glance

| Skill | Category | Description |
|-------|----------|-------------|
| [brainstorm](../skills/brainstorm/index.md) | Standalone | Multi-session ideation with 25+ thinking methods |
| [book-ideation](../skills/non-fiction-book-factory/book-ideation.md) | Book Factory | Develop raw ideas into structured book concepts |
| [book-idea-validator](../skills/non-fiction-book-factory/book-idea-validator.md) | Book Factory | Stress-test concepts against research |
| [book-market-research](../skills/non-fiction-book-factory/book-market-research.md) | Book Factory | Assess commercial viability for Amazon KDP |
| [book-architect](../skills/non-fiction-book-factory/book-architect.md) | Book Factory | Design structural and emotional architecture |
| [book-research-assistant](../skills/non-fiction-book-factory/book-research-assistant.md) | Book Factory | Plan, orchestrate, and validate deep research |
| [chapter-architect](../skills/non-fiction-book-factory/chapter-architect.md) | Book Factory | Plan chapters at beat-level granularity |
| [ebook-discovery](../skills/ebook-factory/ebook-discovery.md) | Ebook Factory | Surface ebook ideas from various sources |
| [ebook-concept-development](../skills/ebook-factory/ebook-concept-development.md) | Ebook Factory | Develop ideas into structured concepts |
| [writing-dna-discovery](../skills/writing/writing-dna-discovery.md) | Writing | Capture voice patterns through interview and analysis |
| [ghost-writer](../skills/writing/ghost-writer.md) | Writing | Produce drafts at ~80% voice accuracy |

---

## Detailed Skill Reference

### Standalone Skills

#### brainstorm

| Attribute | Value |
|-----------|-------|
| **Purpose** | Collaborative multi-session brainstorming |
| **Inputs** | Topic/problem to brainstorm |
| **Outputs** | Versioned project documents, decision logs |
| **Pipeline** | None (standalone) |
| **Modes** | Deep/Quick, Connected/Clean-slate |
| **Multi-session** | Yes |

---

### Non-Fiction Book Factory

#### book-ideation

| Attribute | Value |
|-----------|-------|
| **Purpose** | Transform raw ideas into structured book concepts |
| **Inputs** | Raw idea or brainstorm output |
| **Outputs** | Book Concept Document (8 elements) |
| **Pipeline Position** | First in Book Factory |
| **Downstream** | book-idea-validator, book-market-research |
| **Multi-session** | Yes |

#### book-idea-validator

| Attribute | Value |
|-----------|-------|
| **Purpose** | Stress-test concepts against existing research |
| **Inputs** | Book Concept Document |
| **Outputs** | Validation Report (Go/Revise/Kill) |
| **Pipeline Position** | After book-ideation |
| **Upstream** | book-ideation |
| **Downstream** | book-market-research, book-architect |
| **Multi-session** | Yes |

#### book-market-research

| Attribute | Value |
|-----------|-------|
| **Purpose** | Assess commercial viability for Amazon KDP |
| **Inputs** | Book Concept Document, Validation Report (optional) |
| **Outputs** | Market Research Report, Viability Scorecard |
| **Pipeline Position** | After validation |
| **Modes** | Quick Assessment, Deep Dive |
| **Multi-session** | Yes (Deep Dive) |

#### book-architect

| Attribute | Value |
|-----------|-------|
| **Purpose** | Design structural and emotional architecture |
| **Inputs** | Book Concept Document, Validation Report, Market Research Report |
| **Outputs** | Master Architecture Document, Section Blueprints, Research Gaps |
| **Pipeline Position** | After validation/market research |
| **Downstream** | book-research-assistant, chapter-architect |
| **Multi-session** | Yes |

#### book-research-assistant

| Attribute | Value |
|-----------|-------|
| **Purpose** | Plan, orchestrate, and validate deep research |
| **Inputs** | Research Gaps Document, Architecture Documents |
| **Outputs** | Research Prompts, Chapter Summaries, Final Synthesis |
| **Pipeline Position** | After architecture |
| **Phases** | Planning, Validation |
| **Multi-session** | Yes |

#### chapter-architect

| Attribute | Value |
|-----------|-------|
| **Purpose** | Plan chapters at beat-level granularity |
| **Inputs** | Architecture Document (chapter spec), Research Dossier |
| **Outputs** | Chapter Outline Document |
| **Pipeline Position** | After research |
| **Downstream** | draft-coach, ghostwriter |
| **Multi-session** | Optional |

---

### Ebook Factory

#### ebook-discovery

| Attribute | Value |
|-----------|-------|
| **Purpose** | Surface ebook ideas from various sources |
| **Inputs** | Content inventory, expertise description, or fresh brainstorm |
| **Outputs** | Discovery Tracker, Handoff Summary |
| **Pipeline Position** | First in Ebook Factory |
| **Entry Modes** | 11 different modes |
| **Multi-session** | Yes |

#### ebook-concept-development

| Attribute | Value |
|-----------|-------|
| **Purpose** | Develop ideas into structured concepts |
| **Inputs** | Ebook idea from any source |
| **Outputs** | Ebook Concept Document (5 elements) |
| **Pipeline Position** | After discovery |
| **Downstream** | Ebook Architecture |
| **Multi-session** | Yes |

---

### Writing

#### writing-dna-discovery

| Attribute | Value |
|-----------|-------|
| **Purpose** | Capture voice patterns through interview and analysis |
| **Inputs** | Writing samples, author interview |
| **Outputs** | Voice DNA Document |
| **Pipeline Position** | First in Writing pipeline |
| **Downstream** | ghost-writer |
| **Multi-session** | Yes |

#### ghost-writer

| Attribute | Value |
|-----------|-------|
| **Purpose** | Produce drafts at ~80% voice accuracy |
| **Inputs** | Voice DNA Document, content brief |
| **Outputs** | 2 draft variations, confidence assessment |
| **Pipeline Position** | After DNA discovery |
| **Upstream** | writing-dna-discovery |
| **Multi-session** | Yes |

---

## Skills by Feature

### Multi-Session Support

All skills support multi-session work with versioned documents:

| Skill | Session Type |
|-------|--------------|
| brainstorm | Versioned project documents |
| book-ideation | Versioned concept documents |
| book-architect | Progress tracker + decision log |
| book-research-assistant | Chapter trackers |
| All others | Session-appropriate tracking |

### Mode Support

| Skill | Available Modes |
|-------|-----------------|
| brainstorm | Deep/Quick, Connected/Clean-slate |
| book-market-research | Quick Assessment/Deep Dive, Author Intent |
| book-research-assistant | Planning/Validation phases |
| ebook-discovery | 11 entry modes |

---

## Pipeline Reference

### Book Factory Pipeline

```text
book-ideation → book-idea-validator → book-market-research → book-architect → book-research-assistant → chapter-architect
```

### Ebook Factory Pipeline

```text
ebook-discovery → ebook-concept-development → [ebook-architecture]
```

### Writing Pipeline

```text
writing-dna-discovery → ghost-writer
```
