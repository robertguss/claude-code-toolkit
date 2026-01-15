# Proof Burden Mapping

Different claims require different levels of evidence. A claim that's intuitively obvious needs almost none. A claim that contradicts the reader's deeply held beliefs needs overwhelming proof. Misjudging proof burden is a structural failure.

## The Core Principle

**Proof burden is proportional to claim difficulty.**

Difficulty comes from:

1. How counterintuitive the claim is
2. How much it contradicts existing beliefs
3. How threatening it is to the reader's identity
4. How much they have to lose if they accept it
5. How actionable the implication (higher stakes = higher burden)

---

## Proof Burden Levels

### Level 1: Assertion Sufficient

**Claim Type:** Obvious, aligns with reader's experience or common knowledge.

**What It Needs:** Clear statement. Maybe a brief example.

**Example Claims:**

- "Meetings waste a lot of time."
- "Most people struggle with focus."
- "Clear communication matters in relationships."

**Architectural Note:** Don't over-prove these. Over-evidencing obvious claims insults the reader's intelligence and wastes their time.

---

### Level 2: Light Evidence

**Claim Type:** Plausible but not universally held. Reader might nod but could question.

**What It Needs:** A supporting example, brief reference to research, or logical argument.

**Example Claims:**

- "Multitasking reduces productivity by roughly 40%."
- "First impressions form within seconds."
- "Companies with diverse leadership perform better."

**Architectural Note:** One good study or compelling example usually suffices. Don't stack evidence—it signals insecurity.

---

### Level 3: Substantial Evidence

**Claim Type:** Counterintuitive or challenges common practice. Reader's initial reaction is doubt.

**What It Needs:** Multiple sources, varied evidence types (study + example + logical argument), acknowledgment of complexity.

**Example Claims:**

- "More choices lead to less satisfaction."
- "Praise can undermine motivation."
- "Your intuitions about risk are systematically wrong."

**Architectural Note:** Build the case. Layer evidence. Acknowledge this goes against common belief. Give the reader time to adjust.

---

### Level 4: Heavy Evidence

**Claim Type:** Strongly counterintuitive, contradicts expert consensus, or challenges industry orthodoxy.

**What It Needs:** Extensive evidence from multiple sources, anticipation and response to objections, acknowledgment of limitations, credible authorities cited.

**Example Claims:**

- "The entire field of [X] is based on a flawed premise."
- "The standard advice about [Y] does more harm than good."
- "Everything you've been taught about [Z] is wrong."

**Architectural Note:** This is where books succeed or fail. If you can't meet the burden, soften the claim. Reader trust is at stake.

---

### Level 5: Extraordinary Evidence

**Claim Type:** Threatens reader's identity, professional practice, or worldview. Accepting it costs them something real.

**What It Needs:** Everything from Level 4, plus emotional safety, acknowledgment of the cost of acceptance, time and space to process.

**Example Claims:**

- "Your career has been built on a false premise."
- "The tools you've invested in are making you worse."
- "Your expertise may be holding you back."
- "What you believe about yourself isn't true."

**Architectural Note:** Evidence alone won't work. You need to create psychological safety. "This isn't your fault. The system was designed this way." Identity-threatening claims require emotional architecture, not just intellectual proof.

---

## Evidence Types

Different evidence serves different purposes. Mix them for strong proof:

### Empirical Evidence

- Research studies
- Statistics and data
- Experiments

**Strengths:** Objective, credible, hard to argue with.
**Limits:** Can feel cold, may not resonate emotionally.

### Case Studies / Examples

- Stories of specific instances
- Named individuals or companies
- Detailed narratives

**Strengths:** Memorable, relatable, bring ideas to life.
**Limits:** Cherry-picking concerns, "that's just one case."

### Logical Argument

- If A then B reasoning
- First principles analysis
- Logical implications

**Strengths:** Rigorous, can build from shared premises.
**Limits:** Abstract, requires reader to follow reasoning.

