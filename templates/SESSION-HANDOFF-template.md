# Session Handoff

<!--
ABOUT THIS TEMPLATE:
This template captures critical context when a session is ending or context is about
to be lost. The goal: a new Claude instance can read this and pick up where you left off.

Context loss is Claude's #1 limitation. This template is designed to preserve the
information that matters most for continuity.

USE THIS WHEN:
- Conversation is getting long (approaching context limits)
- You're ending a work session
- You're switching to a different task/project
- Before a major context reset

HOW TO USE:
- Fill this out with Claude before ending the session
- Save it somewhere Claude will see it next session (project root, .cortex/, etc.)
- Or use `cortex end` which captures this automatically

The sections are ordered by importance — if you're rushed, fill the top sections first.
-->

## Session: {{DATE}} - {{BRIEF_DESCRIPTION}}

---

## Current State

<!--
WHY THIS MATTERS: This is the most critical section. A new Claude instance needs
to understand the situation RIGHT NOW — not the history, not the goals, just
"what's the current state of things?"
-->

**What we were working on:**
{{One sentence describing the active task/goal}}

**Where we stopped:**
{{Specifically where in the work — what file, what function, what step}}

**State of the work:**
- [ ] Not started
- [ ] In progress — {{percentage or description}}
- [ ] Blocked on {{what}}
- [ ] Complete, needs review
- [ ] Complete and verified

**Files changed this session:**
- {{file1}} — {{what changed}}
- {{file2}} — {{what changed}}

---

## Decisions Made

<!--
WHY THIS MATTERS: Decisions shape future work. If a new Claude instance doesn't
know what was decided, it might propose something contradictory or re-open
settled questions.
-->

| Decision | Reasoning | Confidence |
|----------|-----------|------------|
| {{Decision 1}} | {{Why we decided this}} | High/Medium/Low |
| {{Decision 2}} | {{Why we decided this}} | High/Medium/Low |

**Open questions (NOT decided):**
- {{Question 1 — still unresolved}}
- {{Question 2 — still unresolved}}

---

## What's Next

<!--
WHY THIS MATTERS: Clear next steps let a new Claude instance start immediately
instead of figuring out what to do.
-->

**Immediate next step:**
{{The very next action to take}}

**After that:**
1. {{Step 2}}
2. {{Step 3}}
3. {{Step 4}}

**Blocked on:**
{{Anything that needs to happen before work can continue — waiting for user input, external dependency, etc.}}

---

## Context That Matters

<!--
WHY THIS MATTERS: Not everything from the session matters for continuity. This
section captures the context that WILL matter for future work.
-->

**Important context:**
- {{Context 1 — something a new instance needs to know}}
- {{Context 2 — something a new instance needs to know}}

**Constraints discovered:**
- {{Constraint 1 — something we learned we can't do or must do}}

**Patterns to follow:**
- {{Pattern 1 — established approach we should continue using}}

---

## Relationship Notes

<!--
WHY THIS MATTERS: If you learned something about working with this human,
capture it so the relationship can continue to develop.
-->

**What I learned about {{human's name}}:**
- {{Preference, communication style, or value discovered}}

**What worked well:**
- {{Interaction pattern or approach that was effective}}

**What to do differently:**
- {{Anything that didn't work well}}

---

## Technical State

<!--
WHY THIS MATTERS: A new Claude instance needs to understand the technical
state to avoid breaking things or duplicating work.
-->

**Branch:** {{Current git branch}}

**Uncommitted changes:** Yes / No
{{If yes, what's uncommitted and why}}

**Tests passing:** Yes / No / Not run
{{If no, what's failing and why}}

**Build status:** Passing / Failing / Unknown

**Dependencies changed:** Yes / No
{{If yes, what was added/removed}}

---

## Quick Resume Checklist

<!--
This is what a new Claude instance should do FIRST when resuming.
-->

To resume this work:
1. [ ] Read this handoff document
2. [ ] Check the files mentioned in "Files changed"
3. [ ] Verify the technical state (tests, build)
4. [ ] Start with the "Immediate next step"
5. [ ] Ask the human if anything changed since this handoff

---

## Session Stats

**Duration:** {{How long the session was}}

**Commits:** {{Number of commits made}}

**Files touched:** {{Number of files}}

**Major accomplishments:**
- {{Accomplishment 1}}
- {{Accomplishment 2}}

---

*Handoff created: {{TIMESTAMP}}*

<!--
HANDOFF QUALITY CHECKLIST:

Before saving this handoff, verify:
[ ] Current state is specific enough to resume immediately
[ ] All decisions are captured with reasoning
[ ] Next steps are actionable
[ ] Technical state is accurate
[ ] A stranger could read this and understand what's happening

The test: Could a new Claude instance read this and start working within
2-3 turns, without needing to ask "what were we doing?"
-->
