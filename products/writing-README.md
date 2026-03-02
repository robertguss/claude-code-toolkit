# Writing Skills Bundle

Two skills for writers who want Claude to match their authentic voice and
produce first drafts they're proud of.

## What's Included

| Skill                     | Description                                                                                                                                                                                                      |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **writing-dna-discovery** | Capture your writing voice through collaborative interview and sample analysis. Produces a Voice DNA Document that tells Claude exactly how you write.                                                           |
| **ghost-writer**          | Generate first drafts at ~80% voice accuracy using your Voice DNA Document. Produces 2 meaningfully different draft options per request, each with headlines, confidence scores, and DNA refinement suggestions. |

## Installation

### Claude Code (CLI)

1. Copy the `ghost-writer/` and `writing-dna-discovery/` folders into your
   Claude skills directory.
2. Reference them in your `CLAUDE.md` or `~/.claude/CLAUDE.md`.

### Claude.ai (Web/Mobile/Desktop)

1. Go to **Settings → Skills**.
2. Upload the `writing.zip` file.
3. Both skills install at once.

## How the Skills Work Together

Run `writing-dna-discovery` first to create your Voice DNA Document, then use
`ghost-writer` to produce drafts that sound like you.

**Step 1 — Discover your voice:**

Trigger with phrases like: "Help me discover my writing voice", "Let's create my
writing DNA", "I want to document how I write"

The skill conducts a collaborative interview, analyzes writing samples you
provide, and produces a Voice DNA Document — a detailed profile of your
patterns, anti-patterns, sentence rhythms, and characteristic moves.

**Step 2 — Write in your voice:**

Trigger with phrases like: "Write a draft of this blog post for me",
"Ghost-write this essay", "Draft this newsletter using my voice DNA"

Provide your Voice DNA Document and the topic/brief. The ghost-writer skill
produces two meaningfully different drafts with:

- Full draft with headline options
- Confidence assessment (how well it captured your voice)
- Decision notes explaining the choices made
- Suggestions for refining your DNA Document

**Supported formats:** Blog posts, essays, newsletters, LinkedIn posts, and
more.
