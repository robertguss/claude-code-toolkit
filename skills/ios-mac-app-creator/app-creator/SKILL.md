---
name: app-creator
description: Orchestrate iOS/macOS app scaffolding and optional skill adoption for existing projects. Use when users want a guided wizard that can scaffold with XcodeGen and optionally install xcode-makefiles and simple-tasks.
---

# App Creator

## Overview

Paul Solt
Paul@SuperEasyApps.com
Version: 0.9.8

`app-creator` is now an orchestrator skill.

Responsibilities:
1. Scaffold new projects with XcodeGen templates.
2. Adopt existing projects non-destructively.
3. Optionally install subskills:
   - `xcode-makefiles`
   - `simple-tasks`

## Workflow

1. Collect inputs.
2. Run doctor checks.
3. Choose mode: `new` or `adopt`.
4. In `new` mode, scaffold app templates and run XcodeGen.
5. Install selected subskills (default: both).
6. Optionally initialize git and create a baseline commit.
7. Print exact next commands.

## Modes

### New Project

Run:

```bash
skills/app-creator/scripts/init.sh --project-mode new
```

Required fields in new mode:
- App name
- Bundle id
- Platform (`ios` or `macos`)
- UI framework (`swiftui`, `uikit`, `appkit`)
- Output directory

### Adopt Existing Project

Run:

```bash
skills/app-creator/scripts/init.sh --project-mode adopt
```

Behavior:
- No scaffolding/regeneration.
- Only installs selected subskills into the existing project.

## Subskill install defaults

Wizard defaults to installing both:
- `xcode-makefiles`
- `simple-tasks`

You can opt out with:
- `--skip-xcode-makefiles`
- `--skip-simple-tasks`

## Dry run

Use `--dry-run` to preview actions without mutating files.

## Git onboarding

`init.sh`/`scaffold_app.sh` support:
- `--git-init auto|never`
- `--git-commit prompt|always|never`

Defaults:
- `--git-init auto`
- `--git-commit prompt`

Safety behavior:
- If the target repo is already dirty before app-creator runs, auto-commit is skipped.
- If there are no staged/unstaged changes after install/scaffold, no commit is created.

## Resources

Use these files when you need details beyond the workflow:
- `references/workflow.md`
- `references/placeholders.md`
