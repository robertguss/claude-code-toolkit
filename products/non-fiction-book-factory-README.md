# Non-Fiction Book Factory

A complete end-to-end system for writing nonfiction books — from raw idea to
chapter-ready outlines. Six skills that work together as a pipeline.

## What's Included

| Skill                       | Description                                                                                                                                                   |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **book-ideation**           | Transform raw ideas into structured book concepts. Produces a Book Concept Document with thesis, promise, reader profile, and transformation arc.             |
| **book-idea-validator**     | Stress-test your concept against existing research. Produces a Validation Report assessing whether your thesis is defensible and your idea is differentiated. |
| **book-market-research**    | Assess commercial viability for Amazon KDP self-publishing. Produces a Market Research Report with viability scorecard and Go/No-Go recommendation.           |
| **book-architect**          | Design the structural and emotional architecture of your book. Produces a Master Architecture Document with chapter outlines and reader journey map.          |
| **chapter-architect**       | Plan a single chapter at beat-level granularity. Produces a Chapter Outline Document ready for drafting.                                                      |
| **book-research-assistant** | Plan, orchestrate, and validate deep research. Generates research prompts, validates research quality, and synthesizes findings before you draft.             |

## Installation

### Claude Code (CLI)

1. Copy all skill folders (`book-ideation/`, `book-idea-validator/`, etc.) into
   your Claude skills directory.
2. Reference them in your `CLAUDE.md` or `~/.claude/CLAUDE.md`.

### Claude.ai (Web/Mobile/Desktop)

1. Go to **Settings → Skills**.
2. Upload the `non-fiction-book-factory.zip` file.
3. All six skills install at once and activate based on your request context.

## How the Skills Work Together

These skills form a pipeline. Run them in order for best results:

```
book-ideation
    → book-idea-validator  (optional but recommended)
    → book-market-research (optional but recommended)
    → book-architect
    → book-research-assistant
    → chapter-architect (run once per chapter)
```

Each skill produces a document that feeds into the next:

1. **book-ideation** → Book Concept Document
2. **book-idea-validator** → Validation Report (uses Book Concept Document)
3. **book-market-research** → Market Research Report (uses Book Concept
   Document)
4. **book-architect** → Master Architecture Document + Research Gaps Document
5. **book-research-assistant** → Research synthesis (uses Architecture
   Documents)
6. **chapter-architect** → Chapter Outline Document (uses Architecture Document,
   one chapter at a time)

You can start at any point in the pipeline if you already have the upstream
documents.
