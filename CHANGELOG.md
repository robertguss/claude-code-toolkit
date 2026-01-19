# Changelog

All notable changes to this project are documented in this file.

## [Unreleased]

### Added
- Documentation improvements with LICENSE.md, CONTRIBUTING.md, and CHANGELOG.md
- Skill connections guide explaining how skills work together

## [2026-01-18] - Compound Writing Plugin

### Added
- **compound-writing plugin** — Complete writing system with:
  - 6 specialized agents (clarity-editor, fact-checker, publishing-optimizer, researcher, structure-architect, voice-guardian)
  - 4 workflow commands (plan, draft, review, compound)
  - 5 writing skills (dhh-writing, every-style-editor, pragmatic-writing, voice-capture, writing-orchestration)
  - Pattern capture system for learning from successful writing

## [2026-01-15] - Toolkit Restructure

### Changed
- **Major restructure** — Rebranded from "Claude Skills" to "Claude Code Toolkit"
- Reorganized all skills into `skills/` directory
- Created `hooks/` directory for event handlers
- Created `templates/` directory for configuration templates

### Added
- **handoff skill** — Session continuity documents for context preservation
- **Templates collection** — HUMAN.md, CLAUDE.md guides, compaction strategy, prompt guides
- Expanded template documentation

## [2026-01-10] - Code Documenter

### Added
- **code-documenter skill** — Intelligent documentation generation with:
  - Multi-agent analysis
  - Documentation health scoring
  - Architecture Decision Records (ADRs)
  - Quality gates throughout generation

## [2026-01-03] - Documentation Site

### Added
- **MkDocs documentation site** with Material theme
- GitHub Pages deployment via GitHub Actions
- Developer guide, concept documentation, skill catalog
- Getting started tutorials

### Changed
- Restored build.py packaging system
- Switched to uv package manager

## [2025-12-31] - Writing Skills

### Added
- **ebook-factory** — Focused ebook creation pipeline
- **non-fiction-book-factory** — Full pipeline from idea to chapter architecture
- **writing** — Voice capture and ghost writing
- **skill-creator** — Tool for creating new skills

### Changed
- Integrated multiple writing-focused PRs (#1, #2, #3)

## [2025-12-29] - Initial Release

### Added
- **brainstorm skill** — Multi-session ideation partner with 25+ brainstorming methods
- Basic project structure
- Initial build system for skill packaging
