# Your First Skill

Let's use the Brainstorm skill to see how skills work in practice. This tutorial takes about 10 minutes.

---

## What You'll Experience

The Brainstorm skill demonstrates key skill concepts:

- **Structured workflow** — Guided session start, middle, and end
- **Collaborative partnership** — Claude pushes back and asks hard questions
- **Versioned documents** — Your ideas are captured and organized
- **Session continuity** — Pick up where you left off days or weeks later

---

## Before You Start

Make sure you have:

- Skills installed ([Claude Code](installation-claude-code.md) or [Claude.ai](installation-claude-ai.md))
- A topic you'd like to brainstorm (or use our example)

---

## Step 1: Start a Session

Begin by telling Claude you want to brainstorm:

```
Let's brainstorm ideas for a productivity app for remote workers.
```

Claude will recognize this matches the Brainstorm skill and begin the structured workflow.

---

## Step 2: Answer the Setup Questions

Claude will ask several questions to configure the session:

### New or Continuing?

```
Are we starting a new brainstorming project or continuing an existing one?
```

Answer: **New** (for this tutorial)

### Session Energy

```
Deep exploration today or quick progress?
```

Choose based on your available time:

- **Deep exploration** — More questions, more methods, thorough analysis
- **Quick progress** — Focused, efficient, fewer tangents

### Mode Selection

```
Connected mode or clean-slate mode?
```

- **Connected mode** — Claude surfaces connections to your other work
- **Clean-slate mode** — Fresh thinking without prior context

For this tutorial, either works.

### Context Confirmation

Claude will confirm the brainstorming context:

```
It sounds like you're wanting to brainstorm a new software product. Does that sound right?
```

Confirm or clarify as needed.

---

## Step 3: Brainstorm

Now the real work begins. Notice how Claude:

**Asks probing questions:**
```
"Who specifically is the target user? A freelancer working from coffee shops
or a corporate employee in a home office?"
```

**Suggests frameworks when helpful:**
```
"We're generating lots of ideas—want to try affinity grouping to organize them?"
```

**Pushes back on weak reasoning:**
```
"I'm not convinced that feature solves the core problem. Here's why..."
```

**Marks decision points:**
```
"This feels like a decision point. Should we log: 'Target user is freelancers
with variable schedules'?"
```

---

## Step 4: End the Session

When you're ready to wrap up, say:

```
Let's wrap up for today.
```

Claude will provide:

### Exit Summary

A crisp recap of:

- Current state of the project
- Key decisions made (with reasoning)
- Open questions remaining
- Suggested next steps

### The Overnight Test

```
"What question should you sit with before our next session?"
```

A thought-provoking question to percolate between sessions.

### Version Document

Claude creates a versioned document (v1) capturing everything from the session:

```markdown
# Productivity App - v1

## Quick Context
Brainstorming a productivity app for remote freelancers...

## Session Log
- Date: 2024-01-15
- Duration: 45 min
- Energy: Deep exploration
- Mode: Clean-slate
- Methods used: Free association, SCAMPER

## Current Thinking
[The substance of where things stand]

## Ideas Inventory
### Developing
- Flexible time blocking that adapts to energy levels
- Integration with freelance platforms for project-aware scheduling

### Raw
- AI-powered focus mode
- Social accountability features

## Decisions Made
1. Target user is freelancers with variable schedules
   - Reasoning: Corporate remote workers already have Teams/Slack...

## Open Questions
- How to handle timezone complexity?
- Native app vs. web-first?

## Next Steps
1. Research existing solutions for freelancers
2. Interview 3-5 freelancers about pain points
```

---

## Step 5: Continue Later

Days or weeks later, return and say:

```
Let's continue brainstorming the productivity app.
```

Claude will ask for the latest version file. Provide it, and the session picks up exactly where you left off—with full context of previous decisions, open questions, and ideas.

---

## What You Learned

In this tutorial, you experienced:

| Skill Feature | What You Saw |
|---------------|--------------|
| Structured workflow | Setup questions, checkpoints, exit summary |
| Collaborative partnership | Probing questions, pushback, suggestions |
| Versioned documents | v1 document capturing the session |
| Session continuity | Clear handoff for future sessions |
| Method integration | Framework suggestions when appropriate |

---

## Next Steps

Now that you've experienced a skill in action:

- [:octicons-arrow-right-24: Explore the Brainstorm skill](../skills/brainstorm/index.md) — Full documentation
- [:octicons-arrow-right-24: Browse all skills](../skills/index.md) — Find skills for your needs
- [:octicons-arrow-right-24: Learn about pipelines](../concepts/pipelines.md) — Skills that work together
