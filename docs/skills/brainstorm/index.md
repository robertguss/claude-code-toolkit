# Brainstorm

> Collaborative brainstorming partner for multi-session ideation projects. Use when you want to brainstorm, ideate, explore ideas, or think through problems -- whether for SaaS products, software tools, book ideas, newsletter content, business strategies, or any creative/analytical challenge.

## Overview

The Brainstorm skill transforms Claude into a genuine intellectual partner for ideation projects that span days or weeks. Unlike simple idea generation, this skill emphasizes collaborative thinking, proactive challenge of assumptions, and persistent documentation that maintains context across sessions.

At its core, Brainstorm operates on the principle that good ideas emerge through dialogue, not dictation. Claude will bring observations and suggestions proactively, push back on weak reasoning, surface connections to other work (when desired), and ask the hard questions you might avoid. The human always decides, but the reasoning gets logged -- creating a rich record of the thinking process, not just the conclusions.

The skill solves the fundamental problem of multi-session creative work: maintaining continuity. Through versioned Markdown documents, structured session logs, and idea maturity tracking, you can pick up exactly where you left off -- whether that was yesterday or three weeks ago.

## Quick Start

### Prerequisites

- Claude Code CLI or Claude.ai with skill upload capability
- A folder where brainstorming project files will be stored

### Basic Usage

**For Claude Code**, reference the skill in your project's `CLAUDE.md`:

```markdown
## Skills

When brainstorming, read and follow /path/to/claude-skills/brainstorm/SKILL.md.
```

**For Claude.ai**, upload the packaged `.skill` file via Settings > Skills.

**Sample prompt to begin:**

```text
I want to brainstorm a new SaaS product idea. I've noticed that developer tools
for API documentation are either too complex or too basic. Help me explore this space.
```

Claude will then ask the session-start questions to establish context and mode before diving in.

## Features

| Feature | Description |
|---------|-------------|
| **Multi-session continuity** | Versioned documents maintain full context across days or weeks |
| **Idea maturity tracking** | Six-level system (Raw > Developing > Refined > Ready > Parked > Eliminated) |
| **25+ thinking methods** | Curated catalog of divergent, convergent, and evaluative techniques |
| **Session energy modes** | Deep exploration vs. quick progress -- adapts to your available time |
| **Connected vs. clean-slate** | Cross-project awareness or fresh thinking without baggage |
| **Decision logging** | Captures reasoning, not just conclusions |
| **Disagreement protocol** | Structured approach when you and Claude see things differently |
| **Parking lot** | Captures off-topic ideas for other projects |
| **Synthesis generation** | Distills best thinking after multiple sessions |

## Workflow

### Session Start

Every session begins with four orienting questions:

1. **New or continuing?** -- "Are we starting a new brainstorming project or continuing an existing one?"
   - If continuing: Claude asks for the latest version file
   - If new: Proceeds to project initialization

2. **Session energy** -- "Deep exploration today or quick progress?"

3. **Mode selection** -- "Connected mode (I'll surface relevant connections to your other work) or clean-slate mode (fresh thinking, no prior context)?"

4. **Context type** (new projects only) -- Claude identifies and confirms the brainstorming context, then recommends appropriate methods

### During Session

**Active collaboration behaviors:**

- Proactive observations: "I notice you keep circling back to X -- want to dig into why?"
- Direct challenges: "I'm not convinced by that reasoning. Here's why..."
- Connection surfacing (connected mode): "This relates to what you explored in [other project]"
- Hard questions the user might avoid
- The "So What?" test: "Why does this matter? Who specifically cares?"

**Decision checkpoints:**

When a decision crystallizes, Claude explicitly marks it: "This feels like a decision point. Should we log: [decision statement]?" Both the decision and the reasoning are captured.

**Method suggestions:**

When structure would help: "We're stuck diverging -- want to try SCAMPER to force new angles?" or "Before we commit, should we run a pre-mortem?"

**Pacing awareness:**

At natural breakpoints (roughly 20-30 minutes of dense work), Claude checks in: "Want to keep going or pause here?"

**Parking lot capture:**

Off-topic ideas get flagged: "This seems relevant to [other project], not this one -- should I add it to the parking lot?"

### Session End

Every session concludes with three elements:

1. **Exit summary** -- Crisp recap: current state, key decisions made, open questions, next steps

2. **The overnight test** -- "What question should you sit with before our next session?"

3. **Version creation** -- Claude generates the next version of the project document