### Authority / Expert Testimony

- Quotes from recognized experts
- References to established authorities
- Endorsements

**Strengths:** Borrowed credibility, social proof.
**Limits:** Appeals to authority can backfire, experts can be wrong.

### Personal Experience

- Author's own story
- First-hand observation
- Lessons learned

**Strengths:** Authentic, vulnerable, builds connection.
**Limits:** "That's just you," limited generalizability.

### Analogies and Metaphors

- Comparison to familiar domains
- Mental models

**Strengths:** Make abstract concrete, aid understanding.
**Limits:** All analogies break down, can mislead.

---

## Mapping Proof Burdens

For architectural planning:

### Step 1: List Major Claims

Extract every significant claim in the book. Focus on:

- The core thesis
- Key supporting arguments
- Controversial assertions
- Actionable recommendations

### Step 2: Assess Each Claim

For each claim, ask:

- How counterintuitive is this? (1-5 scale)
- How much does it contradict existing beliefs?
- How threatening is it to identity/practice?
- What does the reader lose by accepting it?

### Step 3: Assign Proof Burden Level

Based on assessment, assign Level 1-5.

### Step 4: Check Evidence Availability

Do you have (or can you find) evidence that meets the burden?

- Yes → Plan where in the book evidence appears
- No → Either soften claim or flag as critical research gap

### Step 5: Map to Architecture

Where in the book does each claim appear? Is the evidence in place BEFORE the reader needs to accept the claim?

---

## Architectural Patterns

### Front-Load Foundation

For Level 4-5 claims that come later:

- Build credibility in early chapters
- Establish trust before making big asks
- Introduce supporting evidence before the main claim

### Layered Evidence

Don't dump all evidence at once:

- First mention: assertion + brief support
- Second mention: add depth
- Third mention: full evidence array
- Conclusion: synthesize

### Emotional Preparation

For identity-threatening claims:

- Normalize the discomfort early
- Share your own resistance
- Create off-ramps ("If this is true, it's not your fault")
- Build evidence gradually
- Allow processing time

### Credibility Deposits

Make credibility deposits before making withdrawals:

- Demonstrate accuracy on easily verified claims
- Show nuance and fairness
- Acknowledge limitations
- Reference strong sources

Then spend that credibility on harder claims.

---

## Common Mistakes

### Under-Proving Critical Claims

- Heavy claim with light evidence
- Reader's trust breaks
- Fix: Either strengthen evidence or soften claim

### Over-Proving Obvious Claims

- Light claim with heavy evidence
- Reader feels patronized, pace drags
- Fix: Trim evidence, trust the reader

### Evidence in Wrong Location

- Claim appears before evidence
- Reader has already rejected it by the time proof comes
- Fix: Move evidence earlier or delay claim

### Missing Counterarguments

- Strong claim without acknowledging objections
- Reader thinks of them anyway, loses trust
- Fix: Anticipate and address (see references/reader-resistance.md)

### Single Evidence Type

- All studies, no stories; or all stories, no studies
- Doesn't resonate with all readers
- Fix: Mix evidence types

---

## Proof Burden Map Template

In the Master Architecture Document:

```markdown
## Proof Burden Map

### Level 5 (Extraordinary)

- Claim: "[Identity-threatening claim]"
  - Chapters: 4, 7, 11
  - Evidence: [Study A], [Expert B], [Case studies C, D, E]
  - Emotional prep: Chapter 3 builds safety
  - Status: ✓ Evidence in place / ⚠ Gap exists

### Level 4 (Heavy)

- Claim: "[Strongly counterintuitive claim]"
  - Chapters: 5, 6
  - Evidence: [List]
  - Status: ...

### Level 3 (Substantial)

...

### Gaps to Address

- [Claim X] needs stronger evidence for [Y] by Chapter [Z]
- [Claim A] may need to be softened—evidence unavailable
```
