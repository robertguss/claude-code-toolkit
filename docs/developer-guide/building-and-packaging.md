# Building & Packaging

How to package skills for Claude.ai upload.

---

## Overview

The `build.py` script packages skills into `.skill` files (ZIP archives) that can be uploaded to Claude.ai.

---

## Prerequisites

```bash
pip install pyyaml
```

---

## Basic Usage

### Package a Single Skill

```bash
python build.py <skill-name>
```

Example:
```bash
python build.py brainstorm
# Output: dist/brainstorm.skill
```

### Package All Skills

```bash
python build.py --all
```

### List Available Skills

```bash
python build.py --list
```

---

## What Gets Packaged

The build script creates a ZIP archive containing:

| Included | Excluded |
|----------|----------|
| SKILL.md | Hidden files (.*) |
| references/ | .DS_Store |
| assets/ | __pycache__ |
| | README.md (skill-level) |

---

## Validation

The build script validates each skill before packaging:

### Required: YAML Frontmatter

```yaml
---
name: skill-name
description: Description of at least 20 characters.
---
```

### Validation Checks

| Check | Requirement |
|-------|-------------|
| SKILL.md exists | File must be present |
| Frontmatter present | Must start with `---` |
| name field | Required |
| description field | Required, min 20 chars |

### Common Errors

**Missing SKILL.md:**
```
Error: brainstorm/SKILL.md not found
```
→ Ensure SKILL.md exists in the skill folder

**Missing frontmatter:**
```
Error: SKILL.md must start with YAML frontmatter (---)
```
→ Add `---` at top and bottom of frontmatter block

**Missing required field:**
```
Error: Missing required field: name
```
→ Add name field to frontmatter

**Description too short:**
```
Error: Description must be at least 20 characters
```
→ Write a more comprehensive description

---

## Workflow

### Creating a New Skill

1. **Create folder structure**
   ```
   my-skill/
   ├── SKILL.md
   ├── references/     # optional
   └── assets/         # optional
   ```

2. **Write SKILL.md** with proper frontmatter

3. **Add references and assets** as needed

4. **Validate**
   ```bash
   python build.py --list
   # Check for ✓ valid next to your skill
   ```

5. **Package**
   ```bash
   python build.py my-skill
   ```

6. **Upload** to Claude.ai → Settings → Skills

### Updating a Skill

1. Make changes to skill files

2. Re-package
   ```bash
   python build.py my-skill
   ```

3. Upload new `.skill` file to Claude.ai (replaces existing)

---

## Skill Naming

The build command uses the skill folder name:

| Folder Location | Build Command |
|-----------------|---------------|
| `brainstorm/` | `python build.py brainstorm` |
| `non-fiction-book-factory/book-ideation/` | `python build.py book-ideation` |
| `writing/ghost-writer/` | `python build.py ghost-writer` |

Note: Use the skill name, not the full path.

---

## Output Location

All packages go to the `dist/` directory:

```
dist/
├── brainstorm.skill
├── book-ideation.skill
├── book-idea-validator.skill
└── ...
```

---

## Testing Before Upload

### Local Validation

```bash
python build.py --list
```

Check that your skill shows ✓ valid.

### Build and Inspect

```bash
python build.py my-skill

# Inspect the package (it's a ZIP file)
unzip -l dist/my-skill.skill
```

### Test with Claude Code

Before packaging for Claude.ai, test with Claude Code:

```markdown
# CLAUDE.md

When testing my-skill, read and follow /path/to/my-skill/SKILL.md.
```

Run through various scenarios to validate behavior.

---

## Troubleshooting

### "Skill not found"

```
Error: Skill 'my-skil' not found
```

- Check spelling
- Run `python build.py --list` to see valid names
- Ensure SKILL.md exists in the folder

### "Permission denied"

```bash
mkdir -p dist
chmod 755 dist
```

### "Invalid YAML"

- Check frontmatter syntax
- Ensure `---` on its own lines
- Validate YAML formatting

### Package too large

Claude.ai may have size limits. If your skill is very large:

- Move large content to references (lazy-loaded)
- Compress images
- Remove unnecessary assets

---

## Best Practices

### Before Building

- [ ] SKILL.md has proper frontmatter
- [ ] Description is comprehensive (>20 chars)
- [ ] References are properly pointed to
- [ ] Assets are organized
- [ ] No unnecessary files

### After Building

- [ ] Package appears in dist/
- [ ] Package size is reasonable
- [ ] Contents look correct (unzip to inspect)

### After Uploading

- [ ] Skill appears in Claude.ai Settings
- [ ] Test activation with relevant prompts
- [ ] Verify behavior matches expectations

---

## Related

- [Skill Anatomy](skill-anatomy.md) — Understand structure
- [Writing SKILL.md](writing-skill-md.md) — Best practices
- [Build Commands Reference](../reference/build-commands.md) — Full CLI reference
