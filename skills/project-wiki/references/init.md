# Init: a new wiki in this repo

Ask the human one question per message, and only what you cannot find.

## 1. The preset

**Project record** when the repo is something being built and the wiki is its
memory: briefs, sessions, decisions, a roadmap, a standing account of the state.
**Research vault** when the wiki is the product: sources read, the entities and
concepts in them, comparisons, and an evolving thesis.

## 2. The location

Propose `<repo>-wiki/` at the repo root for a project record (the wiki beside
the code, never inside it) and `wiki/` for a research vault. The folder is the
Obsidian vault root and the only thing Obsidian opens.

## 3. The domain, in one paragraph

What the wiki covers, who reads it, and what it must never contain. This becomes
the schema's Domain section.

## 4. Write the files

1. `SCHEMA.md` from `assets/SCHEMA-project-record.md` or
   `assets/SCHEMA-research-vault.md`, with the domain paragraph in, the layout
   trimmed to what this project needs, and the taxonomy started with ten to
   twenty tags for the domain. Read the template whole first; every section is a
   convention the lint or the operations depend on.
2. `index.md` from `assets/index.md` and `log.md` from `assets/log.md`, the
   log's first entry the creation.
3. The folders the schema's layout names, each with nothing in it yet (`raw/`
   and its kinds included).
4. `tools/lint.py` copied from `assets/lint.py`. It reads the page types and
   their folders from the schema's table, so it needs no edit.
5. For a project record: the synthesis page (`state-of-the-project.md` at the
   wiki root, "In one paragraph" and "Where we are" sections, the rest as
   headings to fill), the roadmap page under `plans/` with an empty board, and
   `maps/how-we-work.md` naming the roles and the loop.
6. In the repo's `CLAUDE.md`, one line: the wiki's path and that `SCHEMA.md` is
   read first in every session. In a `lead`-run project, the `LEAD.md` record
   line names this skill and the wiki path.
7. Publish, if the human wants the site: `references/publish.md`.
8. Run the lint, commit by path.

Done when the lint runs clean on the empty wiki and `CLAUDE.md` names it.
