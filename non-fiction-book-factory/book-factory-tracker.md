# The Book Factory: Project Tracker

**Purpose:** Track the development status of all skills in the Book Factory pipeline.

**Last Updated:** December 30, 2025

---

## Quick Status Overview

| Phase                  | Skills | Status         |
| ---------------------- | ------ | -------------- |
| Phase 0: Raw Ideation  | 1      | ✅ Complete    |
| Phase 1: Book Concept  | 1      | ✅ Complete    |
| Phase 2: Validation    | 2      | ⬜ Not Started |
| Phase 3: Architecture  | 1      | ⬜ Not Started |
| Phase 4: Deep Research | 1      | ⬜ Not Started |
| Phase 5: Drafting      | 2      | 🟡 In Progress |
| Phase 6: Editing       | 5      | ⬜ Not Started |
| Phase 7: Production    | 1      | ⬜ Not Started |
| **Total**              | **14** | **3 Complete** |

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

| Skill            | Status  | Version | Date Completed | Location | Dependencies                                         | Notes/Blockers                                                 |
| ---------------- | ------- | ------- | -------------- | -------- | ---------------------------------------------------- | -------------------------------------------------------------- |
| `book-architect` | ✅ Done | —       | —              | —        | `book-ideation`, `idea-validator`, `market-research` | Designs reader journey, chapter blueprint, TOC. Multi-session. |

---

### Phase 4: Deep Research

| Skill                | Status  | Version | Date Completed | Location | Dependencies     | Notes/Blockers                                                       |
| -------------------- | ------- | ------- | -------------- | -------- | ---------------- | -------------------------------------------------------------------- |
| `research-assistant` | ✅ Done | —       | —              | —        | `book-architect` | Fills gaps from Architecture Document. Distinct from idea-validator. |

---

### Phase 5: Drafting

| Skill               | Status    | Version | Date Completed | Location                           | Dependencies                           | Notes/Blockers                                                                               |
| ------------------- | --------- | ------- | -------------- | ---------------------------------- | -------------------------------------- | -------------------------------------------------------------------------------------------- |
| `chapter-architect` | ✅ Done   | v1      | 2025-12-30     | `claude-skills/chapter-architect/` | `book-architect`, `research-assistant` | Beat-level chapter outlining. Produces Chapter Outline Document for ghostwriter/draft-coach. |
| `draft-coach`       | ⬜ Future | —       | —              | —                                  | `chapter-architect`                    | Guides chapter-by-chapter drafting. Dual-mode: coaching or ghostwriting.                     |

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

| Priority    | Skill                  | Rationale                    |
| ----------- | ---------------------- | ---------------------------- |
| 🔜 **Next** | `draft-coach`          | Completes the drafting phase |
| 2           | `developmental-editor` | First editing pass           |
| 3           | `line-editor`          | Sentence-level polish        |
| 4           | `copy-editor`          | Technical cleanup            |
| 5           | `fact-checker`         | Accuracy verification        |
| 6           | `proofreader`          | Final check                  |
| 7           | `indexer`              | Production (if needed)       |

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
| 2025-12-30 | Added `chapter-architect` skill to Phase 5. Updated totals and priorities. |
| 2024-12-29 | Initial tracker created. `brainstorm` and `book-ideation` marked complete. |

---

## Notes & Decisions Log

| Date       | Decision/Note                                                                                                                                                                                                      |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 2025-12-30 | Added `chapter-architect` as new skill in Phase 5, before `draft-coach`. Produces beat-level chapter outlines. `draft-coach` now depends on `chapter-architect` and supports dual-mode (coaching or ghostwriting). |
| 2024-12-29 | Decided to split research into two skills: `idea-validator` (pre-architecture validation) and `research-assistant` (post-architecture gap-filling).                                                                |
| 2024-12-29 | Confirmed nonfiction-only scope for entire factory.                                                                                                                                                                |
| 2024-12-29 | Editing skills will include high-level descriptions in reference doc; detailed design happens when building each skill.                                                                                            |

---

_Update this tracker as skills are built, tested, and refined._
