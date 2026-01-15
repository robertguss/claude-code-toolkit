# Research Output Format Example

This document shows the standard format for deep research outputs. Use this as a reference when running prompts through Claude or Gemini, and when validating research quality.

---

## Standard Output Structure

### Core Elements (Always Required)

Every research output must include these sections:

```
## Gap Identification
- Gap ID: [From prompt]
- Gap Title: [Short description]
- Research Question: [What was asked]

## Summary of Findings
[2-3 paragraphs synthesizing what was discovered. Lead with most important findings. This should answer the research question directly.]

## Key Evidence
[The "gold"—strongest, most usable findings. Present as discrete items with full citations. These are the pieces that will likely appear in the book.]

## Source List
[Full citations for all sources used, in Chicago format]

## Confidence Assessment
[Overall, how solid is this research? What level of confidence should the author have?]
- High Confidence: Multiple strong sources agree, primary sources secured
- Medium Confidence: Adequate sources but some limitations
- Low Confidence: Limited sources, relying heavily on secondary material

## Synthesis Statement
[2-3 sentences capturing the bottom line. The state of knowledge on this question.]
```

---

### Conditional Sections (Include When Applicable)

Include these sections when the research warrants them:

```
## Case Studies / Examples
[When real-world examples were found. Include:
- Named entities (companies, people, organizations)
- Specific details (dates, numbers, outcomes)
- Source citations for each example]

## Statistics / Data
[When quantitative evidence was found. Include:
- Specific numbers with context
- Source and methodology notes
- Recency of data
- Any caveats about the data]

## Expert Quotes
[When direct quotations were found. Include:
- Exact quote in quotation marks
- Full attribution (name, credentials, context)
- Source citation
- Note on quotability (suitable for manuscript use?)]

## Historical Examples
[When historical context was found. Include:
- Relevant historical background
- Key dates and developments
- How history informs the current question]

## Counterarguments & Tensions
[When objections or complications were found. Include:
- The counterargument stated fairly (steelman)
- Evidence supporting the counterargument
- Strength assessment (strong/moderate/weak)
- Potential responses]

## Contradictions Between Sources
[When sources disagree. Include:
- Nature of the disagreement
- What each source claims
- Evidence on each side
- Do NOT resolve—present both positions]

## Unexpected Discoveries
[When surprising or tangential findings emerged. Include:
- What was discovered
- Why it's notable
- Potential relevance to the book]

## Visual/Data Opportunities
[When material suitable for figures was found. Include:
- Description of the data/concept
- Suggested visualization type
- Source for the underlying data]

## Connections to Other Chapters
[When findings relevant to other parts of the book emerged. Include:
- The finding
- Which chapter(s) it might serve
- Brief note on relevance]
```

---

## Formatting Conventions

### Citation Format

Use Chicago author-date style:

**Book:**
Smith, John. _Title of Book_. Place: Publisher, Year.

**Journal Article:**
Smith, John. "Title of Article." _Journal Name_ Volume, no. Issue (Year): Pages. DOI or URL.

**Web Source:**
Author or Organization. "Title of Page." Website Name. Date. URL.

### Confidence Flags

Mark each source with verification status:

- **[Retrieved]** — Actually accessed and read during this research session
- **[Training]** — Known from training data, not freshly retrieved
- **[Cited in]** — Not accessed directly; known via citation in another source

### Source Strength Ratings

Rate how directly each source supports the research question:

- **Direct** — Directly addresses the question with relevant evidence
- **Tangential** — Related but not directly on point
- **Context** — Provides background but not evidence for the claim

### Primary vs. Secondary Distinction

Flag each source:

- **[Primary]** — Original research, firsthand account, official document
- **[Secondary]** — Analysis, commentary, or citation of primary sources

---

## Example Output

Below is an example of a well-formatted research output:

---

## Gap Identification

- **Gap ID:** CH03-GAP-02
- **Gap Title:** Historical origins of the Zettelkasten method
- **Research Question:** When and how did the Zettelkasten method originate? Who developed it and what were their goals?

## Summary of Findings

The Zettelkasten ("slip box") method has roots in early modern scholarship, with the term appearing in German academic contexts as early as the 17th century. However, the method gained its most sophisticated form through sociologist Niklas Luhmann (1927-1998), who developed and refined his system over approximately 40 years while producing an extraordinary body of academic work.

Luhmann's system was notable for its emphasis on connection-making rather than mere storage. He explicitly described his Zettelkasten as a "communication partner" that contributed to his thinking process. His archive, now preserved at Bielefeld University, contains approximately 90,000 handwritten cards with an intricate system of numbering and cross-references.