## Inputs & Outputs

### Inputs

| Input | Required | Description |
|-------|----------|-------------|
| Problem or topic | Yes | What you want to brainstorm |
| Previous version file | For continuing sessions | The latest project document |
| Session preferences | Prompted at start | Energy mode, connected/clean-slate, etc. |

### Outputs

| Output | Description |
|--------|-------------|
| **Project documents** | Versioned files (project-name-v1.md, v2.md, etc.) with full session content |
| **Index file** | Changelog, decision log, and project trajectory per project |
| **Parking lot** | Cross-project idea capture in `_parking-lot.md` |
| **Exit summaries** | End-of-session recaps with overnight questions |

**File structure:**

```text
brainstorms/
  _parking-lot.md              # Cross-project idea capture
  project-name/
    _index.md                  # Changelog and decision log
    project-name-v1.md         # Version 1
    project-name-v2.md         # Version 2
    ...
```

## Best Practices

**Start with clear success criteria.** Early in any project, establish: "What does 'done' look like for this brainstorm?" and "How will we know we've succeeded?"

**Use version files, never overwrite.** Each session produces a new version. This creates a record of how thinking evolved and allows you to revisit earlier states.

**Let Claude push back.** The skill is designed to challenge weak reasoning. If you find yourself defending ideas, that's the system working -- the best ideas survive scrutiny.

**Log disagreements.** When you and Claude see things differently, both perspectives get captured. This often reveals important tensions worth exploring.

**Match energy to time.** Deep exploration mode for open-ended sessions; quick progress mode when you need decisions, not divergence.

**Request synthesis after 3+ sessions.** Claude will offer: "We've had [N] sessions on this. Want me to create a synthesis document that distills our current best thinking?"

**Use Quick Capture Mode when time is short.** For rapid idea capture: dump the raw idea, answer 2-3 clarifying questions, get a minimal v1 document marked for expansion later.

## Modes

### Session Energy

| Mode | Best For | Approach |
|------|----------|----------|
| **Deep exploration** | Long sessions, open-ended thinking, divergent work | Freely use divergent methods, allow tangents (park off-topic items), embrace ambiguity, end with synthesis not decisions |
| **Quick progress** | Short sessions, need decisions, move forward | Clear scope upfront, primarily convergent methods, time-boxed divergence (10 min max), decisions get logged, end with next actions |

### Context Awareness

| Mode | Best For | Behavior |
|------|----------|----------|
| **Connected** (default) | Building on existing work, ensuring consistency, leveraging past thinking | Cross-references other projects: "This relates to your thinking on X," "This might conflict with what you decided about Y" |
| **Clean-slate** | Genuinely new territory, avoiding anchoring, fresh perspectives | No references to other projects or prior work; useful when past approaches aren't working |

## Methods Catalog

The skill includes 25+ structured thinking methods organized by purpose:

### Divergent Methods (Generate New Ideas)

| Method | One-liner |
|--------|-----------|
| **SCAMPER** | Systematic prompts: Substitute, Combine, Adapt, Modify, Put to other uses, Eliminate, Reverse |
| **Random Stimulus** | Introduce unrelated word/image, force connections |
| **Forced Analogies** | "How would [X industry/person] solve this?" |
| **Mind Mapping** | Visual branching from central concept |
| **Worst Possible Idea** | Generate terrible ideas, then invert |
| **TRIZ Principles** | 40 inventive principles for contradiction resolution |

### Convergent Methods (Focus & Decide)

| Method | One-liner |
|--------|-----------|
| **Affinity Grouping** | Cluster similar ideas, name the clusters |
| **Dot Voting** | Allocate limited votes across options |
| **Weighted Scoring** | Score options against weighted criteria |
| **Elimination Rounds** | Progressive cuts with explicit criteria |
| **2x2 Matrix** | Plot options on two key dimensions |

### Problem-Framing Methods

| Method | One-liner |
|--------|-----------|
| **First Principles** | Strip to basics, rebuild from ground truth |
| **5 Whys** | Ask "why" repeatedly to find core issue |
| **Inversion** | "What guarantees failure?" then avoid it |
| **Problem Reframing** | Restate the problem 5 different ways |
| **Jobs-to-be-Done** | What job is the user hiring this to do? |

### Perspective Shift Methods

| Method | One-liner |
|--------|-----------|
| **Six Thinking Hats** | Rotate through facts, feelings, risks, benefits, creativity, process |
| **Steelman** | Build the strongest case for the opposing view |
| **Audience Reality Check** | Would [specific person] actually want this? |
| **Pre-mortem** | Assume it failed -- why? |
| **Assumption Surfacing** | What are we taking for granted? |

