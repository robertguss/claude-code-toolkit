# Writing Skills

A pipeline for capturing and replicating a writer's authentic voice. These skills work together: first discover your voice DNA, then use it to generate drafts that sound like you.

📚 **[View Full Documentation](https://robertguss.github.io/claude-skills/skills/writing/)**

## The Workflow

```
┌─────────────────────────┐     ┌─────────────────────────┐
│  writing-dna-discovery  │ ──▶ │      ghost-writer       │
│                         │     │                         │
│  Capture voice patterns │     │  Generate first drafts  │
│  through interview and  │     │  at ~80% voice accuracy │
│  sample analysis        │     │  using your DNA doc     │
└─────────────────────────┘     └─────────────────────────┘
         ▲                                  │
         │                                  │
         └──────────────────────────────────┘
                  Refinement loop
```

## Skills

### writing-dna-discovery

Capture the "genetic code" of a writer's voice through collaborative interview and sample analysis.

**What It Does:**

- Analyzes writing samples for distinctive patterns
- Conducts collaborative interview to surface choices and preferences
- Documents voice dimensions with annotated examples
- Produces actionable Voice DNA Document for ghost-writer

**Voice Dimensions Captured:**

- **Sentence Rhythm** — Length variation, internal structure, emphasis placement
- **Punctuation Personality** — Em-dashes, semicolons, parentheses, comma density
- **Word Choice** — Vocabulary level, favorites, avoided words
- **Tone & Temperature** — Warm/cool, formal/casual, confident/hedging
- **Reader Relationship** — First person presence, direct address, authority stance

**Session Types:**
| Type | When to Use |
|------|-------------|
| Initial Discovery | First time capturing your voice |
| Sample Addition | Adding new writing samples to existing profile |
| Dimension Deep-Dive | Going deeper on a specific aspect of your voice |
| Refinement from Feedback | Ghost-writer keeps getting something wrong |
| Evolution Update | Your writing style has changed over time |
| New Register | Capturing a different mode (blog vs. fiction vs. technical) |

**Output:** Voice DNA Document — a structured profile containing patterns, anti-patterns, exemplar passages, and actionable guidance for the ghost-writer skill.

---

### ghost-writer

Produce first drafts that match a writer's authentic voice using their Voice DNA Document.

**What It Does:**

- Consumes Voice DNA Documents (requires writing-dna-discovery output)
- Generates 2 meaningfully different first drafts
- Provides 2-3 headline options per draft
- Assesses confidence based on profile readiness and freshness
- Documents decisions made and reasoning
- Suggests DNA refinements based on feedback

**Philosophy:** Collaborative partner, not order-taker. The ghost-writer evaluates task clarity, surfaces tensions proactively, offers honest feedback, and pushes back diplomatically when it sees problems.

**Draft Differences Might Include:**

- Structural approach (narrative vs. analytical)
- Opening strategy (direct hook vs. scene-setting)
- Tone variation (within documented range)
- Emphasis (different aspects of the topic highlighted)

**Requires:** A Voice DNA Document from writing-dna-discovery. Without one, the skill will direct you to run a discovery session first.

**Handles:** Blog posts, essays, newsletters, LinkedIn posts, and other prose formats.

---

## Readiness Levels

Your Voice DNA Document has a readiness level that affects ghost-writer accuracy:

| Level              | Accuracy | What It Means                                                             |
| ------------------ | -------- | ------------------------------------------------------------------------- |
| **Minimum Viable** | ~60-70%  | 3-5 strong patterns, clear tone, key anti-patterns                        |
| **Solid**          | ~75-85%  | Multiple dimensions developed, exemplar passages annotated, stress-tested |
| **Strong**         | ~85-90%  | Deep analysis, validated against output, refined from feedback            |

## Key Concepts

**80% Accuracy Goal**
The ghost-writer produces first drafts at ~80% accuracy. You add the remaining 20%—the creative spark, situational judgment, and final polish. These skills don't replace you; they give you a strong starting point.

**Living Documents**
Your Voice DNA Document grows richer over time. Initial sessions capture the foundation; return sessions deepen, refine, and adapt as your voice evolves.

**One Register Per Session**
Each discovery session focuses on a single mode: blog posts, fiction prose, technical writing, etc. Create separate DNA documents for different registers if your voice varies significantly across contexts.

**Anti-Patterns Are Critical**
What you _don't_ do is as important as what you do. The DNA document captures words, structures, and tones that would make readers think "that's not their writing"—including AI patterns to suppress.

## Getting Started

1. **Run writing-dna-discovery** with 3-5 writing samples that represent your voice
2. Complete the collaborative interview until you reach at least "Minimum Viable" readiness
3. **Run ghost-writer** with your Voice DNA Document and a writing task
4. Review the drafts, provide feedback, iterate
5. Use feedback to refine your DNA document over time
