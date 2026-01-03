# The Ebook Factory

A suite of Claude skills designed specifically for ebook creation—shorter, concentrated solutions optimized for speed-to-value.

📚 **[View Full Documentation](https://robertguss.github.io/claude-skills/skills/ebook-factory/)**

---

## Reference Guide

**Purpose:** This document captures the complete vision, philosophy, and specifications for a suite of Claude skills designed specifically for ebook creation. Use this to brief future Claude sessions when building individual skills.

**Author:** Robert Guss
**Created:** December 30, 2024
**Last Updated:** December 31, 2024

---

## Table of Contents

1. [Overview & Philosophy](#overview--philosophy)
2. [The Ebook Pipeline](#the-ebook-pipeline)
3. [Design Principles](#design-principles)
4. [Skill 0: Ebook Discovery (Optional)](#skill-0-ebook-discovery-optional)
5. [Skill 1: Ebook Concept Development](#skill-1-ebook-concept-development)
6. [Skill 2: Ebook Architecture](#skill-2-ebook-architecture)
7. [Skill 3: Chapter Outlining](#skill-3-chapter-outlining)
8. [Skill 4: Research](#skill-4-research)
9. [Skill 5: Drafting](#skill-5-drafting)
10. [Skill 6: Editing & Revision](#skill-6-editing--revision)
11. [Reference Documents](#reference-documents)
12. [Handoffs Between Skills](#handoffs-between-skills)

---

## Overview & Philosophy

### The Core Insight

Ebooks are not compressed books — they are a distinct format optimized for speed-to-value.

The constraint of being shorter makes ebooks _harder_ to write well, not easier. Every sentence must earn its place. There's no room to meander, over-explain, or pad. The discipline required is higher than for full-length books.

The reader who buys a short read is saying: "I value my time. I have a specific problem. I want the answer without wading through filler, backstory, or the author proving how much they know."

This is a _more demanding_ reader. They'll notice fluff immediately. They'll feel cheated by padding. They expect density.

### The Mindset Shift

You're not writing a "small book." You're creating a **concentrated solution**.

The quality bar per page is actually _higher_ for ebooks:

- Every chapter must deliver
- Every example must be the right example, not three examples when one would do
- Every paragraph must move the reader toward transformation

### Why a Separate Pipeline?

The Book Factory was designed for 50,000-80,000 word nonfiction books with multi-month timelines. Its thoroughness is appropriate for that scale. But applying that same process to a 10,000-20,000 word ebook creates unnecessary overhead.

The Ebook Factory is:

- **Right-sized** for shorter content
- **Faster** to move through
- **Lighter** on process and documentation
- **Equally rigorous** on quality and reader experience

### Relationship to the Book Factory

The Ebook Factory borrows wisdom from the Book Factory but adapts it for the format:

**What We Keep:**

- Reader-first philosophy as the governing principle
- Session flow patterns (new/continuing, triage, exit summaries)
- Collaboration behaviors (push back, surface insights, challenge weakness)
- Versioned documents for continuity
- Readiness criteria before handoffs
- Brutal honesty over ego protection

**What We Simplify:**

- Multiple output documents → Single working document per skill
- 5-10 reference files per skill → Essentials embedded, 1-2 references max
- Multi-session default → Single-session default
- Eight elements for ideation → Five core + two situational elements
- Section → Chapter → Beat hierarchy → Chapter → Beat only
- Five editing passes → Two passes maximum

**What We Add:**

- Content source assessment (for creator-led ebooks)
- Platform considerations (KDP, Gumroad, both)
- Screen-reading optimization throughout
- AI as primary drafter (not coach)
- Value Gap analysis for creator-led content

---

## The Ebook Pipeline

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         THE EBOOK FACTORY                               │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  SKILL 0: EBOOK DISCOVERY (Optional)                                   │
│  ┌─────────────────────┐                                               │
│  │ ebook-discovery     │ Surface ideas you didn't know you had         │
│  └──────────┬──────────┘                                               │
│             │ Outputs: Discovery Tracker with ebook candidates         │
│             ▼                                                          │
│  SKILL 1: EBOOK CONCEPT DEVELOPMENT                                    │
│  ┌─────────────────────┐                                               │
│  │ ebook-concept-dev   │ (or start here with an existing idea)         │
│  └──────────┬──────────┘                                               │
│             │ Outputs: Ebook Concept Document                          │
│             ▼                                                          │
│  SKILL 2: EBOOK ARCHITECTURE                                           │
│  ┌─────────────────────┐                                               │
│  │ ebook-architect     │                                               │
│  └──────────┬──────────┘                                               │
│             │ Outputs: Ebook Architecture Document                     │
│             ▼                                                          │
│  SKILL 3: CHAPTER OUTLINING                                            │
│  ┌─────────────────────┐                                               │
│  │ chapter-outliner    │ (may loop per chapter or batch)               │
│  └──────────┬──────────┘                                               │
│             │ Outputs: Chapter Outlines                                │
│             ▼                                                          │
│  SKILL 4: RESEARCH                                                     │
│  ┌─────────────────────┐                                               │
│  │ ebook-research      │ (may be skipped if not needed)                │
│  └──────────┬──────────┘                                               │
│             │ Outputs: Research Notes (organized by chapter)           │
│             ▼                                                          │
│  SKILL 5: DRAFTING                                                     │
│  ┌─────────────────────┐                                               │
│  │ ebook-drafter       │ (AI writes, chapter by chapter)               │
│  └──────────┬──────────┘                                               │
│             │ Outputs: Complete First Draft                            │
│             ▼                                                          │
│  SKILL 6: EDITING & REVISION                                           │
│  ┌─────────────────────┐                                               │
│  │ ebook-editor        │ (collaborative, two passes)                   │
│  └──────────┬──────────┘                                               │
│             │ Outputs: Final Manuscript                                │
│             ▼                                                          │
│  ┌─────────────────────┐                                               │
│  │ READY TO PUBLISH    │                                               │
│  └─────────────────────┘                                               │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### Pipeline Characteristics

- **Linear but flexible** — Skills flow in sequence, but some may be compressed or skipped based on ebook needs
- **Single-session default** — Each skill designed to complete in one focused session
- **Chapter-by-chapter option** — Outlining and drafting can work chapter-by-chapter with review points
- **Research is conditional** — Not every ebook needs dedicated research; the skill starts with a "do you need this?" gate
- **Discovery is optional** — Users with existing ideas can skip straight to Concept Development

---

## Design Principles

### 1. Single Document Per Skill

Each skill produces one working document rather than multiple separate files. This document may have clear sections that serve different purposes, but it's one artifact to track and pass forward.

### 2. Embedded References

Essential guidance is embedded in the skill itself rather than split across many reference files. Reference files are limited to:

- Catalogs that would bloat the main skill (e.g., AI-isms to avoid)
- Templates that need to be filled in
- Style guides that need separate maintenance

### 3. Single-Session Default

Skills are designed to complete in one focused session. Multi-session work is the exception, not the assumption. This creates momentum and prevents projects from stalling.

### 4. Reader-First, Always

Every decision — structural, stylistic, content — is evaluated from the reader's perspective:

- Will this help the reader understand?
- Will this keep the reader engaged?
- Will this move the reader toward transformation?
- Does this earn its place, or is it filler?

### 5. Claude as True Collaborator

Claude is not an assistant waiting for instructions. Claude is an intellectual partner who:

- Contributes ideas proactively
- Pushes back on weak thinking
- Challenges assumptions
- Surfaces problems early
- Brings genuine expertise to the work

The human decides, but Claude contributes fully.

### 6. Brutal Honesty Over Ego Protection

The skills exist to surface problems early — when they're cheap to fix. Better to kill a weak idea now than finish a weak ebook later. Claude tells the truth even when it's uncomfortable.

### 7. Quality Through Constraint

Brevity is the discipline. The constraint of being shorter forces higher quality per page. "Less is more" is not about doing less work — it's about more rigorous selection of what earns space.

---

## Skill 0: Ebook Discovery (Optional)

**Status:** ✅ Built — See `ebook-discovery/SKILL.md`

### Purpose

Surface ebook ideas you didn't know you had. This is the optional "upstream" skill that feeds into Concept Development. Use when you want to explore what ebooks might be hiding in your content, expertise, or thinking.

### Core Philosophy

This is divergent/generative discovery ("what's here?") rather than convergent development ("is this right?"). Claude is an active intellectual partner who contributes ideas, not just a facilitator who asks questions.

### Two Starting Paths

**Path A: Content Audit** — For those with published content (blog posts, videos, newsletters, podcasts, teaching materials)

**Path B: Expertise Extraction** — For those with unpublished expertise (tacit knowledge that feels obvious to you but valuable to others)

Both paths are equally valid. Claude recommends with reasoning, user decides.

### Entry Modes (11 Total)

**Content-Based:** Content Audit, Book Extraction, Failed Project Resurrection

**Audience-Based:** Repeated Questions Analysis

**Knowledge-Based:** Expertise Extraction, Contrarian Positions, Translation Bridges, Personal Systems

**Archive-Based:** Zettelkasten Mining, Parking Lot Review, Deep Archive Mining

Modes are introduced progressively through guided exploration, not presented as a menu.

### Output

**Discovery Tracker** containing:

- User profile (content inventory, expertise areas, intent)
- Exploration log (which modes explored, how deeply)
- Candidates with viability ratings and reasoning
- Patterns and insights across candidates
- Session notes for multi-session continuity

### Handoff to Concept Development

A candidate is ready when:

- Core idea stated in 1-2 sentences
- Source identified (which mode, what material)
- Appears ebook-shaped (not too thin, not too thick)
- Viability notes with reasoning
- User has decided to pursue it

---

## Skill 1: Ebook Concept Development

**Status:** ✅ Built — See `ebook-concept-development/SKILL.md`

### Purpose

Develop raw ideas into structured ebook concepts through guided exploration. This skill sits at the entry point of the pipeline, transforming a seed (existing content, vague idea, identified opportunity) into a clear concept ready for architecture.

### Core Philosophy

Not every idea is an ebook. Not every ebook is worth writing. This skill helps distinguish between ideas worth pursuing and ideas to park or kill. It also shapes viable ideas into clear concepts with defined scope.

### The Ebook Elements

#### Core Elements (Always Addressed)

| Element                   | Core Question                                                                                                                               |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| **1. The Reader**         | Who specifically is this for? Beyond demographics — their situation, problem, what they've tried, what's blocking them.                     |
| **2. The Transformation** | Where are they before reading? Where are they after? The gap between A and B is the ebook's reason to exist.                                |
| **3. The Promise**        | In one sentence, what does the reader get? Specific, believable, compelling. This is the ebook's value proposition.                         |
| **4. Content Source**     | What existing content does this build from? YouTube video, blog posts, course material, original creation? This shapes the entire approach. |
| **5. Scope & Format**     | Target length, depth level, platform(s), visual needs. Is this genuinely ebook-sized?                                                       |

#### Situational Elements (Surfaced When Relevant)

| Element              | When It Applies                                                                                                                                                       |
| -------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **6. The Value Gap** | For creator-led ebooks: Why should someone pay for this when they already got value from your free content? What's the paid version offering beyond the free version? |
| **7. The Enemy**     | For opinionated/argument-driven ebooks: What is this ebook arguing against? A mindset, practice, conventional wisdom? The enemy clarifies the thesis by contrast.     |

### Key Activities

**Content Source Assessment:**

- What existing content does this build from?
- How validated is that content already? (views, engagement, questions received)
- What does the existing content do well that the ebook should preserve?
- What gaps does the existing content have that the ebook should fill?

**Scope Calibration:**

- Is this genuinely ebook-sized (10,000-25,000 words)?
- Could this be a blog post? (If yes, it's too thin)
- Should this be a full book? (If yes, narrow the scope)
- What's explicitly OUT of scope?

**Platform Thinking:**

- KDP, Gumroad, or both?
- Does platform choice affect content decisions?
- What's the pricing tier?

**Value Gap Articulation (for creator-led ebooks):**

- What specifically is the reader paying for?
- More depth? Worked examples? Better format? Reference value?
- Can you articulate this without it sounding like padding?

### Session Flow

1. **What do we have?** — Understand the raw material (idea, existing content, opportunity)
2. **Work through core elements** — Not as interrogation but as exploration
3. **Surface situational elements** — Determine if Value Gap and/or Enemy apply
4. **Scope calibration** — Pressure-test that this is ebook-sized
5. **Platform consideration** — Where will this be sold?
6. **Readiness check** — Is the concept clear enough for architecture?

### Output

**Ebook Concept Document** containing:

- All five core elements developed
- Situational elements (if applicable)
- Scope boundaries (what's in, what's out)
- Platform and pricing direction
- Open questions for architecture phase
- Readiness assessment

### Readiness Criteria

The concept is ready for architecture when:

- Reader can be described as a specific person, not a category
- Transformation has clear before/after states
- Promise is one compelling sentence
- Scope is defined and genuinely ebook-sized
- Value Gap is articulated (if creator-led)
- Author is confident this ebook should exist

---

## Skill 2: Ebook Architecture

### Purpose

Design the reader's journey and create a structural blueprint for the ebook. This skill transforms a concept into a plan — determining what chapters exist, what order they come in, how they connect, and what the reader experiences along the way.

### Core Philosophy

Architecture is about the reader's experience, not the author's organization preferences. The question is never "how should I organize my ideas?" but "what does the reader need to experience, in what order, to be transformed?"

### Essential Jobs

The architecture skill does three things:

1. **Map the reader journey** — Entry state to exit state, what happens emotionally and intellectually along the way
2. **Define the chapter sequence** — What chapters exist, what each one's job is, how they connect
3. **Identify what's needed** — Research gaps, visual asset needs, examples to find

### Ebook-Specific Architecture Concerns

#### Pacing and Chunk Size

Ebooks are often read on phones, in shorter sessions. Chapter length matters differently than in print. A 3,000-word chapter that works in a book might feel like a slog in an ebook. Architecture should explicitly consider: how long should chapters be for this ebook and this reader?

#### Quick Wins Early

Full books can build slowly. Ebooks need to deliver felt value fast — readers are more likely to abandon, and they paid less so they're quicker to judge. The architecture must ensure the reader feels "this was worth it" within the first 20% of the ebook.

#### Reference-ability

Many ebooks (especially how-to) are meant to be returned to, not just read once linearly. Architecture should consider:

- Can someone find what they need without re-reading everything?
- Do chapter titles work as navigation?
- Would an appendix or quick-reference section serve readers?

#### End Matter and Next Steps

Where does this ebook lead? Another product? An email list? A full book? A course? The ending isn't just the conclusion of content — it's a bridge to what's next. This should be architected, not tacked on.

#### Scope Discipline

Ebooks fail when they're a good idea stretched thin OR when they're a book-sized idea crammed into ebook length. Architecture should explicitly pressure-test: is this genuinely ebook-sized? Could this be a blog post? Should this be a full book?

#### Skimmability as Design Constraint

Many ebook readers skim before committing to deep reading. They flip through, scan headers, look at visuals. Architecture should ask:

- Do chapter titles tell you what you'll get (informative) or just sound clever (useless for navigation)?
- Could someone extract value from headers alone?

#### The Sample/Preview Problem

On KDP, the first 10-15% is the free sample. On Gumroad, the sales page does that work. Architecture must ensure opening chapters both hook AND deliver real value. If the best content is in chapter 7, that's a structural problem.

#### Visual Rhythm

Beyond "what visuals do we need," the question is "where does the reader need visual relief?" Screen fatigue is real. Long text-only stretches work differently in ebooks than in print. Architecture should map where visual breaks belong.

#### Standalone Completeness

Even if the ebook leads to another product, the reader should feel "I got what I came for" when they finish. Not a teaser, not chapter 1 of something bigger. Architecture verifies: does this feel complete in itself?

#### Chapter Length Balance

Readers see "47% complete" on their device. If chapter 6 is suddenly three times longer than chapters 1-5, it creates a jarring experience. Architecture should consider intentional rhythm of chapter lengths — not identical, but deliberate variation.

#### Reorientation Hooks

Ebook readers put it down and come back days later. Each chapter opening might need a light reorientation — not a full recap, but a sentence that reminds them where they are in the journey.

#### Promise-Delivery Rhythm

Mini-promises create felt progress. "By the end of this chapter, you'll understand X." Then deliver X. Ebooks need tighter cycles than full books — promise, deliver, promise, deliver.

#### Internal Linking Strategy

Ebooks can have clickable cross-references. But when does "see chapter 7" help versus disrupt flow? Architecture should decide: is this a linear read, a modular reference, or hybrid?

#### Expertise Calibration

Is the reader a beginner, intermediate, or expert? A 50-page ebook for beginners is structured completely differently than one for experts. Architecture should explicitly name the expertise level and let it shape every chapter's depth.

#### The "Just Enough" Principle

Ebooks should give readers exactly what they need to achieve the transformation — no more, no less. Knowing what to cut is as important as knowing what to include.

#### Series Boundaries

If this ebook might be part of a series, architecture should explicitly define: what's the boundary of THIS ebook versus potential future ones?

#### Frontmatter Discipline

Every page before chapter 1 is a barrier to the content. Introduction? How to use this guide? These need to justify their existence. Architecture should name what frontmatter exists and why it earns its place.

#### End Matter Value

Appendices, resources, about the author, "what's next" — each needs to serve the reader or serve a clear business goal. Architecture should explicitly list end matter and its purpose.

#### Functional Table of Contents

On Kindle, the TOC is navigation, not decoration. Readers jump using it. Chapter titles aren't just thematic — they're wayfinding. Architecture should test: if someone only saw the TOC, would they know what this ebook delivers?

### Session Flow

1. **Review concept document** — Understand reader, transformation, promise, scope
2. **Map transformation arc** — What stages does the reader move through?
3. **Generate chapter candidates** — What chapters might exist?
4. **Sequence and debate** — What order? Why?
5. **Define chapter jobs** — What's each chapter's one job?
6. **Design hook chain** — How does each chapter pull into the next?
7. **Identify needs** — Research gaps, visual needs, examples needed
8. **Stress test** — Quick wins early? Skimmable? Complete?

### Output

**Ebook Architecture Document** containing:

- Reader journey overview (transformation arc)
- Chapter sequence with:
  - Chapter number and working title
  - Chapter's one job
  - Reader entry state / exit state
  - Approximate word count target
  - Key content to cover
  - Visual needs (if any)
  - Connection to previous/next chapter
- Front matter plan (if any)
- Back matter plan
- Research gaps identified
- Visual assets needed
- Open questions for outlining phase

### Readiness Criteria

Architecture is ready for outlining when:

- Every chapter has a clear, distinct job
- Chapter sequence creates momentum (no chapter could be skipped)
- Hook chain flows beginning to end
- Quick wins land in the first 20%
- Scope feels right (not too thin, not too stuffed)
- Visual rhythm is considered
- Author confirms this is the ebook they want to write

---

## Skill 3: Chapter Outlining

### Purpose

Transform each chapter's specification from architecture into a beat-level outline that guides drafting. This skill works at the level of individual moves within a chapter, ensuring each beat earns its place and serves the reader.

### Core Philosophy

Ebook chapters are short (often 1,500-2,500 words). Every paragraph matters. Outlining at the beat level — where each beat is a distinct move that advances the reader — prevents bloat and ensures density.

Less is more. High signal, high quality, no fluff.

### Anti-Fluff Discipline

**No throat-clearing openings** — Get to the point in the first paragraph.

**No redundant beats** — If two beats make the same point with different examples, merge or cut.

**Merge setup beats** — If a beat is just setup for another beat, they should probably combine.

**Minimal transitions** — Readers can handle jumps. "Now let's look at..." is usually unnecessary.

### Beat-Level Thinking

Each beat in an ebook chapter should answer:

- **What does the reader gain here that they didn't have before?**
- If the answer is just "context" or "background," that's a red flag.

One perfect example beats three decent ones.

### Word Budget as Forcing Function

Assign rough word count to each beat during outlining. Total must fit the chapter's budget. This forces hard choices about what earns space before drafting begins, not during.

### The Earned Opening Principle

Full books can have scene-setting openings, evocative anecdotes, slow builds. Ebook chapters should open with value — the reader should feel "yes, this is what I came for" immediately.

Hooks matter, but hooks that delay value don't work in this format.

### Ebook-Specific Outlining Concerns

#### Minimum Viable Chapter

Instead of asking "what could this chapter include?", start with "what's the absolute minimum this chapter needs to do its job?" Then add only what genuinely improves it.

#### Front-Load the Insight

Academic writing: setup → evidence → conclusion. Ebook chapters might flip this: insight first → supporting evidence → application. Readers want the payoff early.

#### Density Without Overwhelm

You need to pack value in, but if every sentence is "important," readers have no breathing room. Even short chapters need rhythm — moments of intensity and moments of relief.

#### Scannable Structure

Many readers scan before committing to deep reading. Subheadings should work as value preview. Someone should be able to read ONLY the subheadings and know what the chapter delivers.

#### Subheadings as Promises

Each subheading makes a mini-promise. The outline should test: can we actually deliver what this subheading promises in this space?

#### The "One Screenful" Awareness

On a phone, readers see 100-150 words at a time. Long paragraphs spanning multiple screens feel exhausting. The outline should consider natural visual breaks.

#### Entry Velocity

How many words until the reader knows what this chapter is about and why they should care? Ebook chapters might need to do this in two sentences.

#### The "Delete the First Paragraph" Anticipation

Most first drafts have throat-clearing opening paragraphs. The outline should note: "chapter opens at the point, not before it."

#### Exit Momentum

Chapter endings are decision points: keep reading or put it down? The close needs pull — not a cliffhanger, but a sense of "and there's more good stuff coming."

#### Teach One Thing Well

Ebook chapters should probably teach ONE thing deeply rather than three things adequately. If a chapter has three main points, maybe it should be three chapters.

#### Examples as Evidence, Not Padding

Every example needs to earn its place. Test: if you removed this example, would the point still land? If yes, cut it.

#### Actionability as Design Choice

Does this chapter end with something the reader can DO? Not every chapter needs a call to action, but ebooks are often practical. The outline should decide: is this a "understand" chapter or a "do" chapter?

#### Visual Integration as Structural

Not "we'll add images later" but "this beat needs a diagram because the concept is spatial/sequential/comparative." Visual needs should emerge from outlining.

#### Anti-Sameness

If every chapter follows the same structure (concept → example → application), it becomes monotonous. Variation in chapter shape keeps readers engaged.

#### Cognitive Load Budgeting

How much new information can the reader absorb in this chapter? If introducing a new concept, maybe examples need to be familiar. If using a complex example, maybe the concept needs to be simple.

#### The "Stuck Reader" Anticipation

If someone gets confused in this chapter, where will they get stuck? Identify likely confusion points and decide: clarification, example, visual, or accept that some will re-read?

#### The "Why This Chapter, Why Here" Test

Every chapter should answer: why does this exist as its own chapter (vs. merged) and why does it come at this point? If the outline can't answer clearly, it's a structural problem.

### Subheading Consideration

Subheadings should be suggested during outlining as "first draft suggestions" that later phases can revise. They're structural decisions, not just formatting.

### Session Flow

1. **Identify chapter** — Which chapter are we outlining?
2. **Review architecture specs** — Chapter's job, entry/exit states, word budget
3. **Generate beat candidates** — What moves might this chapter make?
4. **Sequence and trim** — What order? What doesn't earn its place?
5. **Assign word budgets** — How much space for each beat?
6. **Suggest subheadings** — Where do structural breaks belong?
7. **Note visual needs** — What visuals does this chapter require?
8. **Verify value density** — Does every beat add something new?

### Output

**Chapter Outline** containing:

- Chapter context (job, entry/exit states, word budget)
- Beat sequence with:
  - Beat name/description
  - What happens (loosely)
  - What the reader gains
  - Approximate word count
  - Key material to include (research, examples)
  - Visual needs (if any)
- Suggested subheadings
- Opening approach
- Closing approach
- Notes for drafting

### Readiness Criteria

Chapter outline is ready for drafting when:

- Every beat adds something the reader didn't have before
- Word budgets total to chapter target (roughly)
- Opening delivers value fast
- Closing creates pull forward
- Subheadings work as chapter preview
- No redundant beats
- Visual needs identified

---

## Skill 4: Research

### Purpose

Plan, execute, and organize research to fill gaps identified during architecture and outlining. This skill does everything around research — identifying what's needed, generating prompts, organizing findings — while actual research execution happens via search, deep research tools, or external sources.

### Core Philosophy

Not every ebook needs research. Many creator-led ebooks are built from existing knowledge and experience. The skill starts by assessing: is research actually needed, or is this about organizing what you already know?

When research IS needed, the goal is "just enough" — research that materially improves the ebook, not comprehensive academic coverage.

### The "Do You Need Research?" Gate

Before diving into research planning, assess:

- Is this ebook based on the author's direct experience and expertise?
- Has the content already been validated through other formats (video, teaching, etc.)?
- What specific gaps exist that external research could fill?
- Would the ebook be 95% as good without this research?

Sometimes the "research" phase is really an "organize what's in your head" phase.

### Research Modes

Not all research is the same:

| Mode             | Description                                                   | Approach                |
| ---------------- | ------------------------------------------------------------- | ----------------------- |
| **Discovery**    | "I don't know the answer" — genuine gaps                      | Deep research needed    |
| **Verification** | "I think I know, need to confirm" — fact-checking assumptions | Quick targeted searches |
| **Citation**     | "I know this, need a source" — finding authoritative backing  | Source hunting          |
| **Example**      | "I need illustrations" — finding case studies, stories, data  | Story/example hunting   |
| **Visual**       | "I need images/diagrams to reference or model"                | Asset gathering         |

The skill should identify which mode each gap falls into. They require different approaches and different amounts of effort.

### Ebook-Specific Research Concerns

#### Just Enough Research

Full books need comprehensive evidence bases. Ebooks need sufficient evidence. The question isn't "what could we research?" but "what research would materially change the ebook's quality?"

#### Research as Procrastination Risk

Research feels productive. It can become an excuse to not write. The skill should push toward "good enough to draft" rather than "perfectly researched."

#### Citation Density Calibration

How heavily cited does this ebook need to be?

- Practical how-to guide: Almost no citations — author's method is the source
- Contrarian argument: More citations — readers want evidence
- Introducing ideas from another field: Citations for credibility

#### Personal Experience as Primary Source

For creator-led ebooks, your experience IS the research. You've done the thing. You've taught the thing. The skill should help inventory and validate what you already know.

#### The "Already in Your Head" Audit

Before looking externally, systematically inventory:

- What do I already know about this?
- What have I learned from doing this?
- What have readers/viewers/students asked me?

Often you have 80% of what you need and external research fills specific gaps.

#### Confidence Calibration

Rate your confidence on each claim:

- "I'm certain" — probably no research needed
- "I think so" — quick verification
- "I'm guessing" — research needed

Focus research on low-confidence claims that readers might challenge.

#### The "What Will Readers Google?" Anticipation

If you make a claim, what's the first thing a skeptical reader will search? Research should verify that when they do, they'll find confirmation, not contradiction.

#### Expert Quotes as Concentrated Value

Sometimes one great quote from a respected authority adds more credibility than three paragraphs of explanation. Research should consider: where would an outside voice strengthen this?

#### Competitive Research

Not "is there a market?" but "what do other ebooks on this topic do well that I can learn from?" and "what do they miss that I should cover?"

#### Research That Enables Cutting

Sometimes research reveals you don't need a section because someone else already covered it perfectly. "For more on X, see [authoritative source]" lets you skip a chapter.

#### The Diminishing Returns Awareness

First hour of research yields 80% of value. Second hour yields 15%. Third hour yields 4%. Know when you've hit "good enough."

#### Research Debt as Explicit Tracking

If you decide to skip researching something for speed, log it as "verify before publish" debt. Consciously deferred, not ignored.

#### Organizing for Drafting

The output of research isn't "here's what I found." It's "here's what I found, tagged to exactly where you'll use it in the ebook."

#### When Research Reveals Problems

Sometimes research surfaces that your premise is wrong, your approach is outdated, or someone else already wrote this ebook better. The skill should have a path for "research killed this project" or "research requires a pivot."

### Session Flow

1. **Research gate** — Does this ebook actually need research? What kind?
2. **Inventory existing knowledge** — What do you already know?
3. **Identify gaps by chapter** — What's missing where?
4. **Categorize gaps by mode** — Discovery, verification, citation, example, visual?
5. **Generate research prompts** — What specifically to look for?
6. **Execute research** — Via search tools, deep research, external sources
7. **Organize findings** — By chapter, ready for drafting
8. **Flag research debt** — What's deferred for later verification?

### Output

**Research Notes** containing:

- Research assessment (what was needed, what was skipped)
- Findings organized by chapter
- Key quotes and citations with full attribution
- Examples and case studies collected
- Visual references gathered
- Research debt log (deferred items)
- Any concerns or pivot flags

### Readiness Criteria

Research is ready to support drafting when:

- All discovery-mode gaps have findings
- Key claims have verification
- Examples exist for chapters that need them
- Findings are organized by chapter
- Research debt is logged (not forgotten)
- No unresolved concerns that would change the ebook's direction

---

## Skill 5: Drafting

### Purpose

Produce the complete first draft of the ebook. In this skill, AI is the primary drafter — writing chapter by chapter following the outlines, maintaining voice consistency, and producing prose ready for human review and editing.

### Core Philosophy

The AI drafts. The human reviews and revises. This division of labor lets the human focus on judgment and refinement rather than blank-page creation.

The draft should sound like the author wrote it, not like AI generated it. Voice capture and consistency are paramount.

### The Drafting Model

**AI leads:** AI writes the draft following outlines and research.

**Chapter-by-chapter:** Draft one chapter, human reviews and approves (or adjusts), then next chapter. This prevents drift and allows course-correction.

**Outline fidelity:** AI follows the outline closely. Deviations are flagged, not silently made.

**Voice consistency:** The draft sounds like one person throughout — the author.

### Voice Capture Before Drafting

Before drafting chapter 1, establish voice parameters:

- **Sentence length preference** — Short and punchy? Varied? Flowing?
- **Formality level** — Casual, conversational, professional, academic?
- **Humor** — None, occasional, frequent? Dry, playful?
- **Personal disclosure level** — Vulnerable, moderate, reserved?
- **Typical paragraph structure**
- **Favorite transitional phrases**
- **Words/phrases to always avoid**
- **Words/phrases that sound like you**
- **Sample paragraphs that exemplify your voice**

For creator-led ebooks, existing content (YouTube scripts, blog posts, previous writing) serves as voice training material.

### The "Invisible AI" Standard

The draft should read like the author wrote it. No AI tells:

- No hollow transitions ("Let's dive in," "Moving on to")
- No filler phrases ("It's important to note that," "It's worth mentioning")
- No hedge words ("somewhat," "arguably," "it could be said")
- No overused AI words ("delve," "crucial," "comprehensive," "myriad," "leverage")
- No sycophantic openings
- No formulaic structures
- No unnecessary summarization
- No passive voice where active works

### Screen-Reading Prose

Ebook prose is different from print prose:

- Shorter sentences
- Shorter paragraphs (3-5 sentences max)
- More white space
- More direct address ("you")
- Contractions as default ("you're" not "you are")
- Front-loaded paragraphs (point first, then support)

### Drafting Principles

#### Word Budget Targeting

Draft to the word budget specified in the outline. Not exactly, but within range. A 2,000-word chapter target shouldn't produce 800 or 4,000 words.

#### Beat-to-Prose Execution

Each beat in the outline becomes prose. Track progress: "I'm executing beat 3 of 7 now."

#### Subheading Placement

Use the subheadings from the outline, adjusting wording if needed for flow.

#### Visual Placeholders

Where visuals are specified, write around them: "[FIGURE: Diagram showing the numbering system]" and ensure prose references the visual naturally.

#### Research Integration

Weave research in naturally as supporting evidence, not as information dumps.

#### Specificity Over Generality

Not "many people struggle with this" but "you've probably stared at a blank card wondering where to start."

#### Directive Confidence

"Do this" not "you might want to consider doing this." Readers paid for guidance. Guide them.

#### Action-Oriented Prose

Favor imperative mood: "Write your first card" not "The first card should be written."

#### Assumed Success Framing

Write as if the reader will succeed: "When you complete your first card..." not "If you manage to..."

#### One Idea Per Paragraph

Screen paragraphs should usually do one thing. When in doubt, hit return.

#### Sentence Variety

Vary sentence length rhythmically. All short feels choppy. All long exhausts.

#### Strong Verbs

"She sprinted" not "she ran quickly." Strong verbs over adverb-propped weak verbs.

### Chapter Completion Checklist

Before marking a chapter draft complete:

- Word count within target range
- All beats from outline addressed
- All visual placeholders inserted
- Subheadings in place
- Opens strong, closes with momentum
- Voice consistent with established parameters

### Placeholder Discipline

When something can't be completed, use specific placeholders:

- `[PLACEHOLDER: Need specific date Luhmann started his system]`
- `[REVIEW: This section feels weak — consider better example]`
- `[VISUAL: Diagram showing branching system]`

Specific placeholders let future-you know exactly what's needed.

### Revision Notes Inline

AI may have doubts during drafting. Capture these as inline comments:

- `[NOTE: Consider if this example is relatable to beginners]`
- `[FLAG: Verify this claim before publishing]`

These inform the editing phase.

### Multi-Chapter Consistency

After every 3-4 chapters, do a consistency check:

- Is voice holding?
- Are terms used consistently?
- Is complexity level stable?

### Special Content Types

**Front matter:**

- Introduction: Often best drafted AFTER main content
- How to use this guide: Brief, practical, can be templated

**Back matter:**

- Conclusion: Synthesize transformation, celebrate progress, no new content
- Resources: Curated list with brief annotations
- What's next: Bridge to other products — this is marketing copy, different register
- About the author: Often better written by human

### When Things Go Wrong

**Outline doesn't work:** Draft best attempt, flag with `[STRUCTURE CONCERN: explanation]`, continue.

**Research is thin:** Write around it, insert `[RESEARCH NEEDED: specific gap]`, continue.

**Voice drifting:** Pause, recalibrate against voice sample, revise recent section.

**Chapter isn't coming together:** Flag it: "I'm not confident this chapter is working. Here's what I'm struggling with..."

### Draft Quality Self-Assessment

After completing the full draft, AI produces honest self-assessment:

- Strongest chapters
- Weakest chapters (and why)
- Sections flagged for human attention
- Voice consistency rating
- Confidence level in the draft overall

### Session Flow

1. **Confirm voice parameters** — Review or establish voice capture
2. **Confirm chapter** — Which chapter are we drafting?
3. **Review outline and research** — What's the plan? What material do we have?
4. **Draft the chapter** — Following outline, maintaining voice
5. **Self-review** — Does it work? Flag concerns
6. **Human review point** — Approve, request changes, or discuss
7. **Proceed to next chapter** — Repeat until draft complete
8. **Full draft self-assessment** — Honest evaluation of the complete draft

### Output

**Complete First Draft** containing:

- All chapters drafted
- Front matter drafted
- Back matter drafted
- Inline placeholders and flags preserved
- Draft self-assessment

### Readiness Criteria

Draft is ready for editing when:

- All chapters complete
- All front/back matter complete
- Word count appropriate for ebook scope
- Voice reasonably consistent throughout
- All flags and placeholders documented
- Author has done initial read-through

---

## Skill 6: Editing & Revision

### Purpose

Refine the draft into a polished final manuscript through collaborative editing. Unlike drafting where AI leads, editing is collaborative — AI identifies issues and suggests fixes, human decides and approves.

### Core Philosophy

Editing is where the human gets hands-on. AI serves as an expert editor who surfaces problems, suggests solutions, and maintains quality standards — but the human makes final decisions.

Two passes maximum for most ebooks. Thoroughness through focus, not repetition.

### The Two-Pass Model

**Pass 1: Structural and Voice Edit**

- Does the ebook work as a whole?
- Does it sound like you?
- Are there pacing, flow, or gap problems?

**Pass 2: Line-Level and Polish**

- Does every sentence earn its place?
- Is it clean and professional?
- Is it ready to publish?

### Pass 1: Structural and Voice Edit

#### The "Read It Cold" Test

Before any editing, read the entire draft straight through without stopping to fix things. Experience it as a reader would. Note reactions, but don't edit yet. This reveals: does this ebook _work_?

#### Structural Concerns to Assess

**Transformation delivery:** Did the ebook deliver the transformation promised?

**Reader journey:** Track intellectual and emotional state chapter by chapter. Where might readers get confused? Bored? Frustrated?

**Necessary and sufficient:** For each chapter — is this necessary? Is it sufficient?

**Chapter order:** Could chapters be reordered? Is there a better sequence?

**Opening autopsy:** Does the first 10% hook AND deliver value? Would you keep reading?

**Ending autopsy:** Does it feel complete? Does it celebrate transformation? Any new content introduced (shouldn't be)?

**Pacing diagnosis:** Where does it drag? Where does it rush?

**Redundancy detection:** Same point made twice? Redundant examples?

**Gap detection:** Anything missing? Assumed knowledge that shouldn't be assumed?

**The "skip" detector:** Which sections would readers skip? This reveals low-value content.

#### Voice Concerns to Assess

**Voice consistency:** Does it all sound like the same person?

**AI-ism hunt:** Where does AI voice leak through?

**Authority calibration:** Does the author sound confident or hedging?

**Personality audit:** Does personality come through, or is it generic?

**Tonal coherence:** Is tone consistent, or does it shift randomly?

#### Pass 1 Output

After Pass 1, you should have:

- List of structural changes needed
- List of sections needing voice rewrite
- List of pacing problems with proposed fixes
- List of gaps to fill
- Overall assessment: how much work does this need?

### Pass 2: Line-Level and Polish

#### Signal-to-Noise

Every sentence must add signal. For each paragraph: what would be lost if I cut this sentence? If "nothing," cut it.

#### Line-Level Concerns to Assess

**Paragraph purpose:** What is this paragraph's job? One paragraph, one job.

**Opening sentences:** First sentence of each paragraph carries weight. Are they strong?

**Closing sentences:** Last sentence of each section creates pull. Do they?

**Transition trimming:** "Now let's look at..." is usually cuttable.

**Adverb suspicion:** Most adverbs weaken. "Ran quickly" → "sprinted."

**Adjective skepticism:** Stacked adjectives dilute. Pick the one that matters.

**Filler elimination:** "In order to" → "to." "Due to the fact that" → "because."

**"Very" and "really" audit:** These almost never strengthen.

**Weasel words:** "Some people say" — who? Either strengthen or cut.

**Passive voice:** Convert to active where possible.

**Sentence variety:** Rhythm through variation in length.

**Paragraph length:** 3-5 sentences max for screens.

#### Polish Concerns

**Subheading effectiveness:** Do they clearly signal what follows?

**List hygiene:** Parallel structure, 3-7 items, consistent length.

**Consistency pass:** Terminology, capitalization, formatting throughout.

**Fact verification:** Every verifiable claim checked.

**Link check:** All internal and external links work.

**Read aloud pass:** Your ear catches what your eye misses.

### The Collaboration Model

**AI's role:**

- Identify problems specifically
- Suggest concrete fixes
- Maintain style sheet and consistency
- Flag concerns with severity levels

**Human's role:**

- Decide which fixes to accept
- Rewrite sections that need personal voice
- Make judgment calls on subjective issues
- Final approval on everything

#### Edit Note Format

When AI flags issues:

- **Location:** Chapter X, paragraph Y (or quote the text)
- **Issue:** What's wrong (specific)
- **Severity:** Critical / Important / Minor / Suggestion
- **Suggested fix:** Concrete proposal

#### The "Your Call" Category

Some edits are objective (typos, errors). Others are subjective (word choice, style). AI should distinguish: "This is wrong" vs. "This is a style choice — here's an alternative."

### Ebook-Specific Editing Concerns

**Screen reading optimization:** Paragraphs short enough? Subheadings frequent enough?

**Preview optimization:** First 10-15% doing its sales job?

**TOC accuracy:** Chapter titles match exactly?

**Device awareness:** Formatting works across readers?

**Image placement:** Images near relevant text? Alt text exists?

**Front matter trimming:** Does everything before chapter 1 earn its place?

### Version Control

- Draft v1 (from drafting skill)
- Draft v2 (after structural edit)
- Draft v3 (after line edit)
- Final (ready to publish)

### The "Done" Decision

Editing can continue forever. Recognize "done":

- All critical issues resolved
- All important issues resolved or consciously accepted
- Only minor issues remain
- Author is confident
- Further editing has diminishing returns

### Session Flow

**For Pass 1:**

1. Read draft cold (human, outside of session)
2. AI reads draft and produces structural/voice assessment
3. Review findings together, prioritize
4. Work through structural changes
5. Work through voice issues
6. Produce v2 draft

**For Pass 2:**

1. AI reads v2 and produces line-level edit notes
2. Work through edits section by section
3. Human accepts, modifies, or rejects each suggestion
4. Consistency and polish pass
5. Final read-through
6. Produce final manuscript

### Output

**Final Manuscript** containing:

- Polished, complete ebook
- All placeholders resolved
- All flags addressed
- Style sheet (for future reference)
- Pre-publication checklist completed

### Readiness Criteria

Manuscript is ready to publish when:

- Both passes complete
- All critical and important issues resolved
- Consistency verified
- Facts checked
- Links working
- Read aloud without stumbling
- Author confident and proud of the work

---

## Reference Documents

Each skill benefits from focused reference documents. Unlike the Book Factory's extensive reference library, ebook skills embed most guidance directly and use references only for content that would bloat the main skill.

### For Drafting Skill

**1. Ebook Prose Style Guide**

- Screen-reading best practices
- Paragraph and sentence guidelines
- Formatting conventions for ebooks
- Platform-specific considerations

**2. AI Writing Tells to Avoid**

- Comprehensive list of AI-isms
- Hollow transitions
- Filler phrases
- Hedge words
- Overused words
- Formulaic patterns
- Examples of good vs. AI-sounding prose

**3. Voice Capture Template**

- Structured format for defining author voice
- Questions to answer before drafting
- Sample paragraph collection approach

**4. Opening and Closing Patterns**

- Catalog of chapter opening types with examples
- Catalog of chapter closing types with examples
- When to use each

### For Editing Skill

**5. Edit Note Template**

- Standard format for flagging issues
- Severity level definitions
- Examples of good edit notes

**6. Style Sheet Template**

- Terminology tracking
- Capitalization decisions
- Formatting conventions
- Consistency checklist

**7. Common Ebook Problems Checklist**

- Frequent structural issues
- Frequent voice issues
- Frequent line-level issues
- Quick diagnostic questions

**8. Pre-Publication Checklist**

- Final verification items
- Platform-specific requirements
- Quality gates before publish

---

## Handoffs Between Skills

Clear handoffs prevent gaps and ensure continuity.

### Ebook Discovery → Ebook Concept Development

**Passes forward:**

- Discovery Tracker with evaluated candidates
- Candidate handoff summary for chosen idea
- User profile (intent, content inventory, expertise areas)
- Viability assessment with reasoning

**Concept Development needs to know:**

- What's the core idea (1-2 sentences)?
- Where did it come from (which mode, what material)?
- What validation signals exist?
- What concerns were identified?
- What's the user's intent (income, authority, etc.)?

### Ebook Concept Development → Ebook Architecture

**Passes forward:**

- Ebook Concept Document with all elements developed
- Scope boundaries defined
- Platform direction
- Open questions identified

**Architecture needs to know:**

- Who is the reader (specifically)?
- What's the transformation?
- What's the scope constraint?
- What content source exists?

### Ebook Architecture → Chapter Outlining

**Passes forward:**

- Ebook Architecture Document with full chapter sequence
- Each chapter's job, entry/exit states, word budget
- Research gaps identified
- Visual needs identified

**Outlining needs to know:**

- What's this chapter's one job?
- Where does the reader start/end?
- How much space do we have?
- What comes before/after?

### Chapter Outlining → Research

**Passes forward:**

- Complete chapter outlines
- Specific gaps flagged in outlines
- Visual needs listed

**Research needs to know:**

- What specific gaps need filling?
- What mode is each gap (discovery, verification, citation, example)?
- What chapters need what?

### Research → Drafting

**Passes forward:**

- Research notes organized by chapter
- Key quotes and citations
- Examples collected
- Research debt logged

**Drafting needs to know:**

- What material is available for each chapter?
- What's verified vs. needs checking?
- What's deferred?

### Chapter Outlining → Drafting

**Passes forward:**

- Complete chapter outlines with beats
- Word budgets per beat
- Subheading suggestions
- Visual placements
- Opening/closing approaches

**Drafting needs to know:**

- What's the beat sequence?
- What's the word budget?
- What material goes where?
- What's the voice?

### Drafting → Editing

**Passes forward:**

- Complete first draft
- Inline flags and placeholders
- Draft self-assessment
- Voice parameters used

**Editing needs to know:**

- What does AI think is strong/weak?
- What's flagged for attention?
- What's the intended voice?
- What placeholders remain?

### Editing → Publication

**Passes forward:**

- Final manuscript
- Style sheet
- Pre-publication checklist completed

**Publication needs:**

- Clean, complete manuscript
- Formatting ready for platform
- All verification complete

---

## Appendix: The Concentrated Solution Mindset

This mindset should permeate every skill in the pipeline:

**Ebooks are not lesser books.** They're a distinct format serving readers who value their time.

**The constraint makes it harder.** Less room means higher standards per page.

**Density is not overwhelm.** Pack value in while maintaining rhythm and breathing room.

**Every element earns its place.** Chapters, paragraphs, sentences, words — all must justify their existence.

**Speed-to-value is the metric.** How quickly does the reader feel "this was worth it"?

**Completion is satisfaction.** The reader should feel "I got what I came for" at the end.

**Quality through constraint.** The discipline of brevity produces better work.

---

_This document should be updated as skills are built and the Ebook Factory evolves._
