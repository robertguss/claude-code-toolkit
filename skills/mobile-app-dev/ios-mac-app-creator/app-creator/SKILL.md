---
name: app-creator
description: "Orchestrate iOS/macOS app scaffolding and optional skill adoption for existing projects. Use when creating a new iOS app, setting up an Xcode project, initializing a macOS app, or adopting an existing Swift project into the guided wizard that scaffolds with XcodeGen and optionally installs xcode-makefiles and simple-tasks."
---

# App Creator

Orchestrator skill that scaffolds new iOS/macOS projects with XcodeGen templates
or adopts existing projects non-destructively, with optional subskill
installation (`xcode-makefiles`, `simple-tasks`).

## Workflow

1. Collect inputs (app name, bundle ID, platform, UI framework, output dir).
2. Run doctor checks — verify XcodeGen and dependencies are available.
3. Choose mode: `new` or `adopt`.
4. In `new` mode, scaffold app templates and run XcodeGen.
5. Install selected subskills (default: both).
6. Optionally initialize git and create a baseline commit.
7. Print exact next commands.

**Verify success:** After step 4, confirm `.xcodeproj` was generated. If doctor
checks fail in step 2, resolve dependencies before proceeding.

## Modes

### New Project

```bash
skills/app-creator/scripts/init.sh --project-mode new
```

Required fields: app name, bundle ID, platform (`ios` or `macos`), UI framework
(`swiftui`, `uikit`, `appkit`), output directory.

**Complete example:**

```bash
skills/app-creator/scripts/init.sh \
  --project-mode new \
  --app-name MyApp \
  --bundle-id com.example.myapp \
  --platform ios \
  --ui-framework swiftui \
  --output-dir ./MyApp
```

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
