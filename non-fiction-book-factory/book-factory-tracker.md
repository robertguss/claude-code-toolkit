# The Book Factory: Project Tracker

**Purpose:** Track the development status of all skills in the Book Factory pipeline.

**Last Updated:** December 29, 2025

---

## Quick Status Overview

| Phase                  | Skills | Status         |
| ---------------------- | ------ | -------------- |
| Phase 0: Raw Ideation  | 1      | ✅ Complete    |
| Phase 1: Book Concept  | 1      | ✅ Complete    |
| Phase 2: Validation    | 2      | ⬜ Not Started |
| Phase 3: Architecture  | 1      | ⬜ Not Started |
| Phase 4: Deep Research | 1      | ⬜ Not Started |
| Phase 5: Drafting      | 1      | ⬜ Not Started |
| Phase 6: Editing       | 5      | ⬜ Not Started |
| Phase 7: Production    | 1      | ⬜ Not Started |
| **Total**              | **13** | **2 Complete** |

---

## Detailed Skill Tracker

### Phase 0: Raw Ideation

| Skill        | Status  | Version | Date Completed | Location                    | Dependencies | Notes/Blockers                                                      |
| ------------ | ------- | ------- | -------------- | --------------------------- | ------------ | ------------------------------------------------------------------- |
| `brainstorm` | ✅ Done | v1      | Pre-existing   | `claude-skills/brainstorm/` | None         | Generic, multi-purpose. Works for any project type, not just books. |

---

### Phase 1: Book Concept Development

| Skill           | Status  | Version | Date Completed | Location                       | Dependencies            | Notes/Blockers                                      |
| --------------- | ------- | ------- | -------------- | ------------------------------ | ----------------------- | --------------------------------------------------- |
| `book-ideation` | ✅ Done | v1      | 2024-12-29     | `claude-skills/book-ideation/` | `brainstorm` (optional) | Produces Book Concept Document with Eight Elements. |

---

### Phase 2: Validation

| Skill             | Status  | Version | Date Completed | Location | Dependencies                      | Notes/Blockers                                                     |
| ----------------- | ------- | ------- | -------------- | -------- | --------------------------------- | ------------------------------------------------------------------ |
| `idea-validator`  | ✅ Done | —       | —              | —        | `book-ideation`                   | Stress-tests thesis against existing research. Uses web search.    |
| `market-research` | ✅ Done | —       | —              | —        | `book-ideation`, `idea-validator` | KDP-specific market analysis. Uses web search for Amazon research. |

---

### Phase 3: Architecture

| Skill            | Status    | Version | Date Completed | Location | Dependencies                                         | Notes/Blockers                                                 |
| ---------------- | --------- | ------- | -------------- | -------- | ---------------------------------------------------- | -------------------------------------------------------------- |
| `book-architect` | ⬜ Future | —       | —              | —        | `book-ideation`, `idea-validator`, `market-research` | Designs reader journey, chapter blueprint, TOC. Multi-session. |

---

### Phase 4: Deep Research

| Skill                | Status    | Version | Date Completed | Location | Dependencies     | Notes/Blockers                                                       |
| -------------------- | --------- | ------- | -------------- | -------- | ---------------- | -------------------------------------------------------------------- |
| `research-assistant` | ⬜ Future | —       | —              | —        | `book-architect` | Fills gaps from Architecture Document. Distinct from idea-validator. |

---

### Phase 5: Drafting

| Skill         | Status    | Version | Date Completed | Location | Dependencies                           | Notes/Blockers                                                    |
| ------------- | --------- | ------- | -------------- | -------- | -------------------------------------- | ----------------------------------------------------------------- |
| `draft-coach` | ⬜ Future | —       | —              | —        | `book-architect`, `research-assistant` | Guides chapter-by-chapter drafting. Coaches, does not ghostwrite. |

---

### Phase 6: Editing Pipeline

| Skill                  | Status    | Version | Date Completed | Location | Dependencies           | Notes/Blockers                                       |
| ---------------------- | --------- | ------- | -------------- | -------- | ---------------------- | ---------------------------------------------------- |
| `developmental-editor` | ⬜ Future | —       | —              | —        | `draft-coach`          | Big-picture edit: structure, argument, content gaps. |
| `line-editor`          | ⬜ Future | —       | —              | —        | `developmental-editor` | Sentence-level edit: style, voice, flow, clarity.    |
| `copy-editor`          | ⬜ Future | —       | —              | —        | `line-editor`          | Technical edit: grammar, punctuation, Chicago style. |
| `fact-checker`         | ⬜ Future | —       | —              | —        | `copy-editor`          | Verify all claims, statistics, quotes, citations.    |
| `proofreader`          | ⬜ Future | —       | —              | —        | `fact-checker`         | Final quality check before publication.              |

---

### Phase 7: Production

| Skill     | Status    | Version | Date Completed | Location | Dependencies  | Notes/Blockers                                          |
| --------- | --------- | ------- | -------------- | -------- | ------------- | ------------------------------------------------------- |
| `indexer` | ⬜ Future | —       | —              | —        | `proofreader` | Create back-of-book index. Requires final page numbers. |

---

## Build Priority Queue

Recommended order for building remaining skills:

| Priority    | Skill                  | Rationale                                               |
| ----------- | ---------------------- | ------------------------------------------------------- |
| 🔜 **Next** | `idea-validator`       | Validates ideas before heavy investment in architecture |
| 2           | `market-research`      | KDP viability check completes the Go/No-Go gate         |
| 3           | `book-architect`       | Critical bottleneck—structure determines everything     |
| 4           | `research-assistant`   | Fills gaps identified during architecture               |
| 5           | `draft-coach`          | Guides actual writing                                   |
| 6           | `developmental-editor` | First editing pass                                      |
| 7           | `line-editor`          | Sentence-level polish                                   |
| 8           | `copy-editor`          | Technical cleanup                                       |
| 9           | `fact-checker`         | Accuracy verification                                   |
| 10          | `proofreader`          | Final check                                             |
| 11          | `indexer`              | Production (if needed)                                  |

---

## Test Projects

Projects used to test and validate skills:

| Project                 | Stage                      | Used to Test              | Notes                                                                      |
| ----------------------- | -------------------------- | ------------------------- | -------------------------------------------------------------------------- |
| **Thinking with Paper** | Architecture (30 chapters) | Validation benchmark      | Already well-developed; useful for testing if skills surface same elements |
| **A Critique of Truth** | Seed/Early ideation        | `book-ideation` real test | Less developed; true test of skill's ability to develop concepts           |
| **Recovering Thinking** | Concept outline            | Future testing            |                                                                            |
| **The Ancient Paths**   | Detailed outline           | Future testing            | Overlaps with Thinking with Paper                                          |

---

## Version History

| Date       | Changes                                                                    |
| ---------- | -------------------------------------------------------------------------- |
| 2024-12-29 | Initial tracker created. `brainstorm` and `book-ideation` marked complete. |

---

## Notes & Decisions Log

| Date       | Decision/Note                                                                                                                                       |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| 2024-12-29 | Decided to split research into two skills: `idea-validator` (pre-architecture validation) and `research-assistant` (post-architecture gap-filling). |
| 2024-12-29 | Confirmed nonfiction-only scope for entire factory.                                                                                                 |
| 2024-12-29 | Editing skills will include high-level descriptions in reference doc; detailed design happens when building each skill.                             |

---

_Update this tracker as skills are built, tested, and refined._
