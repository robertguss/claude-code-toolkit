# First run: writing LEAD.md and HANDOFF.md

`LEAD.md` is missing, so this project has not run the loop before. Gather the
values below, write both files from the templates in `assets/`, and point the
project's `CLAUDE.md` at them. Ask the human one question per message, and only
for values you cannot find yourself.

## Find before asking

- `herdr pane list` and `herdr agent list`: the workspace this repo lives in,
  its panes, and whether any pane already holds a shell with no agent. Propose
  the emptiest shell pane in this workspace as the worker pane.
- `herdr pane list` also names the machine; record the pane under that machine's
  name.
- The test command: the project's `package.json`, `justfile`, `Makefile`,
  `build.zig`, `pyproject.toml`, or CI workflow says it.
- The default branch: `git symbolic-ref refs/remotes/origin/HEAD`.
- Whether a wiki exists: a folder holding `SCHEMA.md`, `index.md`, and `log.md`.

## Ask, one at a time

1. **The worker name.** Propose `<repo>-opus`. Names are unique across every
   live Herdr agent on the machine, so a bare `worker` collides with another
   project's.
2. **The write scope.** The folders the worker owns by default; the record
   folders it never touches.
3. **Where briefs live.** A folder of markdown pages, one per step. Propose the
   wiki's `plans/` when there is a wiki, else `briefs/` at the root.
4. **How the record is kept.** One line: the `project-wiki` skill and the wiki
   path, a changelog, a decision log, or "none".
5. **Machine quirks.** Aliased commands, tools that must be running, memory or
   timeout rules for the project's processes. "None yet" is a fine answer; the
   pause step adds to it.

Defaults that need no question unless the human objects: model `opus`, effort
`medium`, flags `--model opus --dangerously-skip-permissions`, trailer
`Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>`, memory bound 4 GB.

## Write

1. `LEAD.md` at the repo root from `assets/LEAD.md`, every blank filled.
2. `HANDOFF.md` at the repo root from `assets/HANDOFF.md`, with the queue the
   human gives you and no state yet.
3. In the project's `CLAUDE.md`, under its first heading, add:

   ```markdown
   Start every session by invoking the `lead` skill, then read `LEAD.md` (the
   setup) and `HANDOFF.md` (the state and the queue) at the repo root.
   ```

4. Commit the three files by path.

Done when `LEAD.md` has no blank left and `CLAUDE.md` names both files.
