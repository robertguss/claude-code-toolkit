# Build Commands

CLI reference for the build.py packaging script.

---

## Overview

The `build.py` script packages skills for Claude.ai upload. It validates skill structure, creates ZIP archives, and outputs `.skill` files to the `dist/` directory.

---

## Prerequisites

```bash
# Install required dependency
pip install pyyaml
```

---

## Commands

### Package a Single Skill

```bash
python build.py <skill-name>
```

**Example:**
```bash
python build.py brainstorm
```

**Output:**
```
Packaging brainstorm...
Created: dist/brainstorm.skill
```

### Package All Skills

```bash
python build.py --all
```

**Output:**
```
Packaging brainstorm...
Created: dist/brainstorm.skill
Packaging book-ideation...
Created: dist/book-ideation.skill
...
Packaged 12 skills successfully.
```

### List Available Skills

```bash
python build.py --list
```

**Output:**
```
Available skills:
  brainstorm             ✓ valid
  book-ideation          ✓ valid
  book-idea-validator    ✓ valid
  book-market-research   ✓ valid
  book-architect         ✓ valid
  book-research-assistant ✓ valid
  chapter-architect      ✓ valid
  ebook-discovery        ✓ valid
  ebook-concept-development ✓ valid
  writing-dna-discovery  ✓ valid
  ghost-writer           ✓ valid
```

---

## Skill Naming

Skill names for the build command match their folder names:

| Folder Path | Build Command |
|-------------|---------------|
| `brainstorm/` | `python build.py brainstorm` |
| `non-fiction-book-factory/book-ideation/` | `python build.py book-ideation` |
| `ebook-factory/ebook-discovery/` | `python build.py ebook-discovery` |
| `writing/ghost-writer/` | `python build.py ghost-writer` |

---

## Output

### Location

All packaged skills are output to the `dist/` directory:

```
dist/
├── brainstorm.skill
├── book-ideation.skill
├── book-idea-validator.skill
└── ...
```

### File Format

`.skill` files are ZIP archives containing:

- `SKILL.md` — The core instructions
- `references/` — Supporting documentation (if present)
- `assets/` — Templates and examples (if present)

### Excluded Files

The following are automatically excluded from packages:

- Hidden files (starting with `.`)
- `.DS_Store`
- `__pycache__`
- `README.md` (skill-level)

---

## Validation

The build script validates each skill before packaging:

### Required Elements

| Element | Requirement |
|---------|-------------|
| `SKILL.md` | Must exist in skill folder |
| YAML frontmatter | Must be present at top of SKILL.md |
| `name` field | Required in frontmatter |
| `description` field | Required, minimum 20 characters |

### Validation Errors

**Missing SKILL.md:**
```
Error: brainstorm/SKILL.md not found
```

**Missing frontmatter:**
```
Error: SKILL.md must start with YAML frontmatter (---)
```

**Missing required field:**
```
Error: Missing required field: name
```

**Description too short:**
```
Error: Description must be at least 20 characters
```

---

## SKILL.md Frontmatter

Each SKILL.md must begin with YAML frontmatter:

```yaml
---
name: skill-name
description: A description of at least 20 characters explaining what the skill does and when to use it.
---

# Skill Title

Content...
```

### Frontmatter Fields

| Field | Required | Description |
|-------|----------|-------------|
| `name` | Yes | Skill identifier (should match folder name) |
| `description` | Yes | When to activate the skill (min 20 chars) |

The `description` field is particularly important—it determines when Claude activates the skill based on user prompts.

---

## Workflow

### Typical Packaging Workflow

1. **Validate** — Ensure skill is valid
   ```bash
   python build.py --list
   ```

2. **Package** — Create the .skill file
   ```bash
   python build.py brainstorm
   ```

3. **Upload** — Go to Claude.ai → Settings → Skills → Upload

### Updating a Skill

1. Make changes to the skill files
2. Re-run the build command
3. Upload the new .skill file to Claude.ai (replaces existing)

---

## Troubleshooting

### "Skill not found"

The skill name doesn't match any folder. Check:

- Spelling
- That you're using the skill name, not the folder path
- Run `python build.py --list` to see valid names

### "Invalid YAML frontmatter"

The frontmatter is malformed. Ensure:

- Frontmatter starts and ends with `---`
- YAML is properly formatted
- Required fields are present

### "Permission denied" on dist/

The dist folder may have permission issues:

```bash
mkdir -p dist
chmod 755 dist
```

---

## Related

- [Claude.ai Setup](../getting-started/installation-claude-ai.md) — Full upload workflow
- [Skill Anatomy](../developer-guide/skill-anatomy.md) — Understanding skill structure
- [Writing SKILL.md](../developer-guide/writing-skill-md.md) — Best practices for SKILL.md
