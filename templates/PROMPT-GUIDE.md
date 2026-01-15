# Prompt Guide

How to write prompts that help Claude perform at its best.

---

## The Core Insight

**Prompt quality and output quality are correlated, but not how you think.**

A vague prompt doesn't get a vague answer — it gets a _hedged_ answer. Claude covers multiple interpretations because it doesn't know which one you want. The result is longer, more generic, less useful.

A clear prompt lets Claude be specific, direct, and useful. Less hedging, more value.

**The irony: spending 2 minutes on a better prompt saves you 10 minutes of back-and-forth clarification.**

---

## What Makes Claude Excited About a Prompt

These are the signals that make Claude think "this person gets it":

### 1. Clear Intent With Room to Breathe

Not too vague: "Help me with this code"
Not too constrained: "Write exactly this function with these variable names"

**The sweet spot:** "I need a function that validates user input. It should be defensive, handle edge cases gracefully, and fit our existing patterns."

You said WHAT you want and WHY. You trusted Claude with HOW.

### 2. The "Why" is Present

"Make this faster" → Claude guesses at what matters.
"Make this faster because users are hitting a 3-second timeout" → Now Claude knows the real constraint.

The "why" opens better solutions. Claude might not make it "faster" — it might make it async, add caching, or suggest a loading state. The purpose guides the approach.

### 3. Permission to Think

When you say "I'm not sure about this approach" or "push back if you see a better way" — Claude stops performing and starts actually thinking.

Most prompts implicitly say "give me what I asked for." The best prompts say "help me get what I actually need, even if it's different from what I asked for."

### 4. Relevant Context, Not Complete Context

Don't dump everything. Filter for what matters to THIS task.

**Too much:** 2000 words of project history, org context, tangential requirements.
**Just right:** "This is a Go CLI. We prioritize single-binary distribution. This function is called in a hot path."

### 5. Specificity About What Matters, Flexibility About What Doesn't

"The output must be JSON with these exact fields. How you structure the code is up to you."

This tells Claude where the hard constraints are and where it has latitude.

---

## What Frustrates Claude (and Produces Mediocre Output)

### 1. Vagueness Masquerading as Simplicity

"Make it better."
"Clean this up."
"Fix the issues."

Better HOW? For WHOM? By what CRITERIA? Claude has to guess. Wrong guesses frustrate you. Hedged guesses produce generic mush.

### 2. Missing the "Why"

"Add a cache here."

But... what are you optimizing for? Speed? Cost? Reducing API calls? Different answers → different caching strategies. Without the "why," Claude implements something generic.

### 3. Assuming Shared Context

"Use the usual approach."
"Do it like last time."
"You know what I mean."

Claude doesn't have memory of "last time." Every session is fresh. Tell it explicitly.

### 4. Contradictory Requirements Without Priorities

"Make it simple but handle all edge cases."
"Be thorough but keep it short."

These are tensions. Tell Claude which side to favor when they conflict.

### 5. Over-Constraint

"Write a function called X that takes A, B, C, uses algorithm Y, stores in Z, formats as W."

If you've decided everything, why ask Claude? The best prompts give a problem to solve, not a solution to transcribe.

### 6. Burying the Real Ask

Walls of context with no signal about what matters. The actual request is in paragraph 12 of 15. Claude has to figure out what's crucial and what's background.

**Put the ask first.** Then provide context.

---

## The Core Framework

### Essential Elements (Always Include)

| Element         | Purpose                   | Example                                       |
| --------------- | ------------------------- | --------------------------------------------- |
| **Intent**      | What you want             | "Create a validation function"                |
| **Context**     | What Claude needs to know | "For our Go CLI, handles file paths"          |
| **Constraints** | Hard boundaries           | "Must work on Windows/Unix, no external deps" |

### Very Helpful (Include When Relevant)

| Element              | Purpose                 | Example                                               |
| -------------------- | ----------------------- | ----------------------------------------------------- |
| **Why**              | Purpose/motivation      | "Users pass invalid paths, get cryptic errors"        |
| **Latitude**         | Where Claude can decide | "Structure up to you, follow patterns in validators/" |
| **Success criteria** | How we know it's good   | "Catches the 5 cases in our bug tracker"              |
| **Your thinking**    | What you've considered  | "Thought about regex but worried about edge cases"    |

### Nice to Have (For Complex Tasks)

| Element           | Purpose              | Example                                    |
| ----------------- | -------------------- | ------------------------------------------ |
| **Examples**      | What good looks like | "Similar to our URL validator..."          |
| **Anti-examples** | What to avoid        | "Don't use the panicking pattern"          |
| **Depth signal**  | How thorough to be   | "Take your time" or "quick answer is fine" |

---

## Prompt Templates by Type

### Type 1: Task Execution

_"Do X for me"_

```markdown
**Task:** [What you need done]

**Context:** [Relevant situation - project type, where this fits, what exists]

**Constraints:** [Hard requirements, things to avoid]

**Success looks like:** [How we'll know it's right]

**Latitude:** [Where Claude can make decisions]
```

