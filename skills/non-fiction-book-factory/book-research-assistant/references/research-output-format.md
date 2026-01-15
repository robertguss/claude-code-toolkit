# Research Output Format Standard

Standard format for deep research outputs to ensure consistency, usability, and quality across Claude and Gemini research sessions.

---

## Why Standardization Matters

Without a standard format:

- Research outputs vary wildly in structure
- Important elements may be missing
- Validation is harder
- Synthesis is inconsistent
- Information gets lost

With a standard format:

- Every output has the same backbone
- Validation knows where to look
- Outputs can be compared consistently
- Synthesis is systematic
- Critical elements are never missing

---

## The Standard Structure

### Required Core Elements (Always Present)

Every research output MUST include these sections in this order:

```markdown
## Gap Identification

## Summary of Findings

## Key Evidence

## Source List

## Confidence Assessment

## Synthesis Statement
```

### Conditional Elements (Include When Applicable)

Include these sections when relevant content exists:

```markdown
## Case Studies / Examples

## Statistics / Data

## Expert Quotes

## Historical Background

## Counterarguments & Tensions

## Contradictions Between Sources

## Unexpected Discoveries

## Visual / Data Opportunities

## Connections to Other Chapters
```

---

## Detailed Section Specifications

### Gap Identification

**Purpose:** Confirm what question this research addresses.

**Required fields:**

- Gap ID (from tracker)
- Gap Title/Description
- Research Question (what was asked)

**Format:**

```markdown
## Gap Identification

- **Gap ID:** CH03-GAP-02
- **Gap Title:** Historical origins of the Zettelkasten method
- **Research Question:** When and how did the Zettelkasten method originate? Who developed it and what were their goals?
```

---

### Summary of Findings

**Purpose:** Executive summary answering the research question.

**Requirements:**

- 2-3 paragraphs maximum
- Lead with the most important finding
- Directly answer the research question
- Written in complete prose (not bullet points)

**Format:**

```markdown
## Summary of Findings

[Paragraph 1: Direct answer to the research question]

[Paragraph 2: Key supporting context or nuance]

[Paragraph 3 (optional): Important caveats or tensions]
```

---

### Key Evidence

**Purpose:** The "gold"—strongest, most usable findings.

**Requirements:**

- Discrete, numbered items
- Each item has a full citation
- Specific and concrete (not generic)
- Ready for potential use in manuscript

**Format:**

```markdown
## Key Evidence

1. **[Finding in bold]**
   [Brief explanation if needed]
   - Source: [Full Chicago citation]
   - Verification: [Retrieved/Training]
   - Strength: [Direct/Tangential/Context]

2. **[Finding in bold]**
   [Brief explanation if needed]
   - Source: [Full Chicago citation]
   - Verification: [Retrieved/Training]
   - Strength: [Direct/Tangential/Context]
```

---

### Source List

**Purpose:** Complete citations for all sources used.

**Requirements:**

- Chicago format
- Alphabetical by author
- Include ALL sources referenced in the output
- Verification flag for each

**Format:**

```markdown
## Source List

- Blair, Ann. "Note Taking as an Art of Transmission." _Critical Inquiry_ 31, no. 1 (2004): 85-107. [Retrieved]
- Luhmann, Niklas. "Kommunikation mit Zettelkästen." In _Öffentliche Meinung und sozialer Wandel_, edited by H. Baier et al., 222-228. Opladen: Westdeutscher Verlag, 1981. [Retrieved]
- Schmidt, Johannes F.K. "Niklas Luhmann's Card Index." _Sociologica_ 12, no. 1 (2018): 53-60. [Retrieved]
```

---

### Confidence Assessment

**Purpose:** Honest evaluation of research quality.

**Requirements:**

- Overall confidence level (High/Medium/Low)
- Brief explanation of basis for assessment
- Note limitations

**Format:**

```markdown
## Confidence Assessment

**Overall Confidence:** [High/Medium/Low]

**Basis:** [Why this confidence level]

**Limitations:** [What might affect reliability]
```

**Confidence Level Definitions:**

- **High:** Multiple strong sources agree; primary sources accessed; well-documented area
- **Medium:** Adequate sources but some limitations; reliance on secondary sources; some gaps
- **Low:** Limited sources; heavily reliant on training knowledge; significant uncertainty

---

### Synthesis Statement

**Purpose:** Bottom-line summary in 2-3 sentences.

**Requirements:**

- Captures the state of knowledge on this question
- Written as if summarizing for someone who will read nothing else
- Clear and direct

**Format:**

```markdown
## Synthesis Statement

[2-3 sentences capturing the bottom line. What does the research tell us? What's the answer to the question?]
```

---

### Case Studies / Examples

**Purpose:** Real-world examples with enough detail to be usable.

**Requirements:**

- Named entities (not "a company" but "Toyota")
- Specific details (dates, numbers, outcomes)
- Sufficient detail for potential manuscript use
- Source for each example

**Format:**

