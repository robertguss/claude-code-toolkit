# Book Ideation

> Develop raw book ideas into structured nonfiction book concepts. Use when the user wants to develop a book idea, has brainstorm documents to refine into a book concept, wants to articulate a book's thesis/promise/reader/transformation, or needs to prepare a book concept for validation and market research.

## Overview

Book Ideation transforms raw ideas into structured nonfiction book concepts through guided multi-session development. It sits between generic brainstorming and book architecture, refining raw material into a concept that can be validated, market-tested, and architected.

The goal is not a book outline. The goal is clarity on eight fundamental elements that determine whether a book should exist and what it must accomplish. Every decision serves the reader--the question is never "what do I want to say?" but "what transformation does the reader need, and how can this book deliver it?"

This skill bridges the gap between having an idea and having a book. It forces the hard questions early, when pivoting is cheap and easy.

## Quick Start

### Prerequisites

No upstream skills are required. Book Ideation is the entry point for the Non-Fiction Book Factory pipeline.

**Accepted inputs:**
- Raw idea (one sentence or paragraph)
- Brainstorm document from the `brainstorm` skill
- Zettelkasten notes or research collection
- Existing partial concept needing refinement
- "Shower thought" worth exploring

### Basic Usage

**Starting a new concept:**
```
I have a book idea I want to develop. Here's my raw concept:

[Your idea here - can be as rough as a single sentence]
```

**Continuing a previous session:**
```
I'd like to continue developing my book concept. Here's my latest
Book Concept Document:

[Paste your document]
```

## Features

- **Multi-session development** with versioned documents (v1, v2, v3)
- **Eight-element framework** for comprehensive concept clarity
- **Quick Capture Mode** for rapid idea preservation
- **Readiness criteria** to know when you're ready for validation
- **Collaboration behaviors** that surface insights and challenge weakness
- **Structural frameworks reference** for previewing potential book shapes

## Workflow

### Session Flow

Each session follows this pattern:

1. **New or continuing?** - Establish context and gather current documents
2. **What do we have?** - Review raw material and identify gaps
3. **Session goal** - Decide which elements to develop
4. **Collaborative development** - Work through elements via conversation
5. **Session wrap-up** - Document progress, create next version

### The Eight Elements

Book Ideation develops these eight elements through conversation, not interrogation:

| Element | Core Question |
|---------|---------------|
| **The Reader** | Who specifically is this for? (situation, beliefs, struggles) |
| **The Transformation** | Where will they be after reading? (before/after states) |
| **The Core Thesis** | What's the one big idea someone can disagree with? |
| **The Author Angle** | Why are you the one to write this? |
| **The Stakes** | Why does this matter? Why now? |
| **The Key Concepts** | What 3-7 major ideas support the thesis? |
| **The Enemy** | What is this book arguing against? |
| **The Promise** | In one sentence, what does the reader get? |

### Element Deep Dives

**The Reader** - Go beyond demographics. Understand their current situation, what they believe that isn't serving them, what they've tried that hasn't worked, and the trigger moment that would make them pick up this book.

**The Transformation** - Define the gap between Point A (before) and Point B (after). What will they believe differently? What will they be able to do? How will they feel?

**The Core Thesis** - This is a claim, not a topic. Test it: Can someone disagree? Does it challenge conventional wisdom? Template: "Most people believe [X], but actually [Y], because [Z]."

**The Author Angle** - Credibility comes from experience, expertise, access, or perspective. You need at least one that's compelling.

**The Stakes** - What's the cost of NOT reading this book? Why is this moment in time right for this message?

**The Key Concepts** - The 3-7 building blocks that make the thesis credible and actionable. Force prioritization--what's essential vs. nice-to-have?

**The Enemy** - Every great nonfiction book has a villain: a mindset, practice, conventional wisdom, or competing approach. The enemy clarifies the thesis by contrast.

**The Promise** - The value proposition in one sentence. Template: "This book will help [reader] achieve [transformation] by [method/insight]."

## Inputs & Outputs

### Inputs

| Input | Required | Source |
|-------|----------|--------|
| Raw idea or brainstorm material | Yes | User |
| Previous Book Concept Document | For continuing | Previous session |

### Outputs

| Output | Description |
|--------|-------------|
| Book Concept Document | Versioned document with all eight elements, session log, open questions, and readiness assessment |

## Best Practices

### When Stuck on an Element

- **Skip and return** - Other elements may clarify it
- **Ideal Reader Interview** - Imagine interviewing your specific reader
- **Anti-Book technique** - What's the opposite book? Who's it for?

### Collaboration Behaviors

Claude will:
- Surface what's implicit: "It sounds like you're really saying..."
- Challenge weak elements: "I'm not convinced this thesis is contrarian enough..."
- Connect elements: "Your enemy suggests your reader might be someone who..."
- Push for specificity: "Can you give me an example of this reader?"

### Quick Capture Mode

For rapid concept capture when time is short:
1. Share raw idea
2. Extract rough Reader, Transformation, Thesis, Promise
3. Create minimal v1 document
4. Note: "Quick capture--expand in future session"

## Integration

### Pipeline Position

```
[Raw Idea] --> book-ideation --> [Book Concept Document]
```

Book Ideation is the entry point for the Non-Fiction Book Factory pipeline.

### Upstream Skills

| Skill | What It Provides |
|-------|------------------|
| brainstorm | Raw brainstorm documents as starting material (optional) |

### Downstream Skills

| Skill | What It Receives |
|-------|------------------|
| book-idea-validator | Book Concept Document for intellectual stress-testing |
| book-market-research | Book Concept Document for commercial viability assessment |
| book-architect | Book Concept Document for structural design (after validation) |

## Examples

### Example 1: Starting from a Raw Idea

**User input:**
```
I want to write a book about how paper-based note-taking is superior to
digital tools for deep thinking.
```

**Claude's approach:**
- Probes for the specific reader (who is frustrated with digital tools?)
- Explores the transformation (from scattered digital notes to coherent thinking?)
- Sharpens the thesis (what specifically makes paper better?)
- Identifies the enemy (productivity apps? Notion? Second Brain systems?)

### Example 2: Refining an Existing Concept

**User input:**
```
I have this Book Concept Document from last session but my thesis feels weak.
Here it is: [document]
```

**Claude's approach:**
- Reviews the thesis against the "contrarian enough?" test
- Explores what the thesis is really claiming
- Connects thesis back to reader's struggles and transformation
- Tests formulations until one clicks

### Example 3: Quick Capture

**User input:**
```
I only have 10 minutes but I had an idea I don't want to lose:
"Philosophy departments have failed to produce practical wisdom
because they've abandoned the pursuit of truth."
```

**Claude's approach:**
- Captures rough Reader, Transformation, Thesis, Promise
- Creates minimal v1 document
- Notes gaps to explore later
- Enables quick exit without losing the core

## Readiness Criteria

A Book Concept Document is ready for downstream skills when:

| Element | Readiness Test |
|---------|----------------|
| Reader | Can describe them as a specific person, not a category |
| Transformation | Clear before/after with emotional and practical dimensions |
| Thesis | One sentence, contrarian, defensible |
| Author Angle | At least one compelling credibility source |
| Stakes | Urgency is clear--reader feels cost of inaction |
| Key Concepts | 3-7 prioritized, each clearly supporting the thesis |
| Enemy | Named and specific |
| Promise | One sentence that a reader would find compelling |
