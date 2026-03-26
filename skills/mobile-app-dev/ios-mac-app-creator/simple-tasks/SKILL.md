---
name: simple-tasks
description: "Install a fast local task workflow for single-project planning with `scripts/task.sh` (claim, done, status, reporting) backed by `tasks/TASKS.md` and optional `tasks/details/` notes. Use for lightweight task management, todo tracking, or in-progress work coordination — not full team issue tracking."
---

# Simple Tasks

Install a lightweight local task CLI into an existing project. Backed by
`tasks/TASKS.md` (single canonical backlog) with optional long-form notes in
`tasks/details/<id>.md`.

## Install

```bash
skills/simple-tasks/scripts/install.sh --project-dir /path/to/project
```

Flags: `--project-dir PATH` (required), `--mode install|upgrade` (default
`install`), `--dry-run` (preview only).

## Typical Workflow

```bash
# 1. Plan tasks — add entries to tasks/TASKS.md
./scripts/task.sh plan

# 2. Claim a task to start working on it
./scripts/task.sh claim 1

# 3. Mark a task done when finished
./scripts/task.sh done 1

# 4. Check current status
./scripts/task.sh status --today

# 5. See what's next
./scripts/task.sh next
```

## Commands

| Command | Purpose |
|---------|---------|
| `plan` | Add or edit tasks in the backlog |
| `claim <id>` | Mark a task as in-progress |
| `done <id>` | Mark a task as completed |
| `status` | Show current task states |
| `next` | Show the next unclaimed task |
| `summary` | Overview of all task progress |
| `finished` | List completed tasks |
| `upcoming` | List tasks not yet started |
| `needs-planning` | Tasks that need more detail |
| `blocked` | Tasks marked as blocked |
| `learn` | Capture learnings from completed work |

## Filters

Apply to any command: `--today`, `--last-24h`, `--last-week`, `--last-month`,
`--days N`, `--mine`, `--agent`, `--limit N`.
