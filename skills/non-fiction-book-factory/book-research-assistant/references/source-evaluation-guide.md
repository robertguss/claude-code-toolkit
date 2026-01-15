# Source Evaluation Guide

How to assess source quality, recognize reliable evidence, and avoid common pitfalls in research.

---

## Source Hierarchy

Prioritize sources in this order:

### Tier 1: Primary Sources (Highest Credibility)

**Definition:** Original material—the first place information appeared.

**Examples:**

- Original research studies and data
- Firsthand accounts and interviews
- Official documents (government reports, legal filings, corporate statements)
- Raw data sets
- Original speeches, letters, correspondence
- Autobiographies and memoirs (for the author's own experience)
- Archival materials

**Why they matter:** No intermediary interpretation. You're seeing the original evidence.

**Caution:** Primary sources still require evaluation—original doesn't mean unbiased.

---

### Tier 2: Peer-Reviewed Academic Sources

**Definition:** Research that has undergone expert review before publication.

**Examples:**

- Academic journal articles
- Peer-reviewed conference papers
- Academic books from university presses
- Systematic reviews and meta-analyses

**Why they matter:** Expert vetting catches errors, weak methodology, and unfounded claims.

**Caution:** Peer review isn't perfect. Check:

- Journal reputation (predatory journals exist)
- Sample sizes and methodology
- Conflicts of interest disclosures
- Whether findings have been replicated

---

### Tier 3: Reputable Institutional Sources

**Definition:** Publications from established, authoritative organizations.

**Examples:**

- Major newspapers of record (NYT, WSJ, Guardian, etc.)
- Government agencies (CDC, NIH, Census Bureau, etc.)
- Established research institutions (Pew, Brookings, RAND, etc.)
- Industry associations (with caveat about bias)
- Major NGOs and international bodies (WHO, World Bank, etc.)

**Why they matter:** Editorial standards, fact-checking, institutional reputation at stake.

**Caution:** Even reputable sources have:

- Editorial perspectives
- Occasional errors
- Potential institutional biases

---

### Tier 4: Expert Commentary and Analysis

**Definition:** Analysis from recognized experts in the relevant field.

**Examples:**

- Expert blog posts and newsletters
- Podcast interviews with experts
- Conference presentations
- Expert commentary in news articles

**Why they matter:** Deep domain knowledge can provide insight and context.

**Caution:**

- Verify the person actually has relevant expertise
- Expert opinion ≠ expert evidence
- Experts can have biases and blind spots

---

### Tier 5: General Web Sources (Use Sparingly)

**Definition:** Other online sources without institutional backing.

**Examples:**

- Wikipedia (useful for orientation, not citation)
- General interest websites
- Corporate websites
- Blogs and personal sites

**Why they matter:** Sometimes the only available source on niche topics.

**Caution:**

- Verify claims through better sources when possible
- Check for author credentials
- Look for citations you can follow upstream
- Watch for commercial motivation

---

## Red Flags: Sources to Avoid

### Unverifiable Claims

- No citations or references
- Vague attribution ("studies show," "experts say")
- Claims that can't be traced to an original source

### Conflict of Interest

- Industry-funded research on the industry's product
- Advocacy organizations presenting as neutral
- Authors with financial stake in conclusions

### Poor Methodology

- Small sample sizes presented as definitive
- Correlation presented as causation
- Cherry-picked data or timeframes
- No control groups in studies that need them

### Outdated Information

- Old data in fast-moving fields
- Superseded research or guidance
- Pre-internet sources for topics that have evolved

### Predatory or Low-Quality Publishers

- Journals not indexed in major databases
- Pay-to-publish without peer review
- Publishers on known predatory lists

### Bias Markers

- Extreme language or emotional appeals
- Missing counterarguments
- Clear ideological framing
- Anonymous authorship on contested topics

---

## Verification Checklist

For each significant source, verify:

### Author/Publisher

- [ ] Author has relevant credentials
- [ ] Author has track record in this area
- [ ] Publisher has editorial standards
- [ ] No undisclosed conflicts of interest

### Currency

- [ ] Publication date is appropriate for the topic
- [ ] Information hasn't been superseded
- [ ] Data is recent enough to be relevant

### Methodology (for research)

- [ ] Sample size is adequate
- [ ] Methods are described and appropriate
- [ ] Limitations are acknowledged
- [ ] Findings have been replicated (or are new)

### Citations

- [ ] Claims are supported by citations
- [ ] Citations are to quality sources
- [ ] Key citations can be verified

### Corroboration

- [ ] Key claims are confirmed by multiple sources
- [ ] Sources are independent (not citing each other)
- [ ] Absence of contradicting evidence from quality sources

---

## LLM-Specific Verification

When research comes from Claude or Gemini:

### Distinguish Retrieved vs. Training Knowledge

**Retrieved (Higher Confidence):**

- Research explicitly pulled from the web during the session
- URLs and specific documents cited
- Recent information post-training

**Training Knowledge (Verify Independently):**

- Information from the model's training data
- May be accurate but could be:
  - Outdated
  - Misremembered (hallucinated)
  - Conflated from multiple sources

### Hallucination Markers

Watch for:

- Very specific citations that feel "too perfect"
- Statistics with suspicious precision
- Quotes that can't be found in the attributed source
- Sources that don't exist when searched
- Information that contradicts other reputable sources

### Verification Protocol

For critical claims from LLM research:

1. Note the specific claim and citation
2. Search for the cited source directly
3. Verify the source exists
4. Verify the claim appears in the source
5. Verify the source is what the LLM claimed (date, author, etc.)

---

## Source Strength Assessment

Rate each source's relevance to your specific research question:

### Direct Support

The source directly addresses your question with relevant evidence.

- Original research on the exact topic
- Expert analysis of the specific phenomenon
- Data that measures what you're asking about

### Tangential Support

The source is related but doesn't directly address your question.

- Research on adjacent topics
- Analogous examples from other domains
- General principles that might apply

### Contextual Support

The source provides background but not evidence.

- Historical information
- Definitional clarity
- Framework for understanding

---

## Building Source Confidence

Confidence increases when:

- Multiple independent sources agree
- Primary sources support secondary analysis
- Experts with different perspectives reach similar conclusions
- Methodology is transparent and robust
- Claims are specific and falsifiable
- Source has track record of accuracy

Confidence decreases when:

- Single source for important claims
- Circular citation (sources citing each other)
- Vague or unverifiable claims
- Source has history of errors or bias
- Claims are extraordinary without extraordinary evidence
- Financial or ideological incentives align with conclusions

---

## Practical Application

### When Validating Research

For each major claim, ask:

1. What type of source supports this? (Tier 1-5)
2. Are there red flags?
3. Has this been verified against the checklist?
4. What's the source strength for this specific question?
5. What's my overall confidence?

### When Sources Conflict

See `contradiction-reconciliation.md` for detailed guidance.

Quick framework:

1. Identify the exact nature of disagreement
2. Assess source quality on each side
3. Look for methodological differences
4. Check for more recent evidence
5. Present conflict rather than resolving it artificially

---

_Use this guide when generating research prompts and when validating returned research._