### Theological/Philosophical Methods

| Method | One-liner |
|--------|-----------|
| **Presuppositional Analysis** | What worldview assumptions underlie this idea? |
| **Telos Examination** | What is the ultimate end/purpose this serves? |
| **Stewardship Frame** | Am I being a faithful steward of what's entrusted to me? |

### Quick Selection Guide

- **"I have no ideas"** -- Random Stimulus, Worst Possible Idea
- **"I have too many ideas"** -- Affinity Grouping, Elimination Rounds
- **"I'm not sure what the real problem is"** -- 5 Whys, Problem Reframing
- **"This feels risky"** -- Pre-mortem, Inversion
- **"Am I missing something?"** -- Six Thinking Hats, Steelman
- **"Is this actually valuable?"** -- Jobs-to-be-Done, Audience Reality Check
- **"What are we assuming?"** -- First Principles, Assumption Surfacing, Presuppositional Analysis

## Idea Maturity Levels

Ideas move through six maturity stages:

| Level | Meaning |
|-------|---------|
| **Raw** | Just captured, unexamined |
| **Developing** | Being explored, has potential |
| **Refined** | Shaped, tested, ready for evaluation |
| **Ready** | Decision made, ready to execute |
| **Parked** | Not now, but worth keeping |
| **Eliminated** | Killed, with documented reasoning |

## Examples

### Example 1: SaaS Product Ideation

**Prompt:**
```text
I want to brainstorm a developer tool for API documentation. The current tools
feel either too enterprise-heavy or too basic. Help me find the opportunity.
```

**Session flow:**

1. Claude asks session-start questions; user selects: new project, deep exploration, connected mode
2. Claude identifies this as "Product/SaaS Ideation" and recommends Jobs-to-be-Done + Audience Reality Check
3. Together they explore the problem space, Claude pushing back on assumptions: "You're assuming developers write the docs -- is that true?"
4. Mid-session, Claude suggests SCAMPER to generate variations on the core concept
5. A decision crystallizes; Claude logs it with reasoning
6. Session ends with exit summary, overnight question, and v1 document

### Example 2: Continuing a Book Brainstorm

**Prompt:**
```text
Continuing our brainstorm on the nonfiction book. Here's v3. [uploads file]
I've been thinking about the overnight question and I think Chapter 4 needs to come first.
```

**Session flow:**

1. Claude acknowledges continuation, reads v3, asks about session energy (user chooses quick progress)
2. Claude notes: "This relates to what we discussed in Session 2 about narrative flow"
3. They work through the chapter reordering, Claude asking hard questions about the logic
4. Claude challenges the reasoning; user pushes back; both perspectives get logged
5. Decision is made and captured; v4 is generated

### Example 3: Quick Capture Mode

**Prompt:**
```text
Quick capture -- I'm about to go into a meeting but I just had an idea about
a newsletter format that combines book summaries with my own frameworks.
```

**Session flow:**

1. Claude enters quick capture mode
2. Asks only 2-3 clarifying questions
3. Creates minimal v1 document
4. Notes: "Quick capture -- expand in future session"
5. Gives user one overnight question to consider

## Troubleshooting

| Issue | Solution |
|-------|----------|
| **Claude isn't pushing back enough** | Explicitly ask: "Play devil's advocate here" or "What am I missing?" |
| **Session feels unfocused** | Switch to quick progress mode and define a clear scope: "What decision do we need to make today?" |
| **Ideas feel stale** | Request a divergent method: "Let's try Random Stimulus to break out of this rut" |
| **Lost track of what was decided** | Request an index file update or synthesis document |
| **Cross-project connections are distracting** | Switch to clean-slate mode for fresh perspective |
| **Session running too long** | Claude should check in at natural breakpoints; if not, request a pause and exit summary |
| **Continuing session but context seems off** | Ensure you're providing the latest version file, not an older one |

## Related Files

- **Source:** `brainstorm/SKILL.md`
- **Methods Reference:** `brainstorm/references/methods-detailed.md`
- **Quick Methods Guide:** `brainstorm/references/methods-quick.md`
- **Session Types:** `brainstorm/references/session-types.md`
- **Project Template:** `brainstorm/assets/templates/project-template.md`
- **Index Template:** `brainstorm/assets/templates/index-template.md`
