# Proof Burden Matching

What level of evidence different types of claims require. Not all claims need the same evidentiary support—matching evidence to claim importance prevents both under-supporting critical arguments and over-researching minor points.

---

## The Core Principle

**Extraordinary claims require extraordinary evidence.**
**Ordinary claims require ordinary evidence.**
**Common knowledge requires no evidence.**

The proof burden depends on:

1. How central the claim is to the book's argument
2. How controversial or surprising the claim is
3. How much the reader's acceptance depends on evidence
4. What's at stake if the claim is wrong

---

## Proof Burden Levels

### Level 1: Heavy Burden

**When it applies:**

- Central thesis of the book
- Contrarian claims that challenge conventional wisdom
- Claims that ask readers to change behavior significantly
- Claims that contradict what readers likely believe
- Claims with significant consequences if wrong

**Evidence required:**

- Multiple independent sources agreeing
- At least some primary sources
- Peer-reviewed or authoritative sources
- Specific data, not just assertions
- Counterarguments addressed
- Multiple evidence types (statistical + case studies + expert opinion)

**Example claims:**

- "Philosophy has failed because truth is a Person, not a proposition"
- "Handwritten notes are significantly better for learning than typed notes"
- "The Zettelkasten method will transform your intellectual output"

**Research approach:**
P1 priority. Extensive research. Both Claude and Gemini. Multiple prompts covering different evidence types. Validation must show Strong verdict.

---

### Level 2: Medium Burden

**When it applies:**

- Major supporting arguments
- Claims that are somewhat surprising but not radical
- Points that significantly advance the argument
- Evidence for mechanisms (how/why something works)

**Evidence required:**

- At least 2-3 quality sources
- Mix of evidence types helpful
- Primary sources preferred but not required
- Main counterarguments acknowledged

**Example claims:**

- "Luhmann's productivity was exceptional among sociologists"
- "Digital note-taking tools create different cognitive patterns than paper"
- "Information overload has increased significantly in the past decade"

**Research approach:**
P1 or P2 priority. Solid research from both models. At least one prompt dedicated to this gap. Validation should show Adequate or Strong.

---

### Level 3: Light Burden

**When it applies:**

- Supporting details and illustrations
- Claims readers are likely to accept
- Points that reinforce rather than establish
- Contextual information

**Evidence required:**

- At least one quality source
- Credible citation sufficient
- Expert opinion or single good study acceptable
- Deep sourcing not required

**Example claims:**

- "Many knowledge workers feel overwhelmed by information"
- "Note-taking has a long history in scholarly practice"
- "Some researchers have found card-based systems useful"

**Research approach:**
P2 or P3 priority. Single source may suffice. One model may be enough. Validation can accept Adequate or Thin if not central.

---

### Level 4: Minimal/No Burden

**When it applies:**

- Common knowledge claims
- Definitional statements
- Generally accepted facts
- Background context most readers know

**Evidence required:**

- May not need formal citation
- Common knowledge doesn't require proof
- Can assert without extensive support

**Example claims:**

- "Writing has been a fundamental tool of human civilization"
- "Most people have access to digital devices"
- "Thinking is difficult"

**Research approach:**
Usually no dedicated research gap. May cite for interested readers but not required for persuasion.

---

## Claim Type Assessment

### Factual Claims

_Something is or isn't true_

| Claim Type          | Typical Burden                          |
| ------------------- | --------------------------------------- |
| Statistics and data | Medium to Heavy (depends on centrality) |
| Historical facts    | Light to Medium (well-documented)       |
| Scientific findings | Medium to Heavy (depends on consensus)  |
| Definitions         | Minimal                                 |

### Causal Claims

_X causes or leads to Y_

| Claim Type                       | Typical Burden |
| -------------------------------- | -------------- |
| Central mechanism of argument    | Heavy          |
| Supporting causal link           | Medium         |
| Suggested connection             | Light          |
| Correlation noted as correlation | Light          |

### Evaluative Claims

_X is good/better/best_

| Claim Type             | Typical Burden  |
| ---------------------- | --------------- |
| Central recommendation | Heavy           |
| Comparative assessment | Medium to Heavy |
| Opinion with evidence  | Medium          |
| Personal preference    | Minimal         |

### Predictive Claims

_X will happen_

| Claim Type          | Typical Burden |
| ------------------- | -------------- |
| Specific prediction | Heavy          |
| Trend projection    | Medium         |
| Possibility noted   | Light          |

---

## Adjusting for Context

### Audience Skepticism

More skeptical audience → Higher burden

- Academic readers expect heavy evidence
- Practitioners may accept case studies more readily
- Friendly audiences need less convincing

### Claim Novelty

More novel claim → Higher burden

- Claims that match reader beliefs need less support
- Claims that challenge beliefs need more support
- Completely new ideas need extensive grounding

### Consequences of Error

Higher stakes → Higher burden

- Claims about health, safety, major decisions need strong support
- Claims about preferences or style need less support
- Reversible recommendations need less than irreversible ones

### Author Authority

Less established authority → Higher burden

- Experts can assert more on their expertise
- Non-experts need more external evidence
- First-time authors need more proof than established voices

---

## Practical Application

### When Planning Research

For each gap, assess:

1. **How central is this claim?**
   - Thesis or major argument → Heavy
   - Supporting point → Medium
   - Illustration → Light

2. **How surprising is this claim?**
   - Challenges conventional wisdom → Heavy
   - Somewhat novel → Medium
   - Generally accepted → Light or Minimal

3. **What happens if readers don't believe it?**
   - Book fails → Heavy
   - Argument weakened → Medium
   - Minor impact → Light

4. **What's the author's authority here?**
   - Outside expertise → Heavy
   - Adjacent to expertise → Medium
   - Within expertise → Light

**Result:** Assign P1/P2/P3 priority and calibrate research depth accordingly.

---

### When Validating Research

Ask: Does the evidence match the burden?

| Burden Level | Evidence Threshold                                                           |
| ------------ | ---------------------------------------------------------------------------- |
| Heavy        | Multiple strong sources, multiple evidence types, counterarguments addressed |
| Medium       | 2-3 quality sources, main evidence types covered                             |
| Light        | 1-2 credible sources, basic support                                          |
| Minimal      | Common knowledge or simple citation                                          |

**If evidence falls short of burden:**

- P1 claim with Medium evidence → Needs More
- P2 claim with Light evidence → Might be acceptable depending on context
- P3 claim with Minimal evidence → Likely acceptable

---

## Red Flags: Burden Mismatch

### Under-supported Critical Claims

- "Studies show..." without citation → Needs research
- Central argument with single source → Needs more
- Contrarian claim with only supporting evidence → Needs counterarguments

### Over-supported Minor Points

- Three pages of evidence for uncontested point → Wasteful
- Multiple studies for common knowledge → Overkill
- Heavy research for P3 gap → Reprioritize

---

## Book-Architect Integration

The book-architect identifies proof burdens in the Architecture Document. Research-assistant should:

1. **Receive** the proof burden assessment from architect
2. **Verify** the burden assignment makes sense
3. **Adjust** if research reveals the claim is more contested than expected
4. **Match** research depth to burden level
5. **Report** in Chapter Research Summary whether burdens were met

---

## Template: Burden Assessment

For each significant claim:

| Claim   | Burden Level       | Reason           | Evidence Secured | Status         |
| ------- | ------------------ | ---------------- | ---------------- | -------------- |
| [Claim] | Heavy/Medium/Light | [Why this level] | [What we have]   | Met/Thin/Unmet |

---

_Use this guide when assessing research gaps and validating whether evidence meets the burden._
