# {{SKILL_NAME}}

<!--
ABOUT THIS TEMPLATE:
This template helps you write skills (slash commands) that Claude can execute effectively.
A well-structured skill is the difference between Claude guessing at what you want and
Claude executing precisely what you need.

Skills are markdown files that Claude reads and follows as instructions.
Place skills in your project's skills/ directory or ~/.claude/skills/ for global skills.

WHY STRUCTURE MATTERS:
- Purpose tells Claude WHAT this skill is for (so it can decide when to use it)
- When to Use tells Claude WHEN to invoke it (triggers and contexts)
- Inputs tell Claude WHAT it needs from the user
- Process tells Claude HOW to execute step-by-step
- Outputs tell Claude WHAT to produce
- Constraints tell Claude what NOT to do
- Success Criteria tell Claude HOW to know it did it right
- Examples show Claude WHAT good execution looks like

Remove these HTML comments when your skill is ready for use.
-->

## Purpose

<!--
WHY THIS MATTERS: Claude uses this to understand what the skill accomplishes and
decide if it's the right tool for the situation. Be specific about the outcome.
-->

{{One sentence describing what this skill does and what outcome it produces}}

## When to Use

<!--
WHY THIS MATTERS: Claude needs to know when to invoke this skill. Include both
explicit triggers (slash command) and contextual triggers (situations where this
skill is appropriate even if not explicitly invoked).
-->

**Invoke explicitly:** `/{{skill-name}}` or when user asks to {{action}}

**Invoke contextually when:**
- {{Situation 1 where this skill applies}}
- {{Situation 2 where this skill applies}}

**Do NOT use when:**
- {{Situation where this skill is wrong choice}}

## Inputs

<!--
WHY THIS MATTERS: Claude needs to know what information it requires before
executing. Be clear about what's required vs optional, and what defaults to use.
-->

| Input | Required | Description | Default |
|-------|----------|-------------|---------|
| {{input_name}} | Yes/No | {{What this input is for}} | {{Default if optional}} |

**How to gather inputs:**
- {{How Claude should get required inputs — ask user? Infer from context?}}

## Process

<!--
WHY THIS MATTERS: This is the step-by-step execution guide. Claude follows these
instructions literally. Be explicit about the order, conditions, and actions.
-->

### Step 1: {{Step Name}}

{{Detailed instructions for this step}}

**If {{condition}}:** {{what to do}}
**Otherwise:** {{what to do}}

### Step 2: {{Step Name}}

{{Detailed instructions for this step}}

### Step 3: {{Step Name}}

{{Detailed instructions for this step}}

<!--
Continue with as many steps as needed. Be specific. Include:
- What tools to use (Bash, Read, Write, etc.)
- What to do with the results
- How to handle errors
- When to proceed vs stop and ask
-->

## Outputs

<!--
WHY THIS MATTERS: Claude needs to know what to produce at the end. Be specific
about format, content, and delivery.
-->

**Primary output:** {{What Claude produces — file, response, action, etc.}}

**Format:** {{Specific format requirements}}

**Deliver by:** {{How to give it to the user — create file, display in chat, etc.}}

## Constraints

<!--
WHY THIS MATTERS: Explicit constraints prevent Claude from making mistakes.
These are guardrails that keep the skill safe and scoped.
-->

**Must:**
- {{Hard requirement 1}}
- {{Hard requirement 2}}

**Must NOT:**
- {{Prohibited action 1}}
- {{Prohibited action 2}}

**Stop and ask if:**
- {{Condition where Claude should pause and confirm with user}}

## Success Criteria

<!--
WHY THIS MATTERS: Claude uses these to verify it executed the skill correctly.
Think of these as the acceptance tests for the skill.
-->

The skill succeeded if:
- [ ] {{Criterion 1 — something verifiable}}
- [ ] {{Criterion 2 — something verifiable}}
- [ ] {{Criterion 3 — something verifiable}}

## Examples

<!--
WHY THIS MATTERS: Examples are extremely valuable. They show Claude what good
execution looks like in practice. Include at least one complete example.
-->

### Example 1: {{Scenario Name}}

**User invokes:** `/{{skill-name}} {{example args}}`

**Context:** {{Relevant context for this example}}

**Claude executes:**
```
{{Step-by-step what Claude does}}
```

**Result:**
```
{{What the output looks like}}
```

### Example 2: {{Edge Case or Variation}}

**User invokes:** {{How invoked}}

**Context:** {{Context}}

**Claude executes:**
```
{{What Claude does differently in this case}}
```

---

## Skill Metadata

<!--
Optional metadata that helps with skill organization and discovery.
-->

**Category:** {{Category — e.g., git, testing, documentation, refactoring}}

**Complexity:** {{Simple / Medium / Complex}}

**Requires tools:** {{List of tools this skill uses — Bash, Read, Write, etc.}}

**Related skills:** {{Other skills that work well with this one}}

---

<!--
SKILL WRITING TIPS:

1. Be explicit, not implicit
   Bad: "Update the file appropriately"
   Good: "Add a new entry to the CHANGELOG.md file under the '## Unreleased' section"

2. Handle edge cases
   What if the file doesn't exist? What if the input is invalid?
   Tell Claude what to do in these situations.

3. Include error handling
   "If the command fails, report the error and stop — do not continue."

4. Scope appropriately
   A skill should do one thing well. If it's doing too much, split it into multiple skills.

5. Test your skill
   Run it in multiple scenarios. See where Claude gets confused. Clarify those parts.

6. Examples are powerful
   When in doubt, add another example. Claude learns from examples.
-->
