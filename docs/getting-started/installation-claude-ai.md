# Claude.ai Setup

This guide covers installing and using skills with Claude.ai (web, mobile, and desktop apps).

---

## Prerequisites

- Claude.ai account with access to Skills feature
- Python 3.8+ (for packaging skills)
- The claude-skills repository cloned locally

---

## Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/robertguss/claude-skills.git
cd claude-skills
```

### Step 2: Install Dependencies

```bash
# Using uv (recommended)
uv sync

# Or using pip
pip install pyyaml
```

### Step 3: Package a Skill

Use the build script to create a `.skill` package:

=== "Single Skill"

    ```bash
    # Using just
    just package brainstorm

    # Or directly
    python build.py brainstorm
    ```

    This creates `dist/brainstorm.skill`.

=== "All Skills"

    ```bash
    # Using just
    just package-all

    # Or directly
    python build.py --all
    ```

    This packages all skills into the `dist/` folder.

=== "List Available Skills"

    ```bash
    # Using just
    just list-skills

    # Or directly
    python build.py --list
    ```

    Shows all available skills with validation status.

### Step 4: Upload to Claude.ai

1. Open [Claude.ai](https://claude.ai)
2. Go to **Settings** (gear icon)
3. Navigate to **Skills**
4. Click **Upload Skill**
5. Select the `.skill` file from the `dist/` folder
6. The skill is now available in your Claude.ai sessions

---

## Usage

### Starting a Skill Session

Simply describe what you want to do:

```text
Let's brainstorm some ideas for a new mobile app.
```

Claude will recognize the intent and apply the skill's workflow.

### Skill Management

In Claude.ai Settings → Skills, you can:

- **View installed skills** — See all your active skills
- **Remove skills** — Delete skills you no longer need
- **Update skills** — Upload a new version to replace the old one

---

## Updating Skills

When skills are updated in the repository:

1. Pull the latest changes:
   ```bash
   cd /path/to/claude-skills
   git pull
   ```

2. Re-package the skill:
   ```bash
   python build.py brainstorm
   ```

3. Upload the new `.skill` file in Claude.ai Settings → Skills

---

## Pipeline Skills

For skills that work in sequence (like the Non-Fiction Book Factory), upload each skill you need:

```bash
python build.py book-ideation
python build.py book-idea-validator
python build.py book-market-research
python build.py book-architect
python build.py book-research-assistant
python build.py chapter-architect
```

Then upload each `.skill` file to Claude.ai.

---

## What Gets Packaged

The `.skill` file is a ZIP archive containing:

- `SKILL.md` — The core instructions
- `references/` — Supporting documentation (if present)
- `assets/` — Templates and examples (if present)

Hidden files, `.DS_Store`, and `__pycache__` are automatically excluded.

---

## Troubleshooting

### Build Errors

#### "Missing required field: name"

The skill's `SKILL.md` is missing required YAML frontmatter. Each SKILL.md must start with:

```yaml
---
name: skill-name
description: A description of at least 20 characters explaining what the skill does.
---
```

#### "Description must be at least 20 characters"

The description in the frontmatter is too short. Provide a meaningful description.

### Upload Errors

#### "Invalid skill file"

The `.skill` file may be corrupted. Try re-packaging:

```bash
python build.py <skill-name>
```

#### "Skill already exists"

Remove the existing skill in Settings → Skills before uploading the updated version, or use the update/replace option if available.

---

## Next Steps

- [:octicons-arrow-right-24: Your First Skill Tutorial](your-first-skill.md) — Try the Brainstorm skill hands-on
- [:octicons-arrow-right-24: Browse Available Skills](../skills/index.md) — See all available skills
