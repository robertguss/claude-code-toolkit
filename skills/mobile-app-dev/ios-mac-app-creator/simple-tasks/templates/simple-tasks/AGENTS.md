# Agent workflow rules

- Use `scripts/task.sh` as the single task entrypoint.
- Use `AGENT_NAME` when claiming and completing work.
- Keep committed task backlog in `tasks/TASKS.md`.
- Put deeper task notes in `tasks/details/<id>.md`.

Task workflow commands:
- `scripts/task.sh plan <slug> --scope "..." --files "..." --note "..."`
- `AGENT_NAME=CODEX scripts/task.sh claim <number|id> --note "Starting work"`
- `AGENT_NAME=CODEX scripts/task.sh done <number|id> --note "Finished + build/test status"`
- `scripts/task.sh summary --last-24h`
