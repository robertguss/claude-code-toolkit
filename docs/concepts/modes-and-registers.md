# Modes & Registers

Different operating modes skills offer for different situations.

---

## Why Modes?

Not every session is the same. Sometimes you have two hours for deep exploration. Sometimes you have fifteen minutes and need quick progress. Skills adapt to these different situations through **modes**—configurable ways of operating.

---

## Common Mode Types

### Session Energy Modes

Many skills ask about session energy at the start:

| Mode | Best For | Behavior |
|------|----------|----------|
| **Deep exploration** | Long sessions, open-ended thinking, divergent work | Freely use methods, allow tangents, embrace ambiguity, end with synthesis |
| **Quick progress** | Short sessions, need decisions, move forward | Clear scope upfront, primarily convergent methods, time-boxed, end with next actions |

**Example prompt:**
```text
Claude: Deep exploration today or quick progress?
```

### Context Awareness Modes

Some skills offer different levels of context awareness:

| Mode | Best For | Behavior |
|------|----------|----------|
| **Connected** | Building on existing work, ensuring consistency | Cross-references other projects: "This relates to your thinking on X" |
| **Clean-slate** | Genuinely new territory, avoiding anchoring bias | No references to other projects; fresh perspective |

**When to use clean-slate:**
- Past approaches aren't working
- You want to avoid confirmation bias
- The topic is genuinely new territory

### Session Types

Some skills have distinct session types:

| Type | Purpose | Example |
|------|---------|---------|
| **Quick Assessment** | Fast, single-session work | Market research qualitative scan |
| **Deep Dive** | Thorough, multi-session work | Market research with quantitative data |
| **Quick Capture** | Rapid idea capture when time is short | Brainstorm idea dump in 5 minutes |

---

## Author Intent (Market Research)

The book-market-research skill interprets viability scores based on author intent:

| Intent | Description | Score Interpretation |
|--------|-------------|---------------------|
| **Income** | Book must generate revenue | Score is decisive |
| **Authority** | Book is a credential | Moderate score acceptable |
| **Passion/Legacy** | "This book needs to exist" | Low score = proceed with eyes open |
| **Lead Generation** | Funnel for services | Platform fit matters more |
| **Audience Service** | Serving existing followers | Platform strength > market size |

The same viability score means different things depending on why you're writing.

---

## Research Modes

Research-oriented skills often have phases:

| Phase | Focus | Output |
|-------|-------|--------|
| **Planning** | Generate prompts, identify gaps | Research prompts |
| **Validation** | Review outputs, render verdicts | Quality assessments |
| **Synthesis** | Consolidate findings | Summary documents |

---

## Operating Registers

Beyond explicit modes, skills adapt their **register**—how they communicate and operate:

### Collaboration Register

How Claude engages with your ideas:

| Register | Behavior |
|----------|----------|
| **Supportive** | Develops and builds on your ideas |
| **Challenging** | Pushes back, asks hard questions, plays devil's advocate |
| **Neutral** | Presents options without strong opinions |

Most skills default to **challenging** because that's where value lives—but you can request a different register.

### Depth Register

How thoroughly Claude explores:

| Register | Behavior |
|----------|----------|
| **Surface** | Quick overview, main points only |
| **Standard** | Balanced exploration |
| **Deep** | Thorough analysis, edge cases, nuances |

### Formality Register

How structured the output is:

| Register | Behavior |
|----------|----------|
| **Conversational** | Informal, flowing discussion |
| **Structured** | Clear sections, tables, bullet points |
| **Formal** | Document-ready, professional tone |

---

## Selecting Modes

### At Session Start

Most mode selection happens at session start:

```text
Claude: A few questions before we begin:
        1. New project or continuing?
        2. Deep exploration or quick progress today?
        3. Connected mode or clean-slate?
```

### Mid-Session Adjustments

You can adjust modes during a session:

```text
You: Let's switch to quick progress mode—I need to wrap up soon.

Claude: Got it. Switching to quick progress. Let me summarize where we are
        and identify the key decision we should make before you go.
```

### When Mode Isn't Specified

If you don't specify a mode, skills typically:

1. Use sensible defaults (often connected mode, moderate depth)
2. Adapt based on context (long conversation = deep, short = quick)
3. Ask if the choice significantly impacts the session

---

## Mode Impact on Output

The same skill can produce very different outputs based on mode:

### Brainstorm: Deep Exploration

```text
Session: 45 minutes
Output: 3 pages of explored territory
Methods: SCAMPER, Random Stimulus, First Principles
Decisions: None yet—exploring
Next: "Sit with this before deciding"
```

### Brainstorm: Quick Progress

```text
Session: 15 minutes
Output: 1 page with clear decision
Methods: Elimination Rounds
Decisions: 2 logged with reasoning
Next: Specific action items
```

---

## Best Practices

### Do

- **Be honest about your time and energy** — The right mode makes sessions more effective
- **Experiment with modes** — Try clean-slate if you're stuck; try deep if you're rushing
- **Request register changes** — "Push back more" or "Be more supportive" are valid requests

### Don't

- **Default to deep always** — Quick progress mode is valuable, not inferior
- **Force a mode that doesn't fit** — If you have 10 minutes, don't pretend you have an hour
- **Ignore mode recommendations** — Skills suggest modes for reasons

---

## Related Concepts

- [Session Continuity](session-continuity.md) — How work persists across time
- [Pipelines](pipelines.md) — How skills chain together
- [Handoffs](handoffs.md) — Documents that pass between skills
