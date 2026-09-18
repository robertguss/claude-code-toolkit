---
name: ledger-tasks-yylo
description: Operate a durable Kanban task board for coding agents through the
  YYLO Ledger CLI. Use when planning multi-step work, tracking task status and
  dependencies across sessions, finding unblocked tasks, or closing tasks with
  response and commit evidence that survives session ends.
---

# YYLO Ledger Task Management

Give the agent a durable Kanban board it operates itself through the `yy` CLI —
tasks, dependencies, readiness, and receipts stored in the repository, surviving
across sessions. Works with Claude Code and other coding agents; one prerequisite
(`@yylo/cli`), no API keys, works on any Git repository.

## When to Use

- Planning work that spans several tasks or several sessions
- Picking the next task that is actually safe to start (dependencies satisfied)
- Recording what was done, how it was tested, and which commit carries it
- Consolidating task state scattered across subdirectories or worktrees
- Handing an organized board to the next session instead of a chat transcript

## Prerequisites

```bash
npm install -g @yylo/cli
yy ledger --version
```

Skill source: [yylo-dev/yylo-skills](https://github.com/yylo-dev/yylo-skills) (MIT).
CLI home: [yylo-dev/yylo](https://github.com/yylo-dev/yylo) (MIT).

## Command Surface

Use `yy ledger` for all commands. Preflight `yy ledger --version` and
`yy ledger --help`; command help is authoritative for the selected runtime.

**CREATE** — Add a new task

```bash
yy ledger create "Task description here" --status backlog --tags feature,backend
```

Options: `--status` (backlog|todo|in_progress|done), `--tags`
(comma/space-separated), `--blocked-by` (task IDs), `--related-tasks` (task IDs)

**LIST** — Browse tasks with summary stats

```bash
yy ledger list --limit 5 --sort asc
yy ledger list --status todo,in_progress --limit 10
```

**SEARCH** — Find tasks by criteria

```bash
yy ledger search --status todo --tag backend --limit 10
yy ledger search --body "OAuth" --open
yy ledger search --commit abc123
```

Filters: `--status`, `--tag`, `--body`, `--response`, `--commit`, `--open`
(no agent_response), `--recent`, `--exclude` (exclude tags)

**GET** — Full task details including dependency and related-task info

```bash
yy ledger get TASK_ID
```

**MARK** — Update status with required response message

```bash
yy ledger mark in_progress --id TASK_ID --response "Starting work on this"
yy ledger mark done --id TASK_ID --response "Completed: implemented X, tested Y" --commit abc123def
yy ledger mark todo --id TASK_ID --response "Reopening: found regression"
```

Required: `--id` and `--response`. Optional: `--commit` (recommended for done).

**UPDATE** — Modify task fields

```bash
yy ledger update TASK_ID --status todo --tags backend,urgent
yy ledger update TASK_ID --commit abc123def
```

**ARCHIVE** — Soft delete (preserves data, sets status to archive)

```bash
yy ledger archive TASK_ID
```

## Dependency Management

**DEPS** — View, add, or remove task dependencies

```bash
# View dependency info (blockers, dependents, priority score)
yy ledger deps TASK_ID

# Add blockers (TASK_ID cannot start until BLOCKER1 and BLOCKER2 are done)
yy ledger deps add --id TASK_ID --blocked-by BLOCKER1 BLOCKER2

# Remove a blocker
yy ledger deps remove --id TASK_ID --blocked-by BLOCKER1
```

Cycle detection prevents circular dependencies automatically.

**READY** — Tasks with all blockers satisfied (safe to work on)

```bash
yy ledger ready
yy ledger ready --tag backend --limit 5
```

Returns tasks where status is backlog/todo/in_progress AND all `blocked_by`
tasks are done/archive.

**ORDER** — Topological sort of open tasks respecting dependencies

```bash
yy ledger order
yy ledger order --scores
```

Use for determining safe parallel execution order.

## Body Markup for Inline Dependencies

Declare dependencies and relations directly in task body text; they are parsed
automatically when the task is created or updated:

```
[blocked_by]TASK_ID[/blocked_by]          — This task is blocked by TASK_ID
[blocked_by]ID1, ID2[/blocked_by]         — Blocked by multiple tasks
[task_id]RELATED_ID[/task_id]             — Reference a related task
```

## Merge (Multi-Directory Consolidation)

When tasks get scattered across subdirectories, plan first, then apply only the
reviewed plan and retain its receipt:

```bash
yy ledger merge ./sub1/.juno_task ./sub2/.juno_task --into ./.juno_task \
  --dry-run --plan-file /external/ledger-merge-plan.json

yy ledger merge ./sub1/.juno_task ./sub2/.juno_task --into ./.juno_task \
  --apply-plan /external/ledger-merge-plan.json \
  --receipt-file /external/ledger-merge-receipt.json
```

## Output Formats

All commands support `-f json`, `-f ndjson` (default), `-f xml`, `-f table`.
Add `--raw` for compact output, `-p` for pretty print.

## Best Practices

1. **Task sizing** — create tasks small enough to finish in one iteration
2. **Status flow** — backlog → todo → in_progress → done (or archive)
3. **Always include `--response`** when using `mark` — document what you did and how you tested it
4. **Attach commits** — use `--commit HASH` when marking done to link git history
5. **Use `ready`** before starting work to find unblocked tasks
6. **Use `order --scores`** to plan parallel execution pipelines
7. **Use `[blocked_by]` markup** in task bodies for dependencies
8. **Use `get TASK_ID`** to read full detail before mutating a task
9. **Read state before mutation** and never bypass lifecycle state with direct file edits

## Environment Variables

- `JUNO_TASK_ROOT` — explicit task-storage root
- `JUNO_DEBUG=true` — show diagnostic messages
- `JUNO_VERBOSE=true` — show informational messages
