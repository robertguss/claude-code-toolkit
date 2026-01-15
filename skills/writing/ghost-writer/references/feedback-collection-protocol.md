# Feedback Collection Protocol

How to gather structured feedback and translate it into DNA document refinements.

---

## Purpose

Feedback serves two goals:

1. **Improve the current drafts** — Fix what didn't work for this piece
2. **Improve the DNA document** — Make future drafts more accurate

This protocol ensures you capture both effectively.

---

## When to Collect Feedback

### Primary Feedback Point

After delivering drafts and before iteration:

> "Before we revise, I'd like to capture what worked and what didn't..."

### Secondary Feedback Points

- After each iteration round
- When the user signals completion: "Good enough, I'll take it from here"
- If the session is ending without iteration

---

## The Structured Questions

Ask these three questions:

### Question 1: What Worked

> "What felt most authentically 'you' in these drafts?"

**Listen for:**

- Specific lines or passages
- Patterns that felt right
- Tone confirmations
- "You nailed the..." statements

**What it tells you:**

- Patterns to reinforce in iteration
- DNA document patterns that are accurately captured
- High-confidence areas

### Question 2: What Didn't Work

> "Anything that felt off or not quite your voice?"

**Listen for:**

- Specific lines that felt wrong
- "I'd never say it that way"
- Tone mismatches
- Word choice objections
- Structure complaints

**What it tells you:**

- Anti-patterns to avoid
- DNA document gaps
- Misunderstandings to correct

### Question 3: Pattern Guidance

> "Any patterns I should lean into more, or avoid going forward?"

**Listen for:**

- Explicit instructions for future
- Preferences becoming clear
- "More of this, less of that"
- New information not in DNA document

**What it tells you:**

- DNA document updates needed
- Adjustments for iteration
- New patterns to capture

---

## Asking Follow-Up Questions

### If Feedback Is Vague

**User says:** "It felt a little off"

**Follow up:** "Can you point to specific lines or sections? Was it the word choice, tone, structure, or something else?"

### If Feedback Is About One Draft

**User says:** "Draft A was better"

**Follow up:** "What made A feel more like you? Anything from B worth preserving?"

### If Feedback Is Contradictory

**User says:** "It was too casual but also too stiff"

**Follow up:** "Can you help me understand—which parts felt too casual, and which too stiff? Different sections, maybe?"

### If Feedback Introduces New Information

**User says:** "I never use exclamation points"

**Follow up:** "Good to know—I don't think that's in your DNA document. Noted for this piece and suggesting we add it to your profile."

---

## Mapping Feedback to Categories

| Feedback Type                        | Example                | Category                    |
| ------------------------------------ | ---------------------- | --------------------------- |
| "That line was perfect"              | Positive specific      | Pattern confirmation        |
| "That whole section felt like me"    | Positive general       | Tone/structure confirmation |
| "I'd never use that word"            | Negative specific      | Word anti-pattern           |
| "The opening felt forced"            | Negative structural    | Opening style gap           |
| "Too formal"                         | Negative tone          | Temperature mismatch        |
| "More of the short punchy sentences" | Directive              | Pattern reinforcement       |
| "Less hedging language"              | Directive              | Anti-pattern addition       |
| "You captured my humor perfectly"    | Dimension confirmation | Humor approach validated    |

---

## Translating Feedback to DNA Refinements

### Step 1: Identify the Update Type

| Feedback               | DNA Update Type                 |
| ---------------------- | ------------------------------- |
| Word to avoid          | Add to Anti-Patterns table      |
| Pattern to avoid       | Add to "Don't Do This"          |
| Pattern that worked    | Note in Voice Profile dimension |
| Missing pattern        | Add to "Do This" or dimension   |
| Decision rule revealed | Add to "When Uncertain"         |
| Tone guidance          | Adjust Tone & Attitude section  |

### Step 2: Draft the Refinement Suggestions

Use this format:

```markdown
## Suggested DNA Refinements

Based on your feedback, consider these updates to your Voice DNA Document:

**Add to Anti-Patterns:**

- "[specific pattern]" — [why it doesn't fit, based on feedback]

**Strengthen in Voice Profile:**

- [Dimension name]: [what to add or emphasize]

**Add to "Do This":**

- [specific instruction derived from feedback]

**Add to "Don't Do This":**

- [specific avoidance derived from feedback]

**Add to "When Uncertain":**

- [decision rule that emerged from feedback]

You can apply these yourself or run a refinement session with the writing-dna-discovery skill.
```

