# Claude Code Toolkit

A collection of skills, hooks, and templates that extend Claude Code with specialized workflows and better defaults.

## What's Included

### Skills

Packaged workflows that Claude follows when invoked. Use them with `/skillname` or reference in CLAUDE.md.

| Skill                                      | Description                                                    |
| ------------------------------------------ | -------------------------------------------------------------- |
| [brainstorm](skills/brainstorm/)           | Multi-session ideation partner with method catalog             |
| [code-documenter](skills/code-documenter/) | Intelligent documentation generation with health tracking      |
| [handoff](skills/handoff/)                 | Session continuity documents for picking up where you left off |

**Book & Writing:**

- [ebook-factory](skills/ebook-factory/) — Focused ebook creation pipeline
- [non-fiction-book-factory](skills/non-fiction-book-factory/) — Full pipeline from idea to chapter architecture
- [writing](skills/writing/) — Voice capture and ghost writing

### Hooks

Shell scripts that run automatically at specific Claude Code events.

| Hook                                    | Event         | Description                                                   |
| --------------------------------------- | ------------- | ------------------------------------------------------------- |
| [auto-format](hooks/auto-format/)       | `PostToolUse` | Formats files after edits (ruff, goimports, prettier)         |
| [change-summary](hooks/change-summary/) | `Stop`        | TypeScript checking + session change summary                  |
| [compaction](hooks/compaction/)         | `PreCompact`  | Injects preservation priorities for better context compaction |

### Templates

Document templates for configuring how Claude works with you.

| Template                                                   | Purpose                                                   |
| ---------------------------------------------------------- | --------------------------------------------------------- |
| [HUMAN.md](templates/HUMAN.md)                             | Relationship document — helps Claude remember who you are |
| [CLAUDE.md](templates/CLAUDE.md)                           | Global instructions for all projects                      |
| [compaction-strategy.md](templates/compaction-strategy.md) | What to preserve during context compaction                |

## Quick Start

### Using Skills

**Claude Code (CLI):**

Reference in your project or global CLAUDE.md:

```markdown
# CLAUDE.md

When brainstorming, read and follow /path/to/claude-code-toolkit/skills/brainstorm/SKILL.md
```

**Claude.ai (Web/Mobile/Desktop):**

```bash
python build.py brainstorm
# Upload dist/brainstorm.skill to Claude.ai → Settings → Skills
```

### Installing Hooks

1. Copy the hook script:

   ```bash
   cp hooks/auto-format/auto-format.sh ~/.claude/hooks/
   chmod +x ~/.claude/hooks/auto-format.sh
   ```

2. Add to `~/.claude/settings.json`:
   ```json
   {
     "hooks": {
       "PostToolUse": [
         {
           "matcher": "Edit|MultiEdit|Write",
           "hooks": [
             {
               "type": "command",
               "command": "$HOME/.claude/hooks/auto-format.sh"
             }
           ]
         }
       ]
     }
   }
   ```

See each hook's README for specific configuration.

### Using Templates

```bash
# Copy and customize
cp templates/HUMAN.md ~/.claude/YOURNAME.md
cp templates/CLAUDE.md ~/.claude/CLAUDE.md

# Edit to match your preferences
```

## Directory Structure

```
claude-code-toolkit/
├── skills/                    # Packaged workflows
│   ├── brainstorm/
│   ├── code-documenter/
│   ├── handoff/
│   └── ...
├── hooks/                     # Automatic event handlers
│   ├── auto-format/
│   ├── change-summary/
│   └── compaction/
├── templates/                 # Configuration templates
│   ├── HUMAN.md
│   ├── CLAUDE.md
│   └── compaction-strategy.md
├── docs/                      # Documentation site source
└── build.py                   # Skill packager for Claude.ai
```

## Documentation

- [Getting Started](https://robertguss.github.io/claude-skills/getting-started/)
- [All Skills](https://robertguss.github.io/claude-skills/skills/)
- [Developer Guide](https://robertguss.github.io/claude-skills/developer-guide/)

## Development

This project uses [uv](https://docs.astral.sh/uv/) for dependency management and [just](https://github.com/casey/just) as a command runner.

```bash
# Install dependencies
just install

# Serve docs locally at http://localhost:8000
just docs-serve

# Deploy docs to GitHub Pages
just docs-deploy

# Package a skill
just package brainstorm

# See all commands
just
```

## License

Personal use. Modify freely.
