# Brainstorm

A collaborative brainstorming system designed for multi-session ideation projects that span days or weeks.

## Philosophy

This is genuine intellectual partnership, not idea generation on demand:

- Claude brings observations and suggestions proactively
- Pushes back directly on weak reasoning or blind spots
- Surfaces connections to other projects (in connected mode)
- Asks hard questions the user might avoid
- Logs reasoning and disagreements for future reference

## Session Flow

**Session Start** — Claude asks:

1. New or continuing project?
2. Deep exploration or quick progress today?
3. Connected mode (cross-project awareness) or clean-slate mode (fresh thinking)?
4. Confirms the brainstorming context and recommends appropriate methods

**During Session:**

- Proactively offers observations: "I notice you keep circling back to X—want to dig into why?"
- Challenges weak reasoning: "I'm not convinced by that reasoning. Here's why..."
- Marks decision points: "This feels like a decision point. Should we log: [decision]?"
- Suggests methods when stuck or needs structure
- Captures parking lot ideas for other projects

**Session End:**

- Exit summary with current state, decisions made, open questions
- The overnight test: "What question should you sit with before our next session?"
- Generates versioned project document

## Brainstorming Methods (25+)

**Divergent (Generate Ideas):**
SCAMPER, Random Stimulus, Forced Analogies, Mind Mapping, Worst Possible Idea, TRIZ Principles

**Convergent (Focus & Decide):**
Affinity Grouping, Dot Voting, Weighted Scoring, Elimination Rounds, 2x2 Matrix

**Problem-Framing:**
First Principles, 5 Whys, Inversion, Problem Reframing, Jobs-to-be-Done

**Perspective Shifts:**
Six Thinking Hats, Steelman, Audience Reality Check, Stakeholder Mapping, Time Horizons

**Evaluation & Risk:**
Pre-mortem, Assumption Surfacing, 10/10/10, Reversibility Test

**Theological/Philosophical:**
Presuppositional Analysis, Telos Examination, Stewardship Frame

## Idea Maturity Tracking

Each idea is tracked through maturity levels:

| Level      | Meaning                              |
| ---------- | ------------------------------------ |
| Raw        | Just captured, unexamined            |
| Developing | Being explored, has potential        |
| Refined    | Shaped, tested, ready for evaluation |
| Ready      | Decision made, ready to execute      |
| Parked     | Not now, but worth keeping           |
| Eliminated | Killed, with documented reasoning    |

## File Structure Created

```text
brainstorms/
├── _parking-lot.md              # Cross-project idea capture
└── project-name/
    ├── _index.md                # Changelog and decision log
    ├── project-name-v1.md       # Version 1
    ├── project-name-v2.md       # Version 2
    └── ...
```

## Use Cases

- SaaS products and software tools
- Book ideas and content strategy
- Newsletter and creative projects
- Business decisions and strategic planning
- Any creative or analytical challenge requiring sustained thinking
