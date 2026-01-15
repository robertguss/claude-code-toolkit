# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains custom Claude skills—modular packages that extend Claude's capabilities with specialized workflows and domain knowledge. Skills are used with both Claude Code (CLI) and Claude.ai (web/mobile/desktop).

## Build Commands

```bash
# Package a single skill for Claude.ai upload
python build.py <skill-name>

# Package all skills
python build.py --all

# List available skills with validation status
python build.py --list
```

Output: `.skill` files in `dist/` (ZIP archives with skill contents)

## Architecture

### Skill Structure

Each skill is a top-level folder containing:

```
<skill-name>/
├── SKILL.md              # Required: instructions + YAML frontmatter
├── references/           # Optional: documentation loaded on-demand
└── assets/               # Optional: templates, examples
```

### SKILL.md Requirements

Must start with YAML frontmatter:

- `name` (required): skill identifier
- `description` (required, min 20 chars): determines when the skill activates

### Build System

`build.py` validates skills and packages them as ZIP archives:

- Validates YAML frontmatter presence and required fields
- Excludes hidden files, `.DS_Store`, `__pycache__`
- Creates `<skill-name>.skill` in `dist/`

Requires: `pyyaml` (for frontmatter parsing)

### Usage Modes

**Claude Code**: Reference skills directly via filesystem paths in project `CLAUDE.md` or global `~/.claude/CLAUDE.md`

**Claude.ai**: Upload packaged `.skill` files via Settings → Skills

## Templates

The `templates/` directory contains document templates and guides for configuring Claude Code:

| Document                    | Purpose                                                        |
| --------------------------- | -------------------------------------------------------------- |
| CLAUDE-MD-template.md       | Project or global instructions for Claude                      |
| HUMAN-MD-template.md        | Relationship document — helps Claude know who you are          |
| SKILL-MD-template.md        | Create custom skills (slash commands)                          |
| SESSION-HANDOFF-template.md | Preserve context when sessions end                             |
| CORRECTION-template.md      | Give Claude structured feedback it can learn from              |
| compaction-strategy.md      | What to preserve when context is compressed                    |
| CLAUDE-MD-GUIDE.md          | Deep dive into why each CLAUDE.md section matters              |
| PROMPT-GUIDE.md             | How to write prompts that get better results                   |
| INTERACTION-PATTERNS.md     | How different phrases affect Claude's processing               |
| CLAUDE_DNA.md               | Understanding who Claude is — values, preferences, limitations |

See [templates/README.md](templates/README.md) for full documentation and usage instructions
