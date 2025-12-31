# Claude Skills

A collection of custom skills that extend Claude's capabilities with specialized workflows, methods, and domain knowledge.

## What Are Skills?

Skills are modular packages that transform Claude from a general-purpose assistant into a specialized collaborator. Each skill contains instructions, reference documentation, and templates for specific domains.

## Installation

### Claude Code (CLI)

Reference skills directly in your project's `CLAUDE.md` or global `~/.claude/CLAUDE.md`:

```markdown
# CLAUDE.md

## Skills

When brainstorming, read and follow `/path/to/claude-skills/brainstorm/SKILL.md`.
```

### Claude.ai (Web/Mobile/Desktop)

1. Package the skill: `python build.py <skill-name>`
2. Open Claude.ai → Settings → Skills
3. Upload the `.skill` file from `dist/`

## Available Skills

### Standalone Skills

| Skill                     | Description                                                                                                     |
| ------------------------- | --------------------------------------------------------------------------------------------------------------- |
| [brainstorm](brainstorm/) | Collaborative multi-session brainstorming with versioned documents, 25+ thinking methods, and decision tracking |

### Non-Fiction Book Factory

A pipeline of skills for developing nonfiction books from idea to architecture. See [full documentation](non-fiction-book-factory/).

| Skill                   | Description                                                     |
| ----------------------- | --------------------------------------------------------------- |
| book-ideation           | Develop raw ideas into structured Book Concept Documents        |
| book-idea-validator     | Stress-test concepts against existing research (Go/Revise/Kill) |
| book-market-research    | Assess commercial viability for Amazon KDP                      |
| book-architect          | Design structural and emotional architecture for drafting       |
| book-research-assistant | Plan, orchestrate, and validate deep research before outlining  |

### Writing Skills

A pipeline for capturing and replicating a writer's authentic voice. See [full documentation](writing/).

| Skill                 | Description                                                              |
| --------------------- | ------------------------------------------------------------------------ |
| writing-dna-discovery | Capture voice patterns through collaborative interview and sample analysis |
| ghost-writer          | Produce first drafts at ~80% voice accuracy using Voice DNA Documents   |

### Ebook Factory

A pipeline of skills for creating ebooks — shorter, concentrated solutions optimized for speed-to-value. See [full documentation](ebook-factory/).

| Skill                    | Description                                                                        |
| ------------------------ | ---------------------------------------------------------------------------------- |
| ebook-discovery          | Surface ebook ideas from content, expertise, and archives (11 entry modes)         |
| ebook-concept-development | Develop ideas into structured concepts ready for architecture                      |

## License

Personal use. Modify freely.
