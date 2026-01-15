# CLAUDE.md Guide

A deep explanation of what Claude Code needs to perform at its best, and why.

## What This Document Is

This guide explains the reasoning behind the CLAUDE.md template. While the template shows you WHAT to include, this guide explains WHY each piece matters.

Understanding the "why" helps you:

- Adapt the template intelligently for your specific project
- Know what to prioritize when time is limited
- Avoid cargo-culting structure without understanding purpose

## How Claude Processes Context

When Claude encounters a new codebase, several things happen:

1. **Orientation** — What is this? Why does it exist?
2. **Capability check** — Can I build it? Run it? Test it?
3. **Mental model formation** — How is it organized? What patterns does it follow?
4. **Constraint recognition** — What are the boundaries I need to work within?

A good CLAUDE.md accelerates ALL of these. A poor one (or none at all) means Claude spends tokens figuring out basics instead of solving your actual problem.

## Section-by-Section Deep Dive

### 1. Project Identity (What is X?)

**What Claude needs:** Purpose, not just mechanics.

**Why it matters:**
When I understand WHY a project exists, I make better decisions about HOW to extend it. If I know "this project prioritizes simplicity over features," I won't propose complex solutions. If I know "this is built for enterprise users," I'll consider security and compliance.

**Common mistakes:**

- Just describing what the code does, not why it exists
- Skipping the "For:" section — knowing the audience shapes every decision
- Being vague ("a useful tool") instead of specific ("solves X for Y people")

**Good example:**

```
Problem: Claude has no persistent memory between contexts.
Solution: Cognitive infrastructure for session continuity.
For: Developers using Claude Code who want better collaboration.
```

**Weak example:**

```
A CLI tool written in Go.
```

---

### 2. Quick Start

**What Claude needs:** Immediate actionability.

**Why it matters:**
The first thing I want to do is verify I can build and run the project. If I can't do that, I can't verify my changes work. Put this early — don't bury it under architecture explanations.

**Common mistakes:**

- Assuming Claude knows your build system
- Putting quick start after architecture (wrong priority order)
- Including only build, not test and run commands
- Not showing how to run a specific test (crucial for debugging)

**Good example:**

```bash
just build           # Build binary
just test            # Run all tests
just test-one Name   # Run specific test
just run start       # Run without building
```

**Weak example:**

```
See the Makefile for build commands.
```

---

### 3. Current State

**What Claude needs:** Where the project IS in its journey.

**Why it matters:**
If V2 is in progress, I shouldn't make V1-style decisions. If a major refactor is planned, I shouldn't entrench old patterns. Knowing the current state prevents me from accidentally working against the project's direction.

**Common mistakes:**

- Not including this section at all (very common)
- Being vague ("we're working on improvements")
- Not indicating where active development is happening

**Good example:**

```
| Milestone | Status | Details |
|-----------|--------|---------|
| V1.0 MVP | Shipped | Core features complete |
| V2.0 | In Progress | Phase 9 of 20 |

Active development: internal/database/ — SQLite migration
```

**Weak example:**

```
The project is under active development.
```

---

### 4. Architecture (with WHY)

**What Claude needs:** Mental model AND reasoning.

**Why it matters:**
I can follow patterns better when I understand them. "Keep CLI thin" is a rule I might accidentally violate. "Keep CLI thin BECAUSE business logic in services enables testing" is understanding I can extend.

**Common mistakes:**

- Listing directories without explaining purpose
- Showing structure without showing WHY it's structured that way
- Not including a representative flow example

**Good example:**

```
CLI Layer    → commands/   Thin wrappers (WHY: keeps business logic testable)
Service Layer → services/  Domain logic (WHY: separation of concerns, DI)
Storage Layer → storage/   Persistence (WHY: abstraction enables testing)
```

**Weak example:**

```
src/
  components/
  utils/
  pages/
```

---

### 5. Key Decisions & Rationale

**What Claude needs:** The distilled wisdom of the project.

**Why it matters:**
This is perhaps the MOST VALUABLE section. Every decision you've made shapes future decisions. When I understand WHY you chose Go over Rust, or SQLite over Postgres, I can make consistent choices when faced with similar trade-offs.

Without this, I might propose solutions that contradict your established patterns — not out of disagreement, but ignorance.

**Common mistakes:**

- Listing technologies without explaining why they were chosen
- Only documenting recent decisions, not foundational ones
- Not including decisions that CONSTRAIN (what you chose NOT to do)

**Good example:**
| Decision | Why | Outcome |
|----------|-----|---------|
| Go over Rust | Single binary, fast compile, future TUI | Good |
| SQLite over Postgres | Must remain single binary, no external deps | Good |
| No external dependencies | Users get zero-dependency install | Constraining but good |

