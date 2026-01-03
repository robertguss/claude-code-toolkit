# Chapter Architect

> Plan individual chapters at beat-level granularity. Transforms high-level chapter specs into detailed outlines that guide drafting while preserving creative freedom.

---

## Overview

The Chapter Architect skill transforms a chapter's high-level specification (from book-architect) into a beat-level outline that guides drafting while preserving creative freedom. The result is a compass, not GPS—it points direction and marks waypoints without dictating every turn.

Core philosophy: **reader-first, always.** Every beat exists to move the reader toward the chapter's destination—intellectually and emotionally. Claude contributes ideas, challenges weak thinking, and advocates for what serves the reader. The author has final approval on all decisions.

---

## Quick Start

### Prerequisites

- Architecture Document with chapter specification (from book-architect)
- Research Dossier for the chapter (from book-research-assistant)
- Book Concept Document (from book-ideation)

### Basic Usage

=== "Claude Code"

    ```markdown
    When planning chapter outlines, read and follow /path/to/claude-skills/non-fiction-book-factory/chapter-architect/SKILL.md.
    ```

=== "Claude.ai"

    Upload `chapter-architect.skill` to Settings → Skills.

**Sample prompt:**
```
I'm ready to architect Chapter 3. Here's the chapter spec from my Architecture Document and the research dossier: [paste documents]
```

---

## Features

| Feature | Description |
|---------|-------------|
| **Beat-Level Planning** | Detailed structure without over-prescription |
| **Compass Not GPS** | Direction and waypoints, not every turn |
| **Emotional Arc Tracking** | Where reader is intellectually AND emotionally |
| **Load-Bearing Identification** | Which beats can/can't be moved or cut |
| **Opening/Closing Deep Dives** | Extra attention to critical moments |
| **Session Flexibility** | Simple chapters = one session; complex = multiple |

---

## Core Philosophy

1. **Reader-first, always** — Every beat moves reader toward chapter's destination

2. **Compass, not GPS** — Points direction, doesn't dictate every turn

3. **Intent over prescription** — Each beat captures WHY it exists, enabling intelligent adaptation

4. **Emotional arc matters** — Track how reader FEELS, not just what they learn

---

## Workflow

### Phase 1: Orient

Review inputs together and surface tensions, questions, or issues.

**Key questions:**

- Standard chapter or special type? (introduction, conclusion, case study)
- Is research sufficient? Any gaps?
- Competing ways to approach this chapter?
- What's the emotional shape? (tension→release, confusion→clarity)

**Pause point:** If significant unresolved questions emerge, resolve before proceeding.

### Phase 2: Brainstorm Beats

Generate candidate beats without worrying about sequence yet.

1. Review beat vocabulary together
2. Generate possible beats—both author and Claude contribute
3. Consider opening options
4. Consider closing options
5. Capture all candidates without judging

**Claude's role:** Actively contribute beat ideas, not just record.

### Phase 3: Sequence and Debate

Put beats in order—this is where real collaboration happens.

1. Propose initial sequence
2. Walk through reader's experience
3. Debate ordering decisions
4. Identify load-bearing vs. flexible beats
5. Cut beats that aren't earning their place
6. Add beats if gaps emerge

**Pause point:** If sequence isn't clicking, pause. Complex chapters need marinating time.

### Phase 4: Flesh Out Beats

For each beat, define:

- **Beat name and type**
- **What happens** (loosely described)
- **Reader destination** (intellectual and emotional—non-negotiable)
- **Key material** (pointers to research, quotes, examples)
- **Load-bearing flag** (can this be moved or cut?)
- **Notes** (anything ghostwriter should know)

**Special attention:** Opening and closing beats get deeper treatment with specific hooks, callbacks, or images.

### Phase 5: Review and Finalize

Stress-test the complete arc before producing the document.

1. Walk through reader's experience beat by beat
2. Check against common problems
3. Verify chapter delivers on its job
4. Confirm bridge to next chapter works
5. Get final author approval
6. Produce Chapter Outline Document

---

## Inputs & Outputs

### Inputs

| Input | Required | Source |
|-------|----------|--------|
| Architecture Document (chapter spec) | Yes | book-architect |
| Research Dossier (chapter section) | Yes | book-research-assistant |
| Book Concept Document | Yes | book-ideation |
| Author notes on chapter | Optional | Author |

### Outputs

**Chapter Outline Document** containing:

1. **Chapter Context** — Job, entry/exit states, connections, emotional arc, tone notes
2. **Reader Journey Walkthrough** — Prose narrative of the experience
3. **Beat Sequence** — Detailed breakdown of each beat
4. **Opening Deep Dive** — Expanded treatment of opening
5. **Closing Deep Dive** — Expanded treatment of closing

---

## Beat Elements

Each beat includes:

| Element | Description |
|---------|-------------|
| Beat name | Descriptive identifier |
| Beat type | From vocabulary (claim, story, objection, etc.) |
| What happens | Loose description of content |
| Reader destination | Where reader ends up intellectually AND emotionally |
| Key material | Specific pointers to research |
| Load-bearing | Yes/No—can this beat move or be cut? |
| Notes | Guidance for ghostwriter |

---

## Readiness Criteria

Before handoff, confirm:

- [ ] All beats have clear reader destinations (intellectual and emotional)
- [ ] Load-bearing beats are flagged
- [ ] Key material is curated and pointed to for each beat
- [ ] Opening and closing have deep-dive treatment
- [ ] Reader journey walkthrough captures chapter's feel
- [ ] Chapter delivers on its job and exit state
- [ ] Bridge to next chapter is clear
- [ ] Author has approved the outline

---

## Best Practices

- **Let Claude contribute beats** — The skill is collaborative, not transcription
- **Debate the sequence** — This is where real value emerges
- **Flag load-bearing beats clearly** — Protects structure during drafting
- **Don't skip emotional arc** — HOW reader feels matters as much as what they learn
- **Give opening/closing extra attention** — These are high-leverage moments
- **Trust pause points** — Complex chapters need thinking time between sessions

---

## Integration

### Pipeline Position

```mermaid
flowchart LR
    A[book-research-assistant] --> B[chapter-architect]
    B --> C[draft-coach/ghostwriter]
```

### Upstream Skills

- **book-architect** — Provides Architecture Document with chapter specs
- **book-research-assistant** — Provides Research Dossier

### Downstream Skills

- **draft-coach** — If author is writing and wants feedback
- **ghostwriter** — If Claude is drafting (with author approval)

---

## References

The skill loads these as needed:

- `special-chapter-types.md` — Introductions, conclusions, case studies
- `emotional-arc-patterns.md` — Tension→release, confusion→clarity, etc.
- `beat-vocabulary.md` — Types of beats available
- `opening-strategies.md` — How to start chapters
- `closing-strategies.md` — How to end chapters
- `common-chapter-problems.md` — Antipatterns to avoid

---

## Related Skills

- [Book Architect](book-architect.md) — Creates chapter specifications
- [Book Research Assistant](book-research-assistant.md) — Provides research dossier
- [Book Ideation](book-ideation.md) — Creates Book Concept Document
