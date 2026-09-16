# <Project> Wiki — Schema

Read this first, every session. Then `index.md`, then the last 20 entries of
`log.md`, then `state-of-the-project.md`. Only then touch anything.

## Domain

<One paragraph: what is being built, by whom, and what this wiki is the record
of. This vault is the single record of the work: what was asked, what was
decided, what was measured, and what happened in each session.>

The wiki lives in `<wiki>/`, the Obsidian vault root. Code lives beside the
vault and never inside it. Wiki pages may cite code paths; nothing outside the
wiki links to a wiki page. In a project run by the `lead` skill, the lead writes
every page here and a worker never writes under `<wiki>/`.

## Layout

```
HANDOFF.md           the state and the queue for the next session (repo root)
CHANGELOG.md         what shipped, per session (repo root)

<wiki>/              the vault root; everything below is relative to it
  SCHEMA.md          this file
  index.md           every wiki page, one line each, by section
  log.md             append-only action log
  state-of-the-project.md   the standing synthesis, rewritten at every pause
  plans/             briefs (one per step) and the roadmap
  sessions/          one page per session
  decisions/         decision-log.md, every choice in order with its status
  questions/         open questions for the human, answer in frontmatter
  deep-dives/        long-form reasoning on one topic
  research/          pages backed by sources in raw/
  maps/              maps of content: one topic, its pages, in reading order
  raw/               immutable sources: exports, articles, worker reports
  spec/              artifacts humans read (prose specs), not wiki pages
  tools/             lint.py and other vault tooling
```

Wiki pages are the `.md` files under the folders the table below names, plus the
synthesis at the root. `raw/`, `spec/`, and `tools/` hold no wiki pages.

## Page types

| type         | lives in      | what it is                                                                |
| ------------ | ------------- | ------------------------------------------------------------------------- |
| `plan`       | plans/        | a brief for one step, with a Result section once accepted; or the roadmap |
| `session`    | sessions/     | what happened in one sitting, chronological                               |
| `decision`   | decisions/    | the decision log, or one locked rule with its "reopen if"                 |
| `question`   | questions/    | something needing the human's call: options, recommendation, why, answer  |
| `deep-dive`  | deep-dives/   | full reasoning on one topic, options weighed                              |
| `concept`    | research/     | a researched topic citing raw sources                                     |
| `comparison` | research/     | this project held against one other thing                                 |
| `map`        | maps/         | one topic, the pages behind it, in reading order; rewritten as pages land |
| `synthesis`  | the wiki root | the standing account of the whole, rewritten at every pause               |

Trim rows this project will never use; add a row before using a new type.

## Frontmatter (required on every wiki page)

```yaml
---
title: "Step 12: the formatter, brief for the worker"
created: 2026-09-16
updated: 2026-09-16
type: plan # from the table above
tags: [tooling] # from the taxonomy below only
sources: [raw/reports/report-step-12.md]
# type-specific:
status: done # plan: planned | in-progress | done; question: pending | answered
number: 12 # plan, question, decision when numbered
# optional quality signals:
confidence: high | medium | low
contested: true
contradictions: [other-page-slug]
---
```

Every page starts with `# Title` matching the frontmatter title, then body, then
a `## Related` list. Minimum two outbound `[[wikilinks]]` per page.

## Tag taxonomy

Add a tag here before using it. Keep it under 25.

- **Meta:** `meta`, `roadmap`, `process`
- **The work:** <ten to twenty tags for the domain, grouped>

## Conventions

- File names: lowercase, hyphens. Numbered pages keep their prefix forever
  (`step-12-…`, `q08-…`); a renumbering is a lie about history.
- The human's words are quoted as theirs; the agent's recommendations are marked
  as recommendations. Never blur who said what.
- Readable prose: short paragraphs, narrow tables (three columns where it fits),
  snippets under 20 lines.
- `updated:` is bumped on every edit. `created:` never changes.
- `raw/` is immutable. Corrections go on wiki pages. Each raw file carries
  `source_url` (or the path it came from), `ingested`, and a `sha256` of its
  body so drift is detectable.
- Provenance: a claim from a specific raw source gets `^[raw/...]` at the end of
  its paragraph when the page draws on three or more sources.

## The decision log

`decisions/decision-log.md`: one row per choice, appended in order, never edited
except to change `status`. Columns: **decision**, **who** (the human, or the
lead deciding on the human's standing instruction), **status** (`provisional`
until measured, then `locked` or `overturned` with a link to the row that
replaced it), **first tested by** (the thing that can prove it wrong). A default
a worker chose and the lead ratified says "from the worker's default". A row the
human must see says "for <human>". A row the human overturns keeps its place;
the new row links back.

## How the work flows through the vault

1. **A brief is written** → `plans/<step>.md`, `status: in-progress`, a line in
   `index.md`.
2. **A brief is accepted** → the plan's `status: done` and a `## Result` section
   (when, what was built, the numbers, the lead's probes, what was ratified from
   the worker's defaults, what is unmet and carried); decision rows; the roadmap
   board; a `CHANGELOG.md` entry; a `log.md` entry.
3. **Something needs the human's call** → a decision row marked for them, made
   on the lead's recommendation, and the work continues; a `questions/` page
   only when the options need a page to show.
4. **A long unpack** → `deep-dives/<slug>.md`, linked from what it serves.
5. **Every pause** → the session page appended, `state-of-the-project.md`
   rewritten whole, the maps a landed page belongs on, `HANDOFF.md` rewritten,
   `log.md` appended, the lint run and its count logged.

## The roadmap board

`plans/roadmap.md` opens with the board: **Now, in flight** (one row), **Next,
in order**, **Later**, **Waiting on <human>** (rows marked for them, newest
first, none blocking), **Recently done** (dated, with the page). Rewritten at
every acceptance and every pause. The human reads it for status; the lead reads
it for order.

## Update policy on conflict

When something new contradicts an existing page: keep both with dates, mark
`contested: true` and `contradictions: [slug]` on both, and name the pair for
the human. Nothing is silently overwritten.

## Checkpoints

The vault is updated at natural checkpoints (a brief accepted, a topic closed, a
pause), not after every message. A checkpoint is: edit pages → bump `updated:` →
update `index.md` if pages were added → append one `log.md` entry → lint →
commit by path.

## Lint

`python3 <wiki>/tools/lint.py` from the repo root: broken wikilinks, orphans,
index completeness, required frontmatter, tags in taxonomy, raw sha256 drift,
contested or low-confidence pages, pages over 200 lines, log size. Run it at
every checkpoint and record the count in `log.md`.
