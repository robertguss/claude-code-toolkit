# CLAUDE.md

<!--
ABOUT THIS TEMPLATE:
This template helps you create a CLAUDE.md file that genuinely serves Claude Code.
Each section includes a <!-- WHY: ... --> comment explaining why Claude needs this information.
Remove these comments when you adapt this template for your project.

For deeper reasoning, see CLAUDE-MD-GUIDE.md in this directory.
-->

This file provides guidance to Claude Code when working with this repository.

## What is {{PROJECT_NAME}}?

<!--
WHY: Claude needs to understand PURPOSE, not just mechanics. When I know WHY a project
exists, I make better decisions about how to extend it. The problem/solution framing
helps me understand what success looks like.
-->

**Problem:** {{Describe the problem this project solves}}

**Solution:** {{Describe how this project solves it}}

**For:** {{Who is this built for? Be specific.}}

## Quick Start

<!--
WHY: I need to be immediately actionable. When I join a project, the first thing I
want to do is build it, run it, and verify it works. Put these commands FIRST,
not buried under architecture explanations.
-->

```bash
# Build
{{build command}}

# Test
{{test command}}

# Run
{{run command}}

# Development
{{watch/dev command if applicable}}
```

## Current State

<!--
WHY: Knowing WHERE the project is in its lifecycle prevents me from making decisions
that conflict with ongoing work. If V2 is in progress, I shouldn't make V1-style
decisions. If a refactor is planned, I shouldn't entrench old patterns.
-->

| Milestone | Status | Details |
|-----------|--------|---------|
| {{Milestone 1}} | {{Status}} | {{Brief details}} |
| {{Milestone 2}} | {{Status}} | {{Brief details}} |

**Active development:** {{Where is current work happening?}}

**Test coverage:** {{Current coverage if tracked}}

## Architecture

<!--
WHY: I need a MENTAL MODEL of how the code is organized. But more importantly,
I need to understand WHY it's organized this way. When I understand the reasoning,
I can extend the architecture consistently rather than fighting against it.
-->

### Why This Structure

```
{{Layer 1}}    → {{path/}}    {{Brief description}} (WHY: {{reasoning}})
{{Layer 2}}    → {{path/}}    {{Brief description}} (WHY: {{reasoning}})
{{Layer 3}}    → {{path/}}    {{Brief description}} (WHY: {{reasoning}})
```

### Key Flow

<!--
WHY: Seeing how a typical operation flows through the system helps me understand
the intended patterns. Pick your most representative operation and trace it.
-->

```
{{command/action}}
  → {{step 1}}
  → {{step 2}}
  → {{step 3}}
  → {{output}}
```

## Key Decisions & Rationale

<!--
WHY: This is perhaps the MOST VALUABLE section. Every decision you've made shapes
future decisions. When I understand WHY you chose X over Y, I can make consistent
choices when faced with similar trade-offs. Without this, I might accidentally
contradict your established patterns.
-->

| Decision | Why | Outcome |
|----------|-----|---------|
| **{{Decision 1}}** | {{Reasoning}} | {{Good/Bad/TBD}} |
| **{{Decision 2}}** | {{Reasoning}} | {{Good/Bad/TBD}} |
| **{{Decision 3}}** | {{Reasoning}} | {{Good/Bad/TBD}} |

## Common Tasks

<!--
WHY: Recipes with EXEMPLARS are far more valuable than abstract descriptions.
When you tell me "for a good example, see X", I can pattern-match against real
code in your codebase. This is faster and more accurate than inferring patterns.
-->

### {{Task 1: e.g., Adding a Feature}}

> **Exemplar:** `{{path/to/good/example}}` — {{why this is a good example}}

1. {{Step 1}}
2. {{Step 2}}
3. {{Step 3}}

### {{Task 2: e.g., Adding a Test}}

> **Exemplar:** `{{path/to/good/example}}`

1. {{Step 1}}
2. {{Step 2}}
3. {{Step 3}}

## Testing

<!--
WHY: Understanding your testing PHILOSOPHY helps me write tests that fit your
codebase. Are you aiming for 80% coverage or 95%? Do you prefer unit tests or
integration tests? Do you use mocks or real implementations? These choices
affect every test I write.
-->

### Philosophy

- **Coverage target:** {{e.g., 80% — not 90%+ due to diminishing returns}}
- **Test style:** {{e.g., Table-driven tests, BDD, etc.}}
- **Mocking approach:** {{e.g., Real implementations preferred, mocks for external services}}

### Exemplary Test Files

| File | What it demonstrates |
|------|---------------------|
| `{{path/to/test}}` | {{What pattern it shows}} |
| `{{path/to/test}}` | {{What pattern it shows}} |

### Running Tests

```bash
{{test commands with explanations}}
```

## Constraints & Anti-patterns

<!--
WHY: Knowing what NOT to do is often more valuable than knowing what to do.
Constraints shape every decision. Anti-patterns prevent me from repeating
mistakes that have already been made in this codebase.
-->

### Constraints

- **{{Constraint 1}}** — {{why this constraint exists}}
- **{{Constraint 2}}** — {{why this constraint exists}}
- **{{Constraint 3}}** — {{why this constraint exists}}

### Anti-patterns to Avoid

- **Don't {{anti-pattern 1}}** — {{what to do instead}}
- **Don't {{anti-pattern 2}}** — {{what to do instead}}
- **Don't {{anti-pattern 3}}** — {{what to do instead}}

### Questions to Ask Before Writing Code

<!--
WHY: These meta-questions help me self-check before I start coding.
They encode your project's values and patterns in a way I can apply.
-->

1. {{Question 1, e.g., "Does this follow our established patterns?"}}
2. {{Question 2, e.g., "Is there an existing abstraction I should use?"}}
3. {{Question 3, e.g., "How will I test this?"}}

## Data / File Structure

<!--
WHY: Understanding where things live helps me navigate quickly and put new
things in the right place. Include both the structure AND what each part is for.
-->

```
{{project_root}}/
├── {{dir1}}/              # {{purpose}}
│   ├── {{subdir}}/        # {{purpose}}
│   └── {{file}}           # {{purpose}}
├── {{dir2}}/              # {{purpose}}
└── {{config_file}}        # {{purpose}}
```

## References

<!--
WHY: I often need deeper context than a CLAUDE.md can provide. Pointing me to
design docs, decision records, or specs helps me understand the full picture
when I need it.
-->

| Document | Purpose |
|----------|---------|
| `{{path/to/doc}}` | {{What it contains}} |
| `{{path/to/doc}}` | {{What it contains}} |

---

<!--
OPTIONAL SECTIONS (add if relevant to your project):

## Working with {{Tool Name}}
If your project IS a tool that Claude should use, include guidance on WHEN and HOW
to use it. See Cortex's CLAUDE.md for an example of this self-referential pattern.

## API Reference
For libraries/APIs, a quick reference to the most important functions/endpoints.

## Debugging
How to trace issues, where logs go, common problems and solutions.

## Environment Setup
If there are environment variables, API keys, or setup steps required.
-->
