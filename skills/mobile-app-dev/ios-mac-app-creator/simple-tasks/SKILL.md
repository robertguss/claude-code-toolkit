---
name: simple-tasks
description: Install a fast local task workflow for single-project planning with `scripts/task.sh` (claim, done, status, reporting) backed by `tasks/TASKS.md` and optional `tasks/details/` notes. Use for lightweight in-progress task coordination, not full team issue tracking.
---

# Simple Tasks

## Overview

Paul Solt
Paul@SuperEasyApps.com
Version: 0.9.8

`simple-tasks` installs a lightweight local task CLI into an existing project.

Design goals:
- Fast local planning and execution.
- Human shorthand task numbers + stable task IDs.
- Single canonical backlog file: `tasks/TASKS.md`.
- Optional long-form notes per task: `tasks/details/<id>.md`.

## Install

```bash
skills/simple-tasks/scripts/install.sh --project-dir /path/to/project
```

Common flags:
- `--project-dir PATH` required
- `--mode install|upgrade` default `install`
- `--dry-run` preview changes only

## Commands

Installed `scripts/task.sh` supports:
- `claim`
- `done`
- `status`
- `next`
- `plan`
- `finished`
- `upcoming`
- `needs-planning`
- `blocked`
- `summary`
- `learn`

Filters:
- `--today`
- `--last-24h`
- `--last-week`
- `--last-month`
- `--days`
- `--mine`
- `--agent`
- `--limit`
