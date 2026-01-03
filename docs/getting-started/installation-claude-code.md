# Claude Code Setup

This guide covers installing and using skills with Claude Code (the CLI tool).

---

## Prerequisites

- **Node.js 18+** (required for Claude Code CLI)
- **Claude Code CLI**: Install via `npm install -g @anthropic-ai/claude-code` ([setup guide](https://docs.anthropic.com/en/docs/claude-code/getting-started))
- Git (for cloning the repository)
- Python 3.8+ (optional, for packaging skills)

---

## Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/robertguss/claude-skills.git
cd claude-skills
```

Note the full path to this directory—you'll need it for configuration.

### Step 2: Configure Skill References

Add skill references to your `CLAUDE.md` file. You have two options:

=== "Project-Level (Recommended)"

    Add to your project's `CLAUDE.md`:

    ```markdown
    # CLAUDE.md

    ## Skills

    When brainstorming, read and follow /path/to/claude-skills/brainstorm/SKILL.md.

    When working on book ideas, read and follow /path/to/claude-skills/non-fiction-book-factory/book-ideation/SKILL.md.
    ```

    This makes skills available only in that project.

=== "Global"

    Add to `~/.claude/CLAUDE.md`:

    ```markdown
    # CLAUDE.md

    ## Skills

    When brainstorming, read and follow /path/to/claude-skills/brainstorm/SKILL.md.
    ```

    This makes skills available in all your Claude Code sessions.

---

## Usage Patterns

### Basic Invocation

Simply describe what you want to do, and Claude will follow the skill:

```
Let's brainstorm some ideas for a new SaaS product.
```

Claude will:

1. Recognize this matches the brainstorm skill
2. Load the SKILL.md instructions
3. Follow the prescribed workflow (asking about new vs. continuing, session energy, mode selection, etc.)

### Explicit Skill Reference

You can also explicitly reference a skill:

```
Using the brainstorm skill, help me think through newsletter content ideas.
```

### Pipeline Workflows

For skills that work in sequence, progress through the pipeline:

```markdown
## Book Project Skills

When developing book ideas, read and follow /path/to/claude-skills/non-fiction-book-factory/book-ideation/SKILL.md.

When validating book concepts, read and follow /path/to/claude-skills/non-fiction-book-factory/book-idea-validator/SKILL.md.

When researching book market viability, read and follow /path/to/claude-skills/non-fiction-book-factory/book-market-research/SKILL.md.
```

---

## File Management

Skills create versioned documents in your project. Recommended structure:

```
your-project/
├── CLAUDE.md           # Skill references
├── brainstorms/        # Brainstorming projects
│   ├── _parking-lot.md
│   └── project-name/
│       ├── _index.md
│       └── project-name-v1.md
├── book-projects/      # Book development
│   └── my-book/
│       ├── concept-v1.md
│       └── ...
```

---

## Tips

### Keep Skills Updated

```bash
cd /path/to/claude-skills
git pull
```

### Use Absolute Paths

Always use absolute paths in your `CLAUDE.md` references to avoid path resolution issues:

```markdown
# Good
When brainstorming, read and follow /Users/you/claude-skills/brainstorm/SKILL.md.

# Avoid (may not resolve correctly)
When brainstorming, read and follow ../claude-skills/brainstorm/SKILL.md.
```

### Combine Multiple Skills

You can reference multiple skills in a single project:

```markdown
## Skills

When brainstorming, read and follow /path/to/claude-skills/brainstorm/SKILL.md.

When capturing my writing voice, read and follow /path/to/claude-skills/writing/writing-dna-discovery/SKILL.md.

When ghost writing content, read and follow /path/to/claude-skills/writing/ghost-writer/SKILL.md.
```

---

## Troubleshooting

### Skill Not Loading

- Verify the path is correct and absolute
- Check that the SKILL.md file exists at the specified location
- Ensure your `CLAUDE.md` is in the project root or `~/.claude/`

### References Not Found

Skills reference their own `references/` folder. These paths are relative to the skill, so they should work automatically. If you see errors about missing references, the skill installation may be incomplete.

---

## Next Steps

- [:octicons-arrow-right-24: Your First Skill Tutorial](your-first-skill.md) — Try the Brainstorm skill hands-on
- [:octicons-arrow-right-24: Browse Available Skills](../skills/index.md) — See all available skills