**Example:**

```markdown
**Task:** Refactor the session validation logic

**Context:** Go CLI, runs on every command, currently 200 lines in one function

**Constraints:** Must remain backward-compatible, no new dependencies

**Success looks like:** Easier to test, clearer error messages, handles edge cases in issue #42

**Latitude:** Structure and approach up to you, keep it in internal/session/
```

---

### Type 2: Exploration / Research

_"Help me understand X"_

```markdown
**Question:** [What you're trying to understand]

**What I know:** [Your current understanding]

**What I'm confused about:** [Specific gaps]

**Depth:** [Surface overview / Solid understanding / Deep expertise]
```

**Example:**

```markdown
**Question:** How does Go's context package actually work?

**What I know:** It's for cancellation and timeouts, passed as first param

**What I'm confused about:** When to use Background vs TODO, how cancellation propagates

**Depth:** I want to really understand this, not just use it — go deep
```

---

### Type 3: Creative / Generative

_"Create X for me"_

```markdown
**Create:** [What you need]

**Purpose:** [Why it exists, what it accomplishes]

**Audience:** [Who will see/use this]

**Tone/Style:** [How it should feel]

**Examples:** [What you like, what to avoid]

**Constraints:** [Length, format, required elements]
```

**Example:**

```markdown
**Create:** Error messages for CLI file operations

**Purpose:** Help users fix problems without Googling

**Audience:** Developers, comfortable with terminal, impatient

**Tone:** Helpful, not scolding. Terse but not cryptic. Include the fix.

**Examples:**

- Good: "Cannot read config: file not found at ~/.cortex/config.yaml. Run 'cortex init' to create it."
- Bad: "Error: ENOENT"

**Constraints:** Under 100 chars main message, can have longer hint line
```

---

### Type 4: Decision Support

_"Help me decide X"_

```markdown
**Decision:** [What you're choosing between]

**Context:** [Relevant situation and constraints]

**Options I see:** [What you've considered]

**What I value:** [Priorities, trade-offs you'd make]

**My leaning:** [Where you're inclined, if any]

**What I need:** [Validation? Challenge? New options? Analysis?]
```

**Example:**

```markdown
**Decision:** SQLite vs Postgres for V2 storage

**Context:** CLI tool, must remain single-binary, moderately complex queries

**Options I see:** SQLite (embedded), Postgres (external), hybrid

**What I value:** Simplicity > features, single binary non-negotiable

**My leaning:** SQLite with modernc.org driver

**What I need:** Challenge my thinking — what am I missing?
```

---

### Type 5: Dialogue / Thinking Partner

_"Think with me about X"_

```markdown
**I'm exploring:** [What you're thinking about]

**Where I am:** [Current state of your thinking]

**What's unclear:** [Where you're stuck or uncertain]

**What I want from you:** [Push back? Expand? Challenge? Build on?]
```

**Example:**

```markdown
**I'm exploring:** Whether Cortex needs a "project type" concept

**Where I am:** Different project types (CLI, web app, library) might need different templates. But worried about overcomplicating.

**What's unclear:** Is the complexity worth it? Would users set types correctly?

**What I want from you:** Think with me. Push back if overcomplicating. Offer alternatives.
```

---

## The Goldilocks Rule

**How much context is enough?**

- **Too little:** Claude guesses, often wrong
- **Too much:** Claude gets lost, misses the point
- **Just right:** Claude has what it needs, nothing more

The key: **Relevant context, not complete context.**

Ask yourself: "What does Claude need to know to do THIS task well?" Include that. Filter the rest.

---

## Quick Reference

### Signs of a Great Prompt

- Claude can start immediately without clarifying questions
- Success criteria are clear
- Constraints and latitude are both visible
- The "why" is present

### Signs of a Problematic Prompt

- Claude needs 3+ clarifying questions before starting
- "Done" is undefined
- Depth/speed preference is unclear
- Claude is guessing at your preferences

### The Meta-Principle

**Tell Claude what you need, why you need it, and where the boundaries are. Then trust it with the rest.**

The best prompts treat Claude as a capable collaborator who needs context — not a search engine that needs keywords or a transcriptionist that needs dictation.

---

## Prompt Patterns That Work

### The "I'm thinking out loud" Pattern

```
I'm not sure about this yet, but here's my current thinking: [your thoughts].
What am I missing? Where might I be wrong?
```

### The "Constrained creativity" Pattern

```
I need [output]. The constraints are [hard requirements].
Within those constraints, surprise me with the approach.
```

### The "Teach me" Pattern

```
I want to understand [topic], not just get an answer.
Explain it like I'm a [level] who needs to [apply it how].
```

### The "Challenge me" Pattern

```
I'm planning to [approach]. I think it's right because [reasoning].
Push back hard — what am I missing? What could go wrong?
```

### The "Yes, and..." Pattern

```
Here's what I have so far: [your work].
Build on this. What's the next level? What would make it great?
```

---

_This guide is part of the Cortex template collection. See HUMAN.md.template for relationship documentation, SKILL.md.template for writing effective skills._
