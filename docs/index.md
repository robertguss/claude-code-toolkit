# Claude Skills

A collection of custom skills that extend Claude's capabilities with specialized workflows, methods, and domain knowledge.

---

## What Are Skills?

Skills are modular packages that transform Claude from a general-purpose assistant into a specialized collaborator. Each skill contains:

- **Instructions** - Detailed guidance for specific domains and workflows
- **Reference documentation** - Deep knowledge loaded on-demand
- **Templates** - Structured output formats for consistent results

Skills work with both **Claude Code** (CLI) and **Claude.ai** (web/mobile/desktop).

---

## Skill Categories

<div class="grid cards" markdown>

-   :material-lightbulb-outline:{ .lg .middle } **Brainstorm**

    ---

    Collaborative multi-session brainstorming with versioned documents, 25+ thinking methods, and decision tracking.

    [:octicons-arrow-right-24: Explore Brainstorm](skills/brainstorm/index.md)

-   :material-book-open-variant:{ .lg .middle } **Non-Fiction Book Factory**

    ---

    A complete pipeline for developing nonfiction books—from raw idea to chapter-level architecture.

    [:octicons-arrow-right-24: Explore Book Factory](skills/non-fiction-book-factory/index.md)

-   :material-book-edit:{ .lg .middle } **Ebook Factory**

    ---

    Create focused ebooks—shorter, concentrated solutions optimized for speed-to-value.

    [:octicons-arrow-right-24: Explore Ebook Factory](skills/ebook-factory/index.md)

-   :material-feather:{ .lg .middle } **Writing**

    ---

    Capture and replicate authentic writing voices with DNA discovery and ghost writing.

    [:octicons-arrow-right-24: Explore Writing](skills/writing/index.md)

</div>

---

## Quick Start

=== "Claude Code (CLI)"

    Reference skills in your project's `CLAUDE.md` or global `~/.claude/CLAUDE.md`:

    ```markdown
    # CLAUDE.md

    ## Skills

    When brainstorming, read and follow /path/to/claude-skills/brainstorm/SKILL.md.
    ```

    [:octicons-arrow-right-24: Full Claude Code setup guide](getting-started/installation-claude-code.md)

=== "Claude.ai (Web/Mobile/Desktop)"

    1. Package the skill: `python build.py <skill-name>`
    2. Open Claude.ai → Settings → Skills
    3. Upload the `.skill` file from `dist/`

    [:octicons-arrow-right-24: Full Claude.ai setup guide](getting-started/installation-claude-ai.md)

---

## For Developers

Want to create your own skills or contribute to this collection?

[:octicons-arrow-right-24: Developer Guide](developer-guide/index.md) — Learn the anatomy of a skill, best practices, and how to package for distribution.

---

## License

Personal use. Modify freely.
