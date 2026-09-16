# Lead setup

The stable values the `lead` skill reads at the start of every session. Edit by
hand when something changes; the skill never rewrites this file on its own. The
state and the queue live in `HANDOFF.md`.

## Worker

| key            | value                                                   |
| -------------- | ------------------------------------------------------- |
| name           | `<repo>-opus`                                           |
| pane           | `wN:pM` on `<machine>`; `wX:pY` on `<other machine>`    |
| model          | `opus`                                                  |
| effort         | `medium`                                                |
| start flags    | `--model opus --dangerously-skip-permissions`           |
| commit trailer | `Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>` |
| memory bound   | kill a project process past 4 GB                        |

## Project

| key            | value                                                             |
| -------------- | ----------------------------------------------------------------- |
| test command   | `<command that must be green at every commit>`                    |
| build command  | `<command, or the test command if one step>`                      |
| default branch | `main`                                                            |
| write scope    | `<folders the worker owns>`; never `<record folders>`             |
| briefs         | `<folder>/` one page per step, named `<prefix>-N.md`              |
| record         | `<"project-wiki skill, wiki at <path>" or "changelog" or "none">` |

## Machine quirks

- <aliased commands, tools that must be running, port rules; "none yet" is fine>
