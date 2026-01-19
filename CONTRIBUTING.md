# Contributing to Claude Code Toolkit

Thank you for your interest in contributing. This guide covers how to submit skills, hooks, templates, or improvements.

## Types of Contributions

### Skills

Skills are packaged workflows that give Claude domain expertise. To add a skill:

1. Create a directory under `skills/` with your skill name
2. Add a `SKILL.md` file with required YAML frontmatter:

```yaml
---
name: your-skill-name
description: "A description of at least 20 characters explaining what this skill does"
---

# Your Skill Instructions

[Detailed instructions for Claude to follow...]
```

3. Add a `README.md` explaining:
   - What the skill does
   - When to use it
   - How to invoke it
   - Example usage

4. Optionally add:
   - `references/` — Supporting documentation loaded on demand
   - `assets/` — Templates, examples, configurations

**Validation:** Run `python build.py --list` to verify your skill passes validation.

### Hooks

Hooks are shell scripts that run at specific Claude Code events. To add a hook:

1. Create a directory under `hooks/` with your hook name
2. Add the hook script (e.g., `your-hook.sh`)
3. Add a `README.md` covering:
   - What event triggers it (`PostToolUse`, `Stop`, `PreCompact`)
   - What the hook does
   - Installation instructions
   - Configuration options

### Templates

Templates are starting points for Claude configuration files. To add a template:

1. Add your template to the `templates/` directory
2. Update `templates/README.md` with your template's purpose and usage

### Bug Fixes and Improvements

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR_USERNAME/claude-code-toolkit.git
cd claude-code-toolkit

# Install dependencies
just install

# Validate skills
python build.py --list

# Test documentation locally
just docs-serve
```

## Skill Guidelines

**Do:**
- Write clear, actionable instructions
- Include examples
- Document when to use (and when not to use) the skill
- Keep the scope focused

**Don't:**
- Create skills that duplicate existing functionality
- Include sensitive information or API keys
- Write instructions that are vague or open to interpretation

## Code Style

- Python: Format with `ruff`
- Shell: Use `#!/bin/bash` and handle errors
- Markdown: Use consistent heading hierarchy

## Questions?

Open an issue for questions about contributing.
