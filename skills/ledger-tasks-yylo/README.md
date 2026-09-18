# ledger-tasks-yylo

A durable Kanban task board your coding agent operates itself through the
[YYLO Ledger](https://github.com/yylo-dev/yylo) CLI (`yy ledger`). Task state,
dependencies, and completion receipts live in the repository — so planning and
progress survive across sessions instead of dying with the chat transcript.

## What it does

You ask your agent to manage its own work ("create a task for the OAuth
refactor", "what's ready to work on?", "mark TASK-42 done — implemented and
tested") and it drives the board:

- **Create / list / search / get / update / archive** tasks with tags and status flow
- **Mark** status transitions with a required response and optional commit link — every done-task carries its evidence
- **Dependencies** — `deps add/remove`, cycle detection, `[blocked_by]` inline markup
- **Ready & order** — unblocked-task filter and topological sort for safe parallel execution
- **Merge** — deterministic multi-directory consolidation with plan/receipt files

## When to use it

- Planning work that spans several tasks or sessions
- Picking the next task that is actually safe to start
- Recording what was done, how it was tested, and which commit carries it
- Handing an organized board to the next session

## Prerequisites

```bash
npm install -g @yylo/cli
yy ledger --version
```

No API keys. Works on any Git repository. MIT licensed.

## How to invoke

- Claude Code: reference in your project `CLAUDE.md` —
  `When managing tasks, read skills/ledger-tasks-yylo/SKILL.md` — or load on
  demand when the user asks for task/kanban/board management.
- Claude.ai: package with `python build.py ledger-tasks-yylo` and upload the
  resulting `.skill` file under Settings → Skills.

## Example usage

```text
User:      Plan the API refactor as tasks and start what's safe.
Agent:     yy ledger create "Extract auth middleware" --status todo --tags api
           yy ledger create "Add rate limiting" --status backlog --blocked-by TASK-0001
           yy ledger ready
           → TASK-0001 (unblocked), TASK-0002 (blocked by TASK-0001)
           yy ledger mark in_progress --id TASK-0001 --response "Starting extraction"
...work...
           yy ledger mark done --id TASK-0001 \
             --response "Extracted middleware, tests green" --commit 9f3ab2c
```

Source: [yylo-dev/yylo-skills](https://github.com/yylo-dev/yylo-skills) ·
CLI: [yylo-dev/yylo](https://github.com/yylo-dev/yylo)
