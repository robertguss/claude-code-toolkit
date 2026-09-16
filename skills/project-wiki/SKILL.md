---
name: project-wiki
description:
  Build and keep a Karpathy-style LLM wiki inside a repo, as a project record or
  a research vault, with a schema, an index, a log, a lint, and a Quartz site on
  GitHub Pages.
disable-model-invocation: true
---

# Project wiki

A wiki is a persistent, compounding record: interlinked markdown pages the agent
writes and maintains and the human reads. Knowledge is compiled once and kept
current, so every page already carries its cross-references, its contradictions,
and its place in the whole. The pattern is Karpathy's
([`references/karpathy-llm-wiki.md`](references/karpathy-llm-wiki.md)); this
skill is its shape for a repo.

Three layers, all inside the repo:

- **Raw sources** (`raw/`): immutable. Read, never edited. Corrections go on
  wiki pages.
- **The wiki**: the pages. Written by the agent only. In a project run by the
  `lead` skill, the lead writes them and the worker never does.
- **The schema** (`SCHEMA.md`): the page types, frontmatter, tag taxonomy, and
  conventions. The agent and the human co-evolve it; a convention changes there
  first, then on the pages.

Two presets, chosen at init: **project record** (plans, sessions, decisions, a
roadmap board, a standing synthesis, maps) for a repo being built, and
**research vault** (sources, entities, concepts, comparisons, filed queries) for
a topic being studied. Both share the operations below.

## Start of session

Read, in order: `SCHEMA.md` whole, `index.md`, the last 20 entries of `log.md`
(`grep "^## \[" log.md | tail -20` finds them). In a project record, also the
synthesis page and the roadmap board. Only then touch a page.

No `SCHEMA.md` in the repo means the wiki does not exist yet: follow
[`references/init.md`](references/init.md).

## Operations

### Ingest

A source arrives (a URL, a file, a pasted transcript, a worker's report).

1. Save it under `raw/<kind>/` with frontmatter (`source_url`, `ingested`, and
   `sha256` of the body), named by what it is and when.
2. Find what already exists: search `index.md` and the pages for every entity,
   concept, or step the source names. This is the difference between a wiki and
   a pile of duplicates.
3. Write or update pages by the schema's thresholds: a page when a thing appears
   in two sources or is central to one, an update when it is already covered,
   nothing for a passing mention. Every page carries frontmatter from the
   schema, two or more outbound `[[wikilinks]]`, and a `## Related` list. New
   information that contradicts a page keeps both claims with dates, marks
   `contested: true` and `contradictions:` on both, and names the pair for the
   human.
4. Update `index.md` for new pages and append one `log.md` entry naming every
   file touched.

Done when every page the source bears on has been read and either updated or
left with a reason.

### Query

A question about the domain.

1. Read `index.md` to pick the pages; past a hundred pages, search the text too.
2. Read them, answer, and cite the pages.
3. File an answer worth keeping (a comparison, a synthesis, a connection) as a
   page of the schema's type for it; leave a lookup unfiled.
4. Append a `log.md` entry either way.

### Checkpoint

The project-record preset's unit of work, run at every acceptance, every pause,
and every closed topic.

1. Edit the pages the event touches: the plan's status and Result, the decision
   rows, the session page, the changelog, the roadmap board.
2. Bump `updated:` on each, add new pages to `index.md`, append one `log.md`
   entry.
3. At a pause, rewrite the synthesis page whole and the maps a landed page
   belongs on.
4. Run the lint and commit by path (`git commit -m <msg> -- <paths>`).

Done when the lint reports no broken links, no missing index entries, and no
frontmatter faults, and the log's last entry is this checkpoint.

### Lint

`python3 <wiki>/tools/lint.py` from the repo root: broken wikilinks, orphans,
index completeness, required frontmatter, tags outside the taxonomy, raw drift,
contested or low-confidence pages, pages over 200 lines, log size. Run it at
every checkpoint and at the end of every session, and record the count in
`log.md`. Issues the human owns stay listed and are named as theirs.

## Publishing

The wiki reads as a site with Quartz and GitHub Pages, built on every push to
the default branch. Setup is one branch of init:
[`references/publish.md`](references/publish.md).

## Conventions that hold in every preset

- File names lowercase with hyphens; a numbered page keeps its number forever.
- `created:` never changes; `updated:` is bumped on every edit.
- `raw/` is immutable; the `sha256` in its frontmatter is how drift shows.
- `index.md` lists every page with one line; `log.md` is append-only with the
  prefix `## [YYYY-MM-DD] action | subject`.
- Tags come from the taxonomy in `SCHEMA.md`; add the tag there first.
- Who said what stays visible: the human's words are quoted as theirs, the
  agent's recommendations are marked as recommendations.
- Prose the human reads comfortably: short paragraphs, narrow tables, snippets
  under 20 lines.
