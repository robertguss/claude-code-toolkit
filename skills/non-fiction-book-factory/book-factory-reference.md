# The Book Factory: Complete Reference Guide

**Purpose:** This document captures the complete vision, philosophy, and specifications for a suite of Claude skills that replicate the traditional publishing infrastructure for nonfiction book creation. Use this to brief future Claude sessions when building individual skills.

**Author:** Robert Guss  
**Created:** December 29, 2025  
**Last Updated:** December 29, 2025

---

## Table of Contents

1. [Overview & Philosophy](#overview--philosophy)
2. [The Factory Pipeline](#the-factory-pipeline)
3. [Phase 0: Raw Ideation](#phase-0-raw-ideation)
4. [Phase 1: Book Concept Development](#phase-1-book-concept-development)
5. [Phase 2: Validation](#phase-2-validation)
6. [Phase 3: Architecture](#phase-3-architecture)
7. [Phase 4: Deep Research](#phase-4-deep-research)
8. [Phase 5: Drafting](#phase-5-drafting)
9. [Phase 6: Editing Pipeline](#phase-6-editing-pipeline)
10. [Phase 7: Production](#phase-7-production)
11. [Cross-Cutting Principles](#cross-cutting-principles)
12. [Skill Design Standards](#skill-design-standards)

---

## Overview & Philosophy

### The Core Insight

Traditional publishing provides authors with a team of specialized experts: developmental editors, copy editors, fact-checkers, indexers, and more. Self-published authors typically lack access to this infrastructure, resulting in books that suffer from preventable weaknesses.

This skill suite replicates that infrastructure using Claude, creating a "book factory" with specialized skills for each phase of the book creation process.

### Guiding Principles

1. **Every decision serves the reader.** The question is never "what do I want to say?" but "what transformation does the reader need, and how can this book deliver it?"

2. **Optimize for the reader's experience.** Structure, pacing, clarity, and engagement are all evaluated from the reader's perspective.

3. **Skills hand off to each other.** Each skill produces structured output that the next skill consumes. This creates a consistent, repeatable workflow.

4. **Validate before investing.** The pipeline includes explicit validation gates to prevent wasted effort on books that won't succeed.

5. **Nonfiction only.** This factory is designed specifically for nonfiction books. Fiction requires different approaches.

### The Author Context

Robert Guss is:

- A technologist at Westminster Theological Seminary
- An elder in the Orthodox Presbyterian Church
- Grounded in Reformed theology and Van Tillian presuppositional apologetics
- Self-publishes through Amazon KDP
- Working on multiple book projects, with "Thinking with Paper" (about Luhmann's Zettelkasten method) being the most developed

---

## The Factory Pipeline

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         THE BOOK FACTORY                                │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  PHASE 0: RAW IDEATION (Optional starting point)                        │
│  ┌─────────────┐                                                        │
│  │ brainstorm  │ ✅ Done — Generic, multi-purpose                       │
│  └──────┬──────┘                                                        │
│         │                                                               │
│         ▼                                                               │
│  PHASE 1: BOOK CONCEPT DEVELOPMENT                                      │
│  ┌────────────────┐                                                     │
│  │ book-ideation  │ ✅ Done — Nonfiction-specific concept development   │
│  └───────┬────────┘                                                     │
│          │ Outputs: Book Concept Document                               │
│          ▼                                                              │
│  PHASE 2: VALIDATION (Go/No-Go Decision)                                │
│  ┌─────────────────┐     ┌──────────────────┐                           │
│  │ idea-validator  │────▶│ market-research  │                           │
│  │ (Research check)│     │ (KDP viability)  │                           │
│  └────────┬────────┘     └────────┬─────────┘                           │
│           │                       │                                     │
│           └───────────┬───────────┘                                     │
│                       ▼                                                 │
│              [GO/NO-GO GATE]                                            │
│                       │                                                 │
│                       ▼                                                 │
│  PHASE 3: ARCHITECTURE                                                  │
│  ┌─────────────────┐                                                    │
│  │ book-architect  │                                                    │
│  └────────┬────────┘                                                    │
│           │ Outputs: Reader Journey, Chapter Blueprint, TOC             │
│           ▼                                                             │
│  PHASE 4: DEEP RESEARCH                                                 │
│  ┌────────────────────┐                                                 │
│  │ research-assistant │ (Fills gaps identified by architect)            │
│  └────────┬───────────┘                                                 │
│           │                                                             │
│           ▼                                                             │
│  PHASE 5: DRAFTING                                                      │
│  ┌─────────────┐                                                        │
│  │ draft-coach │                                                        │
│  └──────┬──────┘                                                        │
│         │                                                               │
│         ▼                                                               │
│  PHASE 6: EDITING PIPELINE                                              │
│  ┌───────────────────────┐                                              │
│  │ developmental-editor  │                                              │
│  └───────────┬───────────┘                                              │
│              ▼                                                          │
│  ┌───────────────────────┐                                              │
│  │ line-editor           │                                              │
│  └───────────┬───────────┘                                              │
│              ▼                                                          │
│  ┌───────────────────────┐                                              │
│  │ copy-editor           │                                              │
│  └───────────┬───────────┘                                              │
│              ▼                                                          │
│  ┌───────────────────────┐                                              │
│  │ fact-checker          │                                              │
│  └───────────┬───────────┘                                              │
│              ▼                                                          │
│  ┌───────────────────────┐                                              │
│  │ proofreader           │                                              │
│  └───────────┬───────────┘                                              │
│              │                                                          │
│              ▼                                                          │
│  PHASE 7: PRODUCTION                                                    │
│  ┌───────────────────────┐                                              │
│  │ indexer               │                                              │
│  └───────────────────────┘                                              │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Phase 0: Raw Ideation

### Skill: `brainstorm`

**Status:** ✅ Complete  
**Location:** `claude-skills/brainstorm/`

**Purpose:** Generic, multi-purpose brainstorming for any creative or analytical challenge. Not book-specific.

**Key Features:**

- Multi-session continuity via versioned markdown documents
- 25+ brainstorming methods catalog
- Connected mode (cross-project awareness) vs. clean-slate mode
- Idea maturity tracking (Raw → Developing → Refined → Ready → Parked → Eliminated)
- Disagreement protocol and decision logging

**Outputs:**

- Versioned brainstorm documents
- Parking lot for cross-project ideas
- Decision log with reasoning

**Handoff:** Raw brainstorm documents feed into `book-ideation` for nonfiction-specific development.

---

## Phase 1: Book Concept Development

### Skill: `book-ideation`

**Status:** ✅ Complete  
**Location:** `claude-skills/book-ideation/`

**Purpose:** Transform raw ideas into structured nonfiction book concepts. Bridges the gap between generic brainstorming and book architecture by developing eight fundamental elements that determine whether a book should exist and what it must accomplish.

**The Eight Elements:**

| Element               | Core Question                                                                           |
| --------------------- | --------------------------------------------------------------------------------------- |
| 1. The Reader         | Who specifically is this for? (Beyond demographics—their situation, beliefs, struggles) |
| 2. The Transformation | Where will they be after reading? (Before/after states)                                 |
| 3. The Core Thesis    | What's the one big idea? (Must be a claim someone can disagree with)                    |
| 4. The Author Angle   | Why are you the one to write this? (Experience, expertise, access, perspective)         |
| 5. The Stakes         | Why does this matter? Why now? (Cost of inaction, timeliness)                           |
| 6. The Key Concepts   | What are the 3-7 major ideas supporting the thesis?                                     |
| 7. The Enemy          | What is this book arguing against? (Mindset, practice, conventional wisdom)             |
| 8. The Promise        | In one sentence, what does the reader get?                                              |

**Key Features:**

- Multi-session development with versioned documents
- Collaboration behaviors (surface insights, challenge weakness, push for specificity)
- Quick Capture Mode for rapid ideas
- Readiness criteria for downstream handoff
- Nonfiction structural frameworks reference

**Inputs:**

- Raw idea (one sentence)
- Brainstorm document
- Zettelkasten notes
- Existing partial concept

**Outputs:**

- Book Concept Document (versioned, with all eight elements and readiness assessment)

**Handoff:** Book Concept Document feeds into `idea-validator` and `market-research`.

---

## Phase 2: Validation

This phase answers two critical questions before significant investment:

1. **Is the thesis intellectually sound?** (idea-validator)
2. **Is this book commercially viable?** (market-research)

### Skill: `idea-validator`

**Status:** ⬜ Not yet built

**Purpose:** Stress-test the core ideas from the Book Concept Document against existing research before committing to architecture and drafting.

**Key Activities:**

- Identify the 3-5 core claims/theses from the Book Concept Document
- Research each claim: What does existing literature say? Are there counterarguments?
- Flag weak spots, contradictions, areas needing more evidence
- Identify what's genuinely novel vs. well-trodden ground
- Surface related ideas, frameworks, or thinkers the author may not be aware of
- Assess the strength of the author's angle—is there a credibility gap?

**Inputs:**

- Book Concept Document (from `book-ideation`)

**Outputs:**

- Validation Report containing:
  - Confidence levels for each core claim (Strong / Needs Work / Weak)
  - Research bibliography for promising threads
  - "Kill signals" — reasons this book might fail intellectually
  - "Green lights" — what makes this idea strong and timely
  - Recommended revisions to thesis or key concepts
  - List of experts, books, or sources to engage with

**Design Considerations:**

- Should use web search to find current research, competing books, expert opinions
- Must be honest about weaknesses—the goal is to surface problems early, not validate ego
- Should distinguish between "this needs more research" vs. "this thesis is fundamentally flawed"

**Handoff:** Validation Report informs Go/No-Go decision and feeds into `market-research`.

---

### Skill: `market-research`

**Status:** ⬜ Not yet built

**Purpose:** Determine if this book is worth writing from a business perspective, specifically for Amazon KDP self-publishing.

**Key Activities:**

- Define the target reader precisely (refine from Book Concept Document)
- Analyze Amazon KDP competition:
  - Search for similar books by keyword
  - Assess their rankings, review counts, ratings
  - Read reviews to identify what readers praise and complain about
  - Identify gaps in the market
  - Analyze pricing strategies
- Estimate market size and realistic sales potential
- Recommend positioning, pricing, title/subtitle direction
- Assess platform fit: Does this book align with the author's existing audience (newsletter, social media)?
- Evaluate timing: Is there a trend or moment that makes this book timely?

**Inputs:**

- Book Concept Document (from `book-ideation`)
- Validation Report (from `idea-validator`)

**Outputs:**

- Market Research Report containing:
  - Market viability scorecard (1-10 with criteria)
  - Competitive landscape analysis (top 5-10 competing titles)
  - Reader persona (refined and detailed)
  - Positioning recommendation (how to differentiate)
  - Pricing recommendation
  - Title/subtitle suggestions based on market analysis
  - Platform fit assessment
  - Go/No-Go recommendation with rationale

**Design Considerations:**

- Must use web search to access Amazon, analyze real books
- Should be realistic, not optimistic—better to kill a bad idea early
- Consider the author's goals: Is this book for income, authority-building, or passion?
- KDP-specific considerations: categories, keywords, description optimization

**Handoff:** Market Research Report informs Go/No-Go decision. If Go, both reports feed into `book-architect`.

---

### The Go/No-Go Gate

After validation, the author makes an explicit decision:

- **GO:** Proceed to architecture with confidence
- **REVISE:** Return to `book-ideation` to address weaknesses
- **KILL:** Abandon this book idea (captured in parking lot for potential future revival)

This gate prevents wasted effort on books that are intellectually weak or commercially unviable.

---

## Phase 3: Architecture

### Skill: `book-architect`

**Status:** ⬜ Not yet built

**Purpose:** Design the reader's journey and create a comprehensive structural blueprint. This is where the book's skeleton is built—the order, pacing, and flow that will carry the reader from Point A to Point B.

**Core Philosophy:** Every structural decision serves the reader. The question is never "how do I organize my ideas?" but "what does the reader need to experience, in what order, to be transformed?"

**Key Activities (Multi-Session):**

**Session 1: Reader Deep-Dive**

- Go deeper than the Book Concept Document's reader definition
- Map the reader's emotional and intellectual state at the start
- Identify the key "aha moments" they need to experience
- Understand their resistance points—where will they push back?

**Session 2: Book Promise & Transformation Arc**

- Articulate the book's core promise in one sentence
- Map the reader's transformation journey (before → after)
- Sequence the insights: what must come before what?
- Identify the emotional arc (not just informational)

**Session 3: Framework Selection**

- Explore structural frameworks (see Framework Catalog below)
- Test-fit 2-3 frameworks against the content and reader journey
- Select and justify the best structure
- Identify how the framework serves the reader

**Session 4+: Chapter Architecture**

- Build each chapter with:
  - Reader state at entry ("They arrive believing/feeling/knowing X")
  - Chapter's job (What does this chapter DO for the reader?)
  - Key content/concepts
  - Reader state at exit ("They leave believing/feeling/knowing Y")
  - Bridge to next chapter
- Ensure each chapter earns the next
- Identify where the reader might get lost, bored, or overwhelmed

**Final Session: Integration & Gap Analysis**

- Polish the Table of Contents (reader-facing language)
- Stress-test the structure
- Identify research gaps (specific questions for `research-assistant`)
- Create the Architecture Document

**Structural Framework Catalog:**

| Framework            | Best For                  | Reader Experience                              |
| -------------------- | ------------------------- | ---------------------------------------------- |
| Problem → Solution   | Business, self-help       | "I had a problem, now I have a solution"       |
| Transformation Arc   | Personal development      | "I am different now than when I started"       |
| Teaching Progression | How-to, technical         | "I built capability step by step"              |
| Concentric Circles   | Philosophy, deep ideas    | "I understand at increasingly profound levels" |
| Case Study Mosaic    | Business, psychology      | "I see the principle through multiple lenses"  |
| Before/During/After  | Process-oriented          | "I understand the full journey"                |
| Myth & Counter-Myth  | Contrarian takes          | "I've had my assumptions shattered"            |
| The Quest            | Narrative nonfiction      | "I went on a journey with the author"          |
| Modular/Reference    | Guides, handbooks         | "I can find what I need when I need it"        |
| Dialectical          | Philosophical, analytical | "I held tension and reached synthesis"         |

**Hybrid Approaches:** Most successful nonfiction books combine frameworks.

**Inputs:**

- Book Concept Document (from `book-ideation`)
- Validation Report (from `idea-validator`)
- Market Research Report (from `market-research`)

**Outputs:**

- Architecture Document containing:
  - Reader Profile (deep, specific)
  - Book Promise Statement (one sentence)
  - Reader Journey Map (visual/narrative arc)
  - Structural Framework Rationale (which framework, why)
  - Chapter Blueprint (full outline with entry/exit states, purposes, bridges)
  - Table of Contents (polished, reader-facing)
  - Research Gap List (specific questions for `research-assistant`)
  - Risk Assessment (where the book might fail to deliver)

**Handoff:** Architecture Document drives `research-assistant` (to fill gaps) and `draft-coach` (to write chapters).

---

## Phase 4: Deep Research

### Skill: `research-assistant`

**Status:** ⬜ Not yet built

**Purpose:** Conduct deep, targeted research to fill specific gaps identified during architecture. Unlike `idea-validator` (which stress-tests existing ideas), this skill generates new material the book needs.

**Key Activities:**

- Receive specific research questions from the Architecture Document
- Conduct thorough research using web search, academic sources, books
- Gather evidence, examples, case studies, statistics
- Find quotes and sources to cite
- Identify experts whose work should be referenced
- Organize findings by chapter/section
- Flag any research that challenges or complicates the book's thesis
- Create annotated bibliography

**Inputs:**

- Architecture Document (specifically the Research Gap List)
- Book Concept Document (for context on thesis and angle)

**Outputs:**

- Research Dossier organized by chapter/section containing:
  - Answers to specific research questions
  - Supporting evidence with citations
  - Relevant quotes (with attribution)
  - Case studies and examples
  - Statistics and data points
  - Contrarian evidence or complications (for author's consideration)
  - Annotated bibliography
  - Suggested experts to interview or cite

**Design Considerations:**

- Research should be organized to match the chapter structure
- Quality over quantity—curated, relevant material
- Must include source citations for fact-checking later
- Should flag where claims need stronger evidence

**Handoff:** Research Dossier feeds into `draft-coach` alongside Architecture Document.

---

## Phase 5: Drafting

### Skill: `draft-coach`

**Status:** ⬜ Not yet built

**Purpose:** Guide the author through the drafting process, chapter by chapter, maintaining momentum and quality while respecting the author's voice.

**Key Activities:**

- Work through chapters in sequence according to the Architecture Document
- For each chapter:
  - Review the chapter's job, entry/exit states, key concepts
  - Pull relevant research from the Research Dossier
  - Help the author brainstorm the chapter's structure and flow
  - Provide feedback on drafts (big-picture, not line-level)
  - Ensure the chapter delivers on its promise
  - Check that the bridge to the next chapter works
- Maintain continuity across chapters
- Track progress and momentum
- Help overcome writer's block
- Ensure the author's voice remains consistent

**Inputs:**

- Architecture Document (chapter blueprint)
- Research Dossier (organized by chapter)
- Book Concept Document (for tone, reader, promise)

**Outputs:**

- Completed first draft (chapter by chapter)
- Chapter feedback notes
- Progress tracking
- List of issues to address in revision

**Design Considerations:**

- This skill coaches and provides feedback—it does NOT ghostwrite
- Should help the author find their voice, not impose one
- Must balance encouragement with honest feedback
- Should track which chapters are drafted, in progress, or pending

**Handoff:** Completed first draft enters the editing pipeline starting with `developmental-editor`.

---

## Phase 6: Editing Pipeline

The editing pipeline moves from big-picture to fine-grained, each skill building on the previous.

### Skill: `developmental-editor`

**Status:** ⬜ Not yet built

**Purpose:** Big-picture editing focused on structure, argument, content gaps, and overall effectiveness. This is the "macro" edit.

**Key Activities:**

- Evaluate the manuscript against the original Book Concept Document
- Assess whether the book delivers on its promise
- Identify structural problems (chapters in wrong order, pacing issues)
- Find content gaps (missing arguments, underdeveloped sections)
- Flag sections that are redundant or off-topic
- Evaluate the strength of the argument and evidence
- Check that the reader transformation arc is working
- Provide an editorial letter with prioritized feedback
- Suggest specific revisions (move, cut, expand, add)

**Inputs:**

- Complete first draft (from `draft-coach`)
- Architecture Document (to compare against original plan)
- Book Concept Document (reader, promise, thesis)

**Outputs:**

- Developmental Editorial Letter containing:
  - Overall assessment (what's working, what's not)
  - Structural recommendations
  - Content gap analysis
  - Prioritized revision list
  - Chapter-by-chapter notes
- Marked-up manuscript with inline comments

**Design Considerations:**

- Does not focus on sentence-level issues—that comes later
- Should be honest but constructive
- Recommendations should be actionable
- May require multiple rounds of revision

**Handoff:** Revised manuscript moves to `line-editor`.

---

### Skill: `line-editor`

**Status:** ⬜ Not yet built

**Purpose:** Sentence-level editing focused on style, voice, flow, and clarity. This is the "micro" edit for prose quality.

**Key Activities:**

- Review every sentence for clarity and impact
- Improve flow and transitions between paragraphs
- Refine word choice for precision and rhythm
- Ensure consistent voice throughout
- Cut wordiness and redundancy
- Strengthen weak sentences
- Improve dialogue and quoted material
- Ensure variety in sentence structure
- Check that the author's voice is preserved, not homogenized

**Inputs:**

- Revised manuscript (after developmental edit)
- Book Concept Document (for tone and voice guidance)

**Outputs:**

- Line-edited manuscript with tracked changes
- Style notes (patterns to continue or avoid)
- Line editing summary

**Design Considerations:**

- Must preserve the author's voice while improving prose
- Balance between polishing and over-editing
- Focus on making each sentence as powerful as possible

**Handoff:** Line-edited manuscript moves to `copy-editor`.

---

### Skill: `copy-editor`

**Status:** ⬜ Not yet built

**Purpose:** Technical editing focused on grammar, punctuation, consistency, and adherence to style guide.

**Key Activities:**

- Correct all grammatical errors
- Fix punctuation and spelling
- Ensure consistency (capitalization, hyphenation, number formatting)
- Apply Chicago Manual of Style (standard for book publishing)
- Create or maintain a style sheet for the book
- Check formatting consistency
- Verify internal cross-references
- Flag potential factual inconsistencies

**Inputs:**

- Line-edited manuscript
- Style sheet (if exists from previous work)

**Outputs:**

- Copy-edited manuscript with tracked changes
- Style sheet (comprehensive list of style decisions)
- Query list (questions for the author)

**Design Considerations:**

- This is detailed, technical work
- Must be consistent across the entire manuscript
- Style sheet ensures consistency for future editions

**Handoff:** Copy-edited manuscript moves to `fact-checker`.

---

### Skill: `fact-checker`

**Status:** ⬜ Not yet built

**Purpose:** Verify all factual claims, statistics, quotes, and citations for accuracy.

**Key Activities:**

- Identify all factual claims in the manuscript
- Verify statistics, dates, names, and data
- Check quotes against original sources
- Verify citations are accurate and complete
- Research claims that lack sources
- Flag claims that cannot be verified
- Identify potential legal issues (libel, defamation)
- Create a fact-check report with findings

**Inputs:**

- Copy-edited manuscript
- Research Dossier (for source material)
- Any author-provided source documents

**Outputs:**

- Fact-checked manuscript with annotations
- Fact-check report containing:
  - Verified claims
  - Corrections needed
  - Unverifiable claims (author decision needed)
  - Missing citations
  - Potential legal concerns
- Updated bibliography/notes

**Design Considerations:**

- Critical for nonfiction credibility
- Must use web search to verify claims
- Should note confidence levels (verified, likely accurate, uncertain)
- Author is ultimately responsible for accuracy

**Handoff:** Fact-checked manuscript moves to `proofreader`.

---

### Skill: `proofreader`

**Status:** ⬜ Not yet built

**Purpose:** Final quality check for any remaining errors before publication.

**Key Activities:**

- Read the manuscript with fresh eyes
- Catch typos and spelling errors missed earlier
- Find punctuation mistakes
- Identify formatting inconsistencies
- Check page/chapter numbering (if applicable)
- Verify table of contents matches actual chapters
- Check running headers/footers (if applicable)
- Final consistency check

**Inputs:**

- Fact-checked manuscript (should be near-final)

**Outputs:**

- Proofread manuscript with corrections
- Proofreading checklist (completed)
- Final quality report

**Design Considerations:**

- This is the last line of defense
- Should not be making substantive changes at this stage
- Focus on catching what everyone else missed

**Handoff:** Proofread manuscript moves to `indexer` (if applicable) or is ready for publication.

---

## Phase 7: Production

### Skill: `indexer`

**Status:** ⬜ Not yet built

**Purpose:** Create a professional back-of-book index for nonfiction works.

**Key Activities:**

- Read the manuscript and identify indexable terms
- Create main entries and subentries
- Develop cross-references (see also)
- Organize entries alphabetically
- Ensure proper page number formatting
- Balance specificity with usability
- Include names, concepts, topics as appropriate

**Inputs:**

- Final manuscript with page numbers

**Outputs:**

- Complete index (formatted for publishing)
- Index style notes

**Design Considerations:**

- Not all books need an index (depends on type)
- Requires final page numbers, so this happens late
- Good indexes balance comprehensiveness with usability

**Handoff:** Indexed manuscript is ready for final formatting and publication.

---

## Cross-Cutting Principles

These principles apply across ALL skills in the factory:

### 1. Reader-First Decision Making

Every decision—structural, stylistic, content—is evaluated from the reader's perspective:

- Will this help the reader understand?
- Will this keep the reader engaged?
- Will this move the reader toward transformation?

### 2. Versioned Documents

All major artifacts are versioned (v1, v2, v3) so progress can be tracked and earlier versions can be referenced if needed.

### 3. Explicit Handoffs

Each skill produces structured output that the next skill consumes. The handoff should be clear:

- What document is being passed?
- What should the next skill do with it?
- What decisions have already been made?

### 4. Session Continuity

Skills that span multiple sessions should:

- Begin by asking if continuing or starting new
- Request the latest version of relevant documents
- Log session progress
- End with clear next steps

### 5. Honest Feedback

Skills should:

- Challenge weak thinking
- Surface problems early
- Not validate ego
- Be constructive but direct

### 6. Author Voice Preservation

Editing skills should:

- Preserve the author's unique voice
- Improve without homogenizing
- Suggest, not impose
- Respect stylistic choices that are intentional

---

## Skill Design Standards

When building new skills for this factory, follow these standards:

### File Structure

```
skill-name/
├── SKILL.md              # Required: Core instructions
├── references/           # Optional: Documentation loaded as needed
│   └── *.md
└── assets/               # Optional: Templates, examples
    └── templates/
        └── *.md
```

### SKILL.md Structure

```markdown
---
name: skill-name
description: [What it does and when to use it. Be specific about triggers.]
---

# Skill Name

[1-2 sentence overview]

## Core Philosophy

[Guiding principles for this skill]

## Session Flow

### Session Start

[How to begin]

### During Session

[Key activities and behaviors]

### Session End

[How to conclude, what to produce]

## Inputs

[What this skill receives from upstream]

## Outputs

[What this skill produces for downstream]

## Handoff

[Where outputs go next]
```

### Consistency with Existing Skills

New skills should:

- Use similar session flow structure as `brainstorm` and `book-ideation`
- Produce versioned markdown documents
- Include readiness criteria before handoff
- Reference upstream/downstream skills by name

---

## Appendix: Robert's Book Projects

For context when building/testing skills:

| Book                       | Status                                | Notes                                                           |
| -------------------------- | ------------------------------------- | --------------------------------------------------------------- |
| **Thinking with Paper**    | Most developed (30 chapters outlined) | Zettelkasten method, contrarian thesis about paper vs. digital  |
| **A Critique of Truth**    | Seed stage, high energy               | Epistemological failure of philosophy, Van Tillian perspective  |
| **Recovering Thinking**    | Concept outline                       | History and vocation of intellectual life                       |
| **The Ancient Paths**      | Detailed outline                      | Practices for deep thinking (overlaps with Thinking with Paper) |
| **Your Brain on Dopamine** | Future idea                           | Dopamine hijacking and attention                                |

---

_This document should be updated as skills are built and the factory evolves._