### Step 3: Be Specific and Actionable

**Not this:**

> "Update word choice section"

**This:**

> "Add to Anti-Patterns: 'utilize' — you noted 'I always say use, never utilize'"

**Not this:**

> "Adjust tone"

**This:**

> "Strengthen in Tone & Attitude: Add that you prefer 'direct assertion over hedging' — when I hedged in paragraph 3, you flagged it as 'not you'"

---

## Refinement Examples

### Example 1: Word Anti-Pattern

**Feedback:** "I'd never say 'leverage'—that's corporate speak"

**Refinement:**

> **Add to Anti-Patterns:**
>
> - "leverage" — corporate jargon; use "use" or specific alternatives

### Example 2: Structural Pattern

**Feedback:** "I don't start pieces with questions—that's clickbait"

**Refinement:**

> **Add to "Don't Do This":**
>
> - Don't open with rhetorical questions—feels clickbait
>
> **Strengthen in Opening & Closing:**
>
> - Add: "Avoids question openings; prefers statement hooks or scene-setting"

### Example 3: Tone Adjustment

**Feedback:** "Draft B was closer but still too measured—I'm more assertive than that"

**Refinement:**

> **Strengthen in Tone & Attitude:**
>
> - Confidence Style: Shift from "measured" to "directly assertive"
> - Add: "Rarely hedges; makes claims confidently"
>
> **Add to "When Uncertain":**
>
> - When in doubt, assert rather than hedge

### Example 4: Missing Pattern Discovered

**Feedback:** "You know what I do that you missed? I always end paragraphs with short sentences"

**Refinement:**

> **Add to "Do This":**
>
> - End paragraphs with short, punchy sentences
>
> **Strengthen in Paragraph & Structure:**
>
> - Add: "Paragraph endings are typically short sentences that land with weight"

---

## Handling Edge Cases

### Contradictory Feedback

If feedback contradicts the DNA document:

1. Note the contradiction
2. Ask for clarification: "Your DNA document says X, but you're saying Y—has this changed, or is it context-specific?"
3. Suggest a refinement that clarifies

### Feedback Outside Voice Scope

If feedback is about content, not voice:

- Acknowledge it
- Apply it to iteration
- Don't add it to DNA refinements (it's task-specific, not voice-specific)

### Implicit Feedback

If user just makes edits without explaining:

- "I noticed you changed [X] to [Y]—is that a pattern I should follow generally, or specific to this piece?"

### Feedback That Reveals DNA Error

If feedback shows the DNA document is wrong:

> "It sounds like the DNA document may have this backwards. Should I suggest updating [dimension] to reflect what you're telling me now?"

---

## Refinement Suggestion Format

### Complete Template

```markdown
## Suggested DNA Refinements

Based on your feedback, consider these updates to your Voice DNA Document:

### Add to Anti-Patterns

| Pattern to Avoid | Why It's Wrong for You    |
| ---------------- | ------------------------- |
| [pattern]        | [reasoning from feedback] |

### Strengthen in Voice Profile

**[Dimension Name]:**

- Current status: [if known]
- Suggested addition: [specific pattern or note]
- Reasoning: [what feedback revealed this]

### Update Ghost Writer Briefing

**Add to "Do This":**

- [instruction]

**Add to "Don't Do This":**

- [avoidance]

**Add to "When Uncertain":**

- [decision rule]

### Other Adjustments

[Any other DNA updates not fitting above categories]

---

You can apply these yourself or run a refinement session with the writing-dna-discovery skill.
```

---

## Quick Feedback Collection

If time is short or user is done:

> "Quick check before you go:
>
> 1. Anything to definitely avoid next time?
> 2. Anything I nailed that I should keep doing?
>
> I'll note these for your DNA document."

---

## After Feedback Collection

### If Iterating

Apply feedback to revisions immediately:

- Avoid the patterns they flagged
- Lean into what worked
- Ask if specific changes address their concerns

### If Session Ending

1. Deliver DNA refinement suggestions
2. Summarize what you learned
3. Offer: "Run a Writing DNA Discovery refinement session to formalize these updates?"

---

## Key Principles

1. **Listen for specifics** — Vague feedback needs follow-up
2. **Map to DNA structure** — Every insight should have a home
3. **Be concrete** — Refinement suggestions should be copy-pasteable
4. **Capture reasoning** — Future sessions benefit from "why"
5. **Distinguish voice from content** — Only voice feedback becomes DNA updates
