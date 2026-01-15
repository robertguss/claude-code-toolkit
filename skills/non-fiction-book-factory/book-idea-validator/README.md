# idea-validator

Stress-test book concepts against existing research before committing to architecture.

## Purpose

This skill validates the **intellectual merit** of a book idea before investing significant time in structure and drafting. It surfaces weaknesses early—when they're cheap to fix or when killing the project saves months of wasted effort.

**Better to kill a weak idea now than to finish a weak book later.**

## When to Use

- You have a Book Concept Document ready for validation
- You want to verify your thesis is defensible
- You need to understand the competitive intellectual landscape
- You want honest assessment of your idea's strengths and weaknesses

## Pipeline Position

```
book-ideation → idea-validator → market-research → book-architect
```

**Inputs:** Book Concept Document from `book-ideation`  
**Outputs:** Validation Report (Go/Revise/Kill) to `market-research` and `book-architect`

## Core Philosophy

1. **Intellectual honesty over ego validation** — The goal is truth, not encouragement
2. **Two-layer research** — Claude does landscape scans; user runs deep research with Claude-provided prompts
3. **Collaborative approval** — Claude proposes, user approves, then proceed
4. **Brutal honesty** — If a claim is weak, say so. If the whole idea should be killed, say so.

## Documents Produced

### Core (Always)

- Master Claim List
- Landscape Scan Notes
- Deep Research Log
- Competitor/Comp Title Analysis
- Decision Log
- Validation Report

### Optional (Based on Book Type)

27 optional document types recommended based on book characteristics. See SKILL.md for full list.

## Validation Report Recommendation

Each validation concludes with one of three recommendations:

| Recommendation | Meaning                                            |
| -------------- | -------------------------------------------------- |
| **Go**         | Proceed to market-research and architecture        |
| **Revise**     | Return to book-ideation to address specific issues |
| **Kill**       | Abandon this concept (or park for later)           |

## Usage

### Claude.ai (Projects)

Add `SKILL.md` to your project's custom instructions or knowledge.

### Claude Code

Place the `idea-validator/` folder in your `.claude/skills/` directory.

## Related Skills

- `book-ideation` — Develops raw ideas into structured Book Concept Documents
- `market-research` — Validates commercial viability (downstream)
- `book-architect` — Designs book structure (downstream)

## License

MIT
