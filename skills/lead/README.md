# Lead

Run a project with an expensive model as the lead and a cheaper one as the
worker. The lead writes briefs, hands each to a fresh Opus session in a
[Herdr](https://herdr.dev) pane, watches it, verifies the result with its own
probes, and reports. The worker writes every line of code. The loop never stops
to ask a question.

## Why

Judgment and typing are different jobs. Putting the expensive model on briefs,
verification, and decisions, and a fresh worker on each piece of code, gave one
project thirty accepted steps in four days with every step verified before it
merged. The pattern that made it work:

- **One fresh worker per brief.** Nothing leaks between steps.
- **The brief is the contract.** Orientation, write scope, parts, numbers, and a
  checkable Done-when.
- **The lead verifies with its own probes**, on inputs the brief never named.
  The report is the worker's claim; the probe is the evidence.
- **The worker lists the decisions the brief did not cover.** The lead ratifies
  or overturns each one.
- **The loop never stops to ask.** A question for the human becomes a recorded
  decision, made on the lead's recommendation, and the work goes on.

## Files it keeps in your repo

| file         | holds                                                                            | written by                |
| ------------ | -------------------------------------------------------------------------------- | ------------------------- |
| `LEAD.md`    | the stable setup: worker name and pane, model, test command, write scope, record | you, once; edited by hand |
| `HANDOFF.md` | the state and the queue                                                          | the lead, at every pause  |

The first run writes both from the templates in `assets/` and adds a pointer to
the project's `CLAUDE.md` so every session reads them.

## Use

```
/lead
```

Requires the `herdr` CLI on the machine and the lead session running inside a
Herdr pane. The record (a wiki, a decision log, a changelog) is the project's to
define; pair with the [`project-wiki`](../project-wiki/) skill for a wiki the
lead maintains.

## Layout

```
lead/
├── SKILL.md              the roles and the loop
├── references/setup.md   first run: writing LEAD.md and HANDOFF.md
└── assets/
    ├── LEAD.md           setup template
    ├── HANDOFF.md        handoff template
    ├── brief.md          brief template
    └── worker-prompt.md  the prompt that starts a worker
```
