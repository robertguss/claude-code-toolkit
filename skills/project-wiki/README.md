# Project wiki

Build and keep a Karpathy-style LLM wiki inside a repo: interlinked markdown
pages the agent writes and maintains and you read, with a schema that keeps it
disciplined, an index and a log for navigation, a lint that keeps it healthy,
and a Quartz site on GitHub Pages so you can read it anywhere.

## The pattern

Andrej Karpathy's [LLM Wiki](references/karpathy-llm-wiki.md): instead of
retrieving from raw documents on every question, the LLM incrementally builds
and maintains a persistent wiki that sits between you and the sources. Knowledge
is compiled once and kept current. Cross-references are already there,
contradictions already flagged, the synthesis already reflects everything read.
You curate sources and ask questions; the LLM does the bookkeeping nobody wants
to do.

## Two presets

| preset             | for                                            | pages                                                                                                                 |
| ------------------ | ---------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| **Project record** | a repo being built, the wiki as its memory     | briefs with results, sessions, a decision log, a roadmap board, a standing state-of-the-project page, maps of content |
| **Research vault** | a topic being studied, the wiki as the product | source summaries, entities, concepts, comparisons, filed queries, an evolving synthesis                               |

Both share the three layers (immutable `raw/`, the agent-owned pages,
`SCHEMA.md`), the frontmatter, the tag taxonomy, `index.md`, `log.md`, and the
lint. The schema templates in `assets/` are the full conventions; init trims
them to the project.

## With the lead skill

In a project run by [`lead`](../lead/), the lead is the only writer of the wiki
and the worker never touches it. The lead's checkpoints (a brief accepted, a
pause) are this skill's checkpoint operation, and `LEAD.md` names the wiki as
the project's record.

## Publishing

One branch of init clones Quartz into `site/`, writes the config and a GitHub
Actions workflow, and builds locally to prove it. The one step only you can do
is setting the repository's Pages source to GitHub Actions; the skill tells you
when.

## Use

```
/project-wiki
```

## Layout

```
project-wiki/
├── SKILL.md                         the layers, the session start, the operations
├── references/
│   ├── karpathy-llm-wiki.md         the original idea file
│   ├── init.md                      creating a wiki in a repo
│   └── publish.md                   Quartz and GitHub Pages
└── assets/
    ├── SCHEMA-project-record.md     schema template, project record preset
    ├── SCHEMA-research-vault.md     schema template, research vault preset
    ├── index.md                     index template
    ├── log.md                       log template
    ├── lint.py                      the lint, driven by the schema's tables
    ├── quartz.config.yaml           Quartz configuration
    └── publish-wiki.yml             the GitHub Actions workflow
```