```markdown
## Case Studies / Examples

### [Example Name]

[Description with specific details]

- **Outcome:** [What happened]
- **Relevance:** [Why this matters for the chapter]
- **Source:** [Citation]

### [Example Name]

...
```

---

### Statistics / Data

**Purpose:** Quantitative evidence with context.

**Requirements:**

- Specific numbers
- Context for interpretation
- Source and methodology notes
- Recency noted

**Format:**

```markdown
## Statistics / Data

| Statistic     | Value    | Source     | Year   | Notes                 |
| ------------- | -------- | ---------- | ------ | --------------------- |
| [Description] | [Number] | [Citation] | [Year] | [Methodology/caveats] |
```

Or as prose with clear attribution for each data point.

---

### Expert Quotes

**Purpose:** Direct quotations ready for potential manuscript use.

**Requirements:**

- Exact quote in quotation marks
- Full attribution (name, credentials, context)
- Source citation
- Quotability assessment

**Format:**

```markdown
## Expert Quotes

> "[Exact quote]"
> — [Name], [Credentials/Role], [Context]
> Source: [Full citation]
> _Quotability: [Assessment — e.g., "Highly quotable—captures concept memorably"]_

> "[Exact quote]"
> ...
```

---

### Historical Background

**Purpose:** Origin and development context.

**Requirements:**

- Chronological clarity
- Key dates and figures
- Relevance to research question

**Format:**

```markdown
## Historical Background

[Narrative or chronological presentation of relevant history]

**Key Dates:**

- [Date]: [Event]
- [Date]: [Event]

**Key Figures:**

- [Name]: [Contribution]
```

---

### Counterarguments & Tensions

**Purpose:** Objections and complications to the main findings.

**Requirements:**

- Steelmanned (strongest version)
- Evidence supporting the counterargument
- Strength assessment

**Format:**

```markdown
## Counterarguments & Tensions

### [Counterargument 1]

**The Objection:** [Stated fairly and strongly]
**Supporting Evidence:** [What supports this objection]
**Strength:** [Strong/Moderate/Weak]
**Source:** [Citation]

### [Counterargument 2]

...
```

---

### Contradictions Between Sources

**Purpose:** Flag disagreements rather than resolving them artificially.

**Requirements:**

- Nature of disagreement stated clearly
- Both positions presented
- DO NOT artificially resolve

**Format:**

```markdown
## Contradictions Between Sources

### [Topic of Disagreement]

**Source A claims:** [Position with citation]
**Source B claims:** [Position with citation]
**Nature of conflict:** [Factual/Interpretive/Methodological/etc.]
**Resolution status:** [Unresolved — presented for author decision]
```

---

### Unexpected Discoveries

**Purpose:** Capture valuable tangential findings.

**Requirements:**

- Clearly marked as tangential
- Brief explanation of potential relevance
- Source noted

**Format:**

```markdown
## Unexpected Discoveries

- **[Discovery]:** [Brief description] — May be relevant to [chapter/topic]. Source: [Citation]
```

---

### Visual / Data Opportunities

**Purpose:** Flag material suitable for figures, tables, or charts.

**Format:**

```markdown
## Visual / Data Opportunities

| Data/Concept  | Suggested Visualization      | Source     |
| ------------- | ---------------------------- | ---------- |
| [Description] | [Table/Chart/Figure/Diagram] | [Citation] |
```

---

### Connections to Other Chapters

**Purpose:** Note findings relevant elsewhere in the book.

**Format:**

```markdown
## Connections to Other Chapters

| Finding   | Relevant To          | Notes             |
| --------- | -------------------- | ----------------- |
| [Finding] | Chapter [X]: [Title] | [How it connects] |
```

---

## Formatting Conventions

### Headers

Use `##` for main sections, `###` for subsections.

### Citations

Chicago format throughout. See `references/citation-standards.md`.

### Verification Flags

- `[Retrieved]` — Actually accessed during this research session
- `[Training]` — From training data, not freshly retrieved

### Strength Ratings

- `Direct` — Directly addresses the question
- `Tangential` — Related but not directly on point
- `Context` — Background information

### Primary/Secondary Flags

- `[Primary]` — Original source
- `[Secondary]` — Analysis or citation of primary

---

## Quality Checklist for Outputs

Before considering research output complete:

- [ ] All required core sections present
- [ ] Gap identification matches the prompt
- [ ] Summary directly answers the question
- [ ] Key evidence has full citations
- [ ] Source list is complete
- [ ] Confidence assessment is realistic
- [ ] Synthesis statement is clear and concise
- [ ] Applicable conditional sections included
- [ ] Citations are Chicago format
- [ ] Verification flags present
- [ ] Contradictions flagged (not hidden)
- [ ] Counterarguments steelmanned

---

## See Also

- `assets/templates/research-output-format-example.md` — Full example of a properly formatted output
- `references/citation-standards.md` — Citation format details
- `references/source-evaluation-guide.md` — How to assess source quality

---

_Include output format specifications in research prompts. Use this standard when validating whether returned research meets format requirements._