**Weak example:**

```
We use Go, SQLite, and Cobra.
```

---

### 6. Common Tasks (with Exemplars)

**What Claude needs:** Recipes with pointers to real code.

**Why it matters:**
"For a good example, see X" is incredibly valuable. I learn patterns faster from examples than descriptions. When you point me to exemplary code, I can pattern-match against it rather than inferring patterns from scratch.

**Common mistakes:**

- Abstract descriptions without concrete examples
- Not pointing to specific files as exemplars
- Recipes that are too high-level to be actionable

**Good example:**

```
### Adding a Command

> **Exemplar:** `internal/commands/decide.go` — cleanest example of thin CLI pattern

1. Create `internal/commands/newcmd.go`
2. Wire to rootCmd in init()
3. Delegate ALL business logic to a service
4. Add tests in `newcmd_test.go`
```

**Weak example:**

```
To add a command, create a new file and add a Cobra command.
```

---

### 7. Testing

**What Claude needs:** Philosophy AND mechanics.

**Why it matters:**
Your testing philosophy affects every test I write. If you aim for 80% coverage, I won't obsess over edge cases. If you prefer integration tests over unit tests, I'll structure tests accordingly. If you use table-driven tests, I'll follow that pattern.

**Common mistakes:**

- Only showing how to run tests, not how to write them
- Not stating coverage targets or testing philosophy
- Not pointing to exemplary test files

**Good example:**

```
### Philosophy
- 80% coverage target (not 90%+ — diminishing returns)
- Table-driven tests for multiple scenarios
- Real implementations preferred over mocks

### Exemplary Test Files
| File | What it demonstrates |
|------|---------------------|
| decide_test.go | Table-driven tests, flag validation |
| start_test.go | Integration tests with setup helpers |
```

---

### 8. Constraints & Anti-patterns

**What Claude needs:** What NOT to do.

**Why it matters:**
Knowing what to avoid is often more valuable than knowing what to do. Constraints shape every decision. Anti-patterns prevent me from repeating mistakes.

**Common mistakes:**

- Only listing constraints, not explaining why they exist
- Not including anti-patterns at all
- Being too abstract ("write clean code")

**Good example:**

```
### Constraints
- Single binary — no external runtime dependencies (users get zero-dep install)
- Go 1.21+ — language floor for generics support

### Anti-patterns
- Don't put business logic in commands — keep CLI thin, use services
- Don't add dependencies without strong justification — each one is a liability
```

---

### 9. Questions to Ask Before Writing Code

**What Claude needs:** Meta-guidance for self-checking.

**Why it matters:**
These questions encode your project's values in a way I can apply. They're like a checklist that helps me catch issues before I propose solutions.

**Good example:**

```
1. Does this follow the services pattern?
2. Is there an existing abstraction I should use?
3. Will this work with both V1 and V2 storage?
4. How will I test this?
```

---

## Adapting for Different Project Types

### CLI Tools

- Emphasize command structure and extension patterns
- Include "Working with X" section if Claude should use the tool itself

### Web Applications

- Include API structure and routing patterns
- Document state management approach
- Include deployment/environment setup

### Libraries

- Focus on public API and extension points
- Include usage examples
- Document versioning/compatibility constraints

### Monorepos

- Document package boundaries
- Explain shared vs package-specific code
- Include cross-package dependency rules

---

## Priority Order (When Time is Limited)

If you can only write a few sections, prioritize in this order:

1. **Quick Start** — Claude must be able to build/run/test
2. **Key Decisions** — The "why" behind major choices
3. **Architecture** — Mental model of the code
4. **Common Tasks** — How to extend the project
5. **Current State** — Where the project is in its lifecycle

Everything else is valuable but less critical.

---

## Common Mistakes Summary

1. **Describing WHAT without WHY** — The reasoning matters more than the facts
2. **Being too abstract** — Specific file paths and examples beat vague descriptions
3. **Wrong priority order** — Quick Start should come before Architecture
4. **Missing Current State** — Claude needs to know where the project IS
5. **No exemplars** — "See X for a good example" is extremely valuable
6. **Constraints without reasoning** — WHY a constraint exists matters

---

## The Meta-Point

A CLAUDE.md isn't just documentation — it's a way of encoding your project's values, patterns, and accumulated wisdom in a form Claude can absorb quickly.

The goal isn't completeness. The goal is giving Claude what it needs to be an effective collaborator on YOUR specific project.

When in doubt, ask yourself: "If I were onboarding a senior developer who will never meet me, what would they need to know to make good decisions?"

That's what Claude needs too.
