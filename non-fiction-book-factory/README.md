# Non-Fiction Book Factory

A suite of Claude skills that replicate the traditional publishing infrastructure for nonfiction book creation. Each skill specializes in one phase of the book development process, handing off structured output to the next.

📚 **[View Full Documentation](https://robertguss.github.io/claude-skills/skills/non-fiction-book-factory/)**

## Pipeline Overview

```
┌─────────────────────────────────────────────────────────────────────────┐
│                     NON-FICTION BOOK FACTORY                            │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  PHASE 1: CONCEPT DEVELOPMENT                                           │
│  ┌────────────────┐                                                     │
│  │ book-ideation  │ Develop raw ideas into structured concepts          │
│  └───────┬────────┘                                                     │
│          │ Outputs: Book Concept Document                               │
│          ▼                                                              │
│  PHASE 2: VALIDATION                                                    │
│  ┌───────────────────┐     ┌────────────────────┐                       │
│  │ book-idea-        │────▶│ book-market-       │                       │
│  │ validator         │     │ research           │                       │
│  │ (Research check)  │     │ (KDP viability)    │                       │
│  └─────────┬─────────┘     └──────────┬─────────┘                       │
│            │                          │                                 │
│            └────────────┬─────────────┘                                 │
│                         ▼                                               │
│                [GO/NO-GO DECISION]                                      │
│                         │                                               │
│                         ▼                                               │
│  PHASE 3: ARCHITECTURE                                                  │
│  ┌────────────────┐                                                     │
│  │ book-architect │ Design structural & emotional architecture          │
│  └────────────────┘                                                     │
│          │ Outputs: Master Architecture, Section Blueprints             │
│          ▼                                                              │
│  PHASE 4: RESEARCH                                                      │
│  ┌─────────────────────┐                                                │
│  │ book-research-      │ Plan & validate deep research                  │
│  │ assistant           │                                                │
│  └─────────────────────┘                                                │
│          │ Outputs: Research Synthesis, Chapter Summaries               │
│          ▼                                                              │
│  PHASE 5: CHAPTER PLANNING                                              │
│  ┌─────────────────────┐                                                │
│  │ chapter-architect   │ Plan chapters at beat-level granularity        │
│  └─────────────────────┘                                                │
│          │ Outputs: Chapter Outline Documents                           │
│          ▼                                                              │
│                                                                         │
│                    [READY TO DRAFT]                                     │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

## Skills

### 1. Book Ideation

**Purpose:** Transform raw ideas and brainstorm material into a structured Book Concept Document.

**Use when:** You have a book idea, brainstorm documents to refine, or need to articulate your book's core elements before validation.

**Core Elements Developed:**

- The Reader (who specifically)
- Transformation (before/after state)
- Thesis (the central argument)
- Author Angle (why you)
- Stakes (why it matters now)
- Key Concepts (the intellectual framework)
- Enemy (what you're arguing against)
- Promise (the headline claim)

**Output:** Book Concept Document

---

### 2. Book Idea Validator

**Purpose:** Stress-test book concepts against existing research before committing to architecture.

**Use when:** You have a Book Concept Document and want to verify your thesis is defensible and understand the competitive intellectual landscape.

**What it does:**

- Two-layer research model (landscape scan + deep dive)
- Identifies strengths and weaknesses
- Surfaces "kill signals" if they exist
- Functions as a critical intellectual partner, not a yes-man

**Output:** Validation Report with Go/Revise/Kill recommendation

---

### 3. Book Market Research

**Purpose:** Assess commercial viability of book concepts for Amazon KDP self-publishing.

**Use when:** You have a Book Concept Document and want to understand market demand, competition, pricing, and positioning before committing to write.

**What it does:**

- Separates commercial viability from intellectual merit
- Accounts for author intent (income vs. authority vs. passion)
- Offers quick assessment or deep dive modes
- Weighted viability scorecard (1-10 scale across 8 criteria)

**Output:** Market Research Report with Go/Conditional Go/Revise/Kill recommendation

---

### 4. Book Architect

**Purpose:** Design the structural and emotional architecture for your book once the concept is validated.

**Use when:** You have a validated concept and need to create the blueprint before drafting.

**What it does:**

- Maps the reader's journey through the book
- Creates chapter-level blueprints with hooks and emotional arcs
- Every structural decision justified by reader experience
- Identifies research gaps to fill before drafting

**Outputs:**

- Master Architecture Document
- Section Blueprints
- Research Gaps Document

---

### 5. Book Research Assistant

**Purpose:** Plan, orchestrate, and validate deep research for nonfiction books before outlining chapters.

**Use when:** You have completed book architecture and need to fill research gaps before drafting.

**What it does:**

- Reviews and expands research gaps from book-architect
- Generates self-contained research prompts for Claude and Gemini
- Validates research outputs gap by gap
- Produces chapter summaries and final synthesis

**Outputs:**

- Book-Level Research Tracker
- Chapter Research Trackers
- Research Prompt Files
- Chapter Research Summaries
- Final Research Synthesis

---

### 6. Chapter Architect

**Purpose:** Plan and architect a single chapter at beat-level granularity before drafting.

**Use when:** You have a chapter from the Architecture Document and need to create a detailed outline before drafting.

**What it does:**

- Transforms chapter specs into beat-level outlines
- Guides drafting while preserving creative freedom
- Tracks reader's intellectual and emotional journey through each beat
- Provides collaborative partnership with author for sequencing and debate

**Outputs:**

- Chapter Outline Document (context, reader journey, beat sequence, opening/closing deep dives)

---

## Workflow

1. **Start with ideation** — Run `book-ideation` to develop your raw idea into a structured concept
2. **Validate the concept** — Run `book-idea-validator` to stress-test against research, then `book-market-research` to assess commercial viability
3. **Make the Go/No-Go decision** — Review both reports and decide whether to proceed
4. **Architect the book** — Run `book-architect` to design the complete structure before drafting
5. **Conduct research** — Run `book-research-assistant` to plan research prompts, execute deep research externally, then validate findings
6. **Plan each chapter** — Run `chapter-architect` to create beat-level outlines for individual chapters before drafting

Each skill produces documents that the next skill consumes, creating a consistent, repeatable workflow.