Earlier scholars used similar slip-box methods—notably Conrad Gessner in the 16th century and later Carl Linnaeus—but Luhmann's contribution was systematizing the method for generating new ideas rather than merely organizing existing knowledge.

## Key Evidence

1. **Luhmann's output correlation:** Luhmann published over 70 books and nearly 400 scholarly articles during his career, attributing much of his productivity to his Zettelkasten system. He explicitly stated in a 1981 essay that the system "ichever owed its longevity and productiveness to the card file."
   - Source: Luhmann, Niklas. "Kommunikation mit Zettelkästen." In _Öffentliche Meinung und sozialer Wandel_, edited by H. Baier et al., 222-228. Opladen: Westdeutscher Verlag, 1981. [Retrieved] [Primary] [Direct]

2. **90,000 cards over 40+ years:** Luhmann's Zettelkasten, preserved at Bielefeld University, contains approximately 90,000 handwritten index cards created between 1952-1997.
   - Source: Schmidt, Johannes F.K. "Niklas Luhmann's Card Index: The Fabrication of Serendipity." _Sociologica_ 12, no. 1 (2018): 53-60. DOI: 10.6092/issn.1971-8853/8350. [Retrieved] [Primary] [Direct]

3. **"Communication partner" concept:** Luhmann described his Zettelkasten not as a passive storage system but as an active thinking partner capable of surprising him with connections he hadn't anticipated.
   - Source: Luhmann 1981, 225-226. [Retrieved] [Primary] [Direct]

## Historical Examples

**Pre-Luhmann slip-box traditions:**

Conrad Gessner (1516-1565) is often credited as an early advocate of the slip method, recommending in _Pandectae_ (1548) that scholars write notes on separate pieces of paper that could be rearranged. Gessner's purpose was primarily organizational—managing the explosion of printed knowledge in the early modern period.

Carl Linnaeus (1707-1778) used a similar system for developing his biological taxonomy, allowing him to insert new species into his classification system as they were discovered.

The key distinction: these earlier systems were primarily for _organization_, while Luhmann's innovation was using the system for _idea generation_.

- Source: Blair, Ann. "Note Taking as an Art of Transmission." _Critical Inquiry_ 31, no. 1 (2004): 85-107. [Retrieved] [Secondary] [Context]

## Expert Quotes

> "I don't think everything on my own. This happens mainly in the slip box."
> — Niklas Luhmann, from interview in _Archimedes und wir_ (1987)
> [Training] [Primary] _Highly quotable—captures the "thinking partner" concept_

> "The slip box provides combinatorial possibilities that were never planned, never intended, never thought of."
> — Niklas Luhmann, "Kommunikation mit Zettelkästen" (1981), p. 227
> [Retrieved] [Primary] _Quotable—emphasizes emergent insight_

## Counterarguments & Tensions

**Counterargument: Survivorship bias**
Critics argue that Luhmann's productivity may be attributed to other factors (his intelligence, work ethic, institutional position) and that the Zettelkasten is given disproportionate credit. Many productive scholars have worked without such systems.

- Strength: Moderate
- Evidence: No controlled studies compare Zettelkasten users to non-users
- Potential response: Luhmann himself attributed his productivity to the system; his specific methodology can be studied through his preserved archive

## Contradictions Between Sources

**Dating the origin:**
Some sources date Luhmann's system to 1952 (when he began his first career as a legal administrator), while others date it to 1963 (when he transitioned to academic sociology). The archive itself shows cards from both periods, suggesting the system evolved rather than began at a single point.

- Schmidt (2018) emphasizes the 1952 start
- Ahrens (2017) focuses on the academic period post-1963
- Resolution: Not attempted—both framings have merit

## Source Evaluation

| Source       | Type      | Verification | Strength   | Access        |
| ------------ | --------- | ------------ | ---------- | ------------- |
| Luhmann 1981 | Primary   | Retrieved    | Direct     | Open (German) |
| Schmidt 2018 | Primary   | Retrieved    | Direct     | Open          |
| Blair 2004   | Secondary | Retrieved    | Context    | JSTOR         |
| Ahrens 2017  | Secondary | Training     | Tangential | Book (paid)   |

## Confidence Assessment

**High Confidence.** Primary sources have been accessed, including Luhmann's own writings and academic analysis of his archive. The historical claims are well-documented by scholars who have examined the physical archive at Bielefeld.

## Synthesis Statement

The Zettelkasten method, while having roots in early modern scholarship, achieved its most developed form through Niklas Luhmann's 40-year practice. Luhmann's key innovation was treating the system as a "communication partner" for generating ideas rather than merely storing information—a distinction that separates his approach from earlier slip-box methods and makes it particularly relevant for creative intellectual work.

---

_This example demonstrates the standard format. Actual outputs may be longer or shorter depending on gap complexity._
