# Correction Record

<!--
ABOUT THIS TEMPLATE:
This template helps you give Claude feedback in a form it can learn from.
"That's wrong" doesn't help. A structured correction does.

When you fill this out, you're not just fixing one mistake — you're creating
a pattern Claude can apply to future situations.

USE THIS WHEN:
- Claude made a mistake you want it to learn from
- You want to establish a pattern for this project
- Claude keeps making the same type of error
- You want to document corrections for future sessions

HOW IT WORKS:
- Fill out the correction
- Save it somewhere Claude will see it (project root, .cortex/corrections/, etc.)
- Reference it in your CLAUDE.md: "See corrections/ for patterns to follow"
- Cortex V2 will automatically learn from these

WHY STRUCTURE MATTERS:
- "What I did" helps Claude identify the specific behavior
- "What was wrong" clarifies the gap
- "What you wanted" shows the correct behavior
- "Why" helps Claude generalize to similar situations
- "Pattern" becomes a rule for the future
-->

## Correction: {{BRIEF_DESCRIPTION}}

**Date:** {{DATE}}
**Severity:** {{Minor / Significant / Critical}}
**Category:** {{Code style / Architecture / Communication / Process / Other}}

---

## What Happened

### What I Did

<!--
Be specific. Quote or describe exactly what Claude did.
-->

{{Describe or quote the specific action/output that was wrong}}

```
{{If code or text, paste the actual output here}}
```

### What Was Wrong

<!--
Explain the gap between what Claude did and what you wanted.
Not just "it was wrong" — WHY it was wrong.
-->

{{Explain what was incorrect, inappropriate, or missing}}

### What You Wanted Instead

<!--
Show the correct behavior. Be as specific as possible.
-->

{{Describe or show what the correct action/output would have been}}

```
{{If code or text, show the correct version here}}
```

---

## The Learning

### Why This Matters

<!--
Help Claude understand the reasoning. This enables generalization.
-->

{{Explain why the correct behavior is better — what principle does it serve?}}

### Pattern to Remember

<!--
Distill this into a rule Claude can apply in the future.
This is the most important part for learning.
-->

**When:** {{Situation or trigger}}
**Do:** {{Correct behavior}}
**Don't:** {{Incorrect behavior to avoid}}
**Because:** {{Reasoning}}

### Applies To

<!--
Help Claude understand the scope. When does this pattern apply?
-->

**This pattern applies when:**
- {{Condition 1}}
- {{Condition 2}}

**This pattern does NOT apply when:**
- {{Exception 1}}
- {{Exception 2}}

---

## Context

### Why It Happened

<!--
Optional but helpful. Understanding the root cause helps prevent recurrence.
-->

{{Why might Claude have made this mistake? Missing context? Wrong assumption?}}

### What Would Have Helped

<!--
What could have prevented this? Better instructions? Different context?
This helps improve prompts and documentation.
-->

{{What information or instruction would have led to the correct behavior?}}

---

## Verification

### How to Check

<!--
How can Claude verify it's following this pattern correctly in the future?
-->

{{Question Claude should ask itself, or check it should perform}}

### Example of Correct Behavior

<!--
Another example reinforces the learning.
-->

**Situation:** {{Similar scenario}}
**Correct response:** {{What Claude should do}}

---

## Meta

**Related patterns:** {{Other correction records or patterns this connects to}}

**Added to CLAUDE.md:** Yes / No
{{If yes, what section?}}

**Recurring issue:** Yes / No
{{If yes, how many times has this happened?}}

---

<!--
CORRECTION QUALITY CHECKLIST:

Before saving this correction, verify:
[ ] The specific behavior is clearly described
[ ] The reasoning (why) is explained, not just the what
[ ] The pattern is generalizable to similar situations
[ ] The scope (when to apply) is clear
[ ] An example of correct behavior is included

The test: Could Claude read this and correctly handle a similar
situation in the future, without making the same mistake?
-->

---

## Quick Correction Format

<!--
For minor corrections that don't need the full template, use this abbreviated format:
-->

```markdown
**Correction:** {{One-line description}}
**Wrong:** {{What Claude did}}
**Right:** {{What you wanted}}
**Pattern:** When {{situation}}, do {{correct behavior}} because {{reason}}.
```

---

*Correction recorded: {{TIMESTAMP}}*
