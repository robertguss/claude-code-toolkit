---
name: chapter-architect
license: Proprietary
metadata:
  author: robertguss
  version: "1.0"
description: "Plan and architect a single chapter at beat-level granularity — define scene breaks, establish pacing, map emotional arcs, and identify tension points. Use when you have a chapter from the Architecture Document and need a detailed chapter breakdown, story beats outline, or chapter structure before drafting. Produces a Chapter Outline Document for use by draft-coach or ghostwriter."
---

# Chapter Architect

Transform a chapter's high-level specification (from book-architect) into a
beat-level outline that guides drafting while preserving creative freedom.

## Core Philosophy

- **Reader-first** — every beat moves the reader toward the chapter's
  destination, intellectually and emotionally.
- **Compass, not GPS** — the outline points direction; the ghostwriter has
  creative freedom within the structure.
- **Intent over prescription** — each beat captures _why_ it exists, enabling
  intelligent adaptation during drafting.
- The author has final approval on all decisions.

## Session Flow

### Session Start

1. **Identify context:** New chapter or continuing? If continuing, request the
   latest working draft.
2. **Gather inputs:** Architecture Document, Research Dossier (chapter section),
   Book Concept Document, any author notes.
3. **Confirm which chapter** and surface key specs: number, working title, job,
   reader entry/exit states, key concepts, bridges to adjacent chapters.

### Phase 1: Orient

Review inputs together. Surface any tensions, questions, or issues.

**Key questions to explore:**

- Is this a standard chapter or special type? (introduction, conclusion,
  case-study, etc.)
  - _If special type, read `references/special-chapter-types.md`_
- Is the research sufficient? Any gaps?
- Are there competing ways to approach this chapter?
- What's the emotional shape of this chapter? (tension→release,
  confusion→clarity, etc.)
  - _Reference `references/emotional-arc-patterns.md` as needed_

Surface concerns, ask probing questions, identify what's unclear or
underdeveloped.

**Pause point:** If significant unresolved questions emerge, resolve before
proceeding.

### Phase 2: Brainstorm Beats

Generate candidate beats without worrying about sequence yet.

**Process:**

1. Review the beat vocabulary together
   - _Read `references/beat-vocabulary.md`_
2. Generate possible beats—both author and Claude contribute
3. Consider opening options
   - _Reference `references/opening-strategies.md`_
4. Consider closing options
   - _Reference `references/closing-strategies.md`_
5. Capture all candidates without judging yet

Actively contribute beat ideas. Suggest moves the author might not have
considered.

### Phase 3: Sequence and Debate

1. Propose an initial sequence
2. Walk through the reader's experience beat by beat — track intellectual and
   emotional state
3. Debate ordering: counterargument placement, breathing room, prerequisite
   knowledge
4. Mark load-bearing beats (structural, can't move) vs. flexible
5. Cut beats that aren't earning their place; add beats if gaps emerge

Advocate for the reader. Push back when a sequence feels off. Offer alternatives
with reasoning.

**Pause point:** If the sequence isn't clicking, pause — complex chapters may
need marinating time.

### Phase 4: Flesh Out Beats

For each beat in the final sequence, define:

- **Beat name and type** (from vocabulary)
- **What happens** (loosely described—compass, not GPS)
- **Reader destination** (intellectual and emotional—this is non-negotiable)
- **Key material** (specific pointers to research, quotes, examples)
- **Load-bearing flag** (yes/no—can this beat be moved or cut?)
- **Notes** (anything the ghostwriter should know)

**Example beat:**

```
Beat 3: "The Counterargument" (Challenge)
What happens: Present the strongest objection to the chapter's thesis
Reader destination: Intellectual — understands the real tension; Emotional — feels the stakes
Key material: Research Dossier §4.2 (Smith 2021 study), reader survey quotes
Load-bearing: Yes — thesis resolution in Beat 5 depends on this
Notes: Keep this honest; a straw man weakens the payoff
```

**Special attention:** Opening and closing beats get deeper treatment.

- _Reference `references/opening-strategies.md` and
  `references/closing-strategies.md`_
- Articulate _why_ this opening/closing works
- Note what to avoid
- Identify specific hooks, callbacks, or images to consider

### Phase 5: Review and Finalize

1. Walk through the reader's experience beat by beat — track intellectual and
   emotional state
2. Check against common problems — _read `references/common-chapter-problems.md`_
3. Verify the chapter delivers on its job and reaches the exit state
4. Confirm bridge to the next chapter; get final author approval

**Only after approval:** Produce the Chapter Outline Document using
`assets/templates/chapter-outline-template.md`. Summarize open questions,
confirm next steps (handoff to draft-coach/ghostwriter or note where to resume).

## Inputs

| Document              | Source               | Purpose                                                 |
| --------------------- | -------------------- | ------------------------------------------------------- |
| Architecture Document | `book-architect`     | Chapter's job, entry/exit states, key concepts, bridges |
| Research Dossier      | `research-assistant` | Evidence, examples, quotes organized by chapter         |
| Book Concept Document | `book-ideation`      | Reader, promise, thesis, voice, author angle            |
| Author notes          | Author               | Any existing thoughts, fragments, or constraints        |

## Outputs

**Chapter Outline Document** containing:

1. Chapter Context (job, entry/exit states, connections, emotional arc, tone
   notes)
2. Reader Journey Walkthrough (prose narrative of the experience)
3. Beat Sequence (detailed breakdown of each beat)
4. Opening and Closing Deep Dives (expanded treatment)

See `assets/templates/chapter-outline-template.md` for exact format.

## Readiness Criteria

Before handoff, confirm:

- [ ] All beats have clear reader destinations (intellectual and emotional)
- [ ] Load-bearing beats are flagged
- [ ] Key material is curated and pointed to for each beat
- [ ] Opening and closing have deep-dive treatment
- [ ] Reader journey walkthrough captures the chapter's feel
- [ ] The chapter delivers on its job and exit state
- [ ] Bridge to next chapter is clear
- [ ] Author has approved the outline

## Handoff

The Chapter Outline Document feeds into:

- **`draft-coach`** — if author is writing and wants feedback
- **`ghostwriter`** (modal) — if Claude is drafting and author approves

The ghostwriter also receives the full Research Dossier for the chapter, with
the outline's key material pointers as primary guidance.
