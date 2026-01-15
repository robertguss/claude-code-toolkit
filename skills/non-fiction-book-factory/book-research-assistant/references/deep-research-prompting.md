# Deep Research Prompting

Best practices for getting quality research output from Claude and Gemini deep research modes.

---

## Understanding Deep Research

### What It Does

Deep research modes (Claude's extended thinking with web access, Gemini's Deep Research) allow LLMs to:

- Search the web for current information
- Read and synthesize multiple sources
- Spend extended time on complex questions
- Produce comprehensive research reports

### What It Doesn't Do

- Access paywalled academic databases directly
- Verify its own citations with 100% accuracy
- Guarantee source recency or availability
- Replace expert human judgment

---

## Prompt Structure Principles

### 1. Context First, Question Second

**Why:** LLMs perform better when they understand the context before the ask.

**Structure:**

```
[Who you are and what you're doing]
[What the book is about]
[What this chapter needs]
[The specific question]
[How you'll use the answer]
```

### 2. Be Explicit About Everything

Don't assume the model will infer what you need. Specify:

- What type of evidence you want
- How much depth
- What format for the output
- What sources to prioritize
- What to avoid

### 3. Constrain Appropriately

**Too open:** "Tell me about productivity"
**Too narrow:** "Find the exact page number where Luhmann first mentioned..."
**Just right:** "What evidence from peer-reviewed sources supports the claim that linking notes improves recall compared to linear note-taking?"

---

## Key Prompt Elements

### Calibrating Depth

Be explicit about how much you need:

**Light touch:**

> "I need a brief overview with 2-3 key sources—this is supporting context, not a central argument."

**Medium depth:**

> "I need solid evidence from multiple sources—this supports a significant claim in the chapter."

**Deep dive:**

> "This is a cornerstone claim of the book. I need comprehensive research: multiple studies, expert perspectives, counterarguments, and the strongest available evidence."

### Specifying Source Quality

Tell the model what sources to prioritize:

> "Prioritize in this order: (1) peer-reviewed research, (2) primary sources like original documents or firsthand accounts, (3) reputable journalism from established publications, (4) expert commentary. Avoid: forums, content farms, and sources without clear authorship."

### Requesting Verification Transparency

Ask the model to distinguish what it's certain about:

> "For each source you cite, indicate whether you (a) actually retrieved and read it during this research session, or (b) are drawing on training knowledge. Flag any citations you're uncertain about."

### Handling Controversy

For contested topics:

> "This topic is contested. Present the strongest arguments on multiple sides rather than settling on one position. If experts disagree, show me the disagreement rather than resolving it artificially."

---

## Model-Specific Considerations

### Claude Deep Research

**Strengths:**

- Strong reasoning about complex topics
- Good at following structured output formats
- Tends to acknowledge uncertainty

**Optimize by:**

- Providing detailed output format specifications
- Asking for explicit confidence assessments
- Requesting structured analysis

**Watch for:**

- May be overly cautious about claims
- Can sometimes hedge when you need a clear answer

### Gemini Deep Research

**Strengths:**

- Strong web search and retrieval
- Often finds recent sources
- Good at comprehensive coverage

**Optimize by:**

- Specifying recency requirements clearly
- Asking for source diversity
- Requesting specific evidence types

**Watch for:**

- May prioritize coverage over depth
- Citation format may need cleanup

---

## Common Prompting Mistakes

### 1. Assuming Context

❌ "Research the note-taking claim from earlier"
✅ "Research the claim that handwritten notes improve retention compared to typed notes. The book argues [thesis] and this chapter [purpose]..."

### 2. Vague Evidence Requests

❌ "Find some evidence for this"
✅ "Find peer-reviewed studies, specific statistics, and expert quotes that support or challenge this claim"

### 3. Missing Output Format

❌ "Tell me what you find"
✅ "Structure your response with: Summary (2-3 paragraphs), Key Evidence (bulleted with citations), Sources (full Chicago citations with verification flags)"

### 4. No Scope Limits

❌ "Research everything about productivity"
✅ "Focus specifically on productivity in knowledge work contexts, particularly research and writing. I don't need manufacturing or sales productivity."

### 5. Forgetting Counterarguments

❌ "Find evidence that supports [my claim]"
✅ "Find evidence for and against [claim]. Present the strongest counterarguments, not just supporting evidence."

---

## Handling Specific Research Needs

### Finding Statistics

> "I need specific statistics on [topic]. For each statistic, provide: the exact number, the source, the methodology (sample size, year, population), and any caveats about interpretation."

### Finding Case Studies

> "I need real-world examples of [phenomenon]. For each example, provide: the name of the organization/person, specific details of what happened, outcomes or results, and a source I can verify."

### Finding Expert Opinions

> "Who are the leading experts on [topic]? For each expert, provide: their credentials, their main position on this issue, a direct quote if available, and where I can find more of their work."

### Finding Historical Origins

> "What is the history of [concept/practice]? Provide: origin date and context, key figures involved, how it evolved, and primary sources where possible."

### Finding Counterarguments

> "What are the strongest arguments against [claim]? Steelman the opposition—present the best case against this position, not a strawman. Include evidence that supports the counterargument."

---

## Iterative Research Strategy

### First Pass: Landscape Scan

Ask for a broad overview to understand the territory:

> "Give me an overview of the research landscape on [topic]. What are the major schools of thought? Key debates? Foundational studies? I'll follow up with specific questions."

### Second Pass: Targeted Dives

Based on the landscape, drill into specific areas:

> "Based on the overview, I want to go deeper on [specific aspect]. Find the strongest evidence for [specific claim]."

### Third Pass: Gap Filling

Address what's missing:

> "The research so far has covered X and Y, but I still need evidence for Z. Focus specifically on Z."

---

## Quality Control in Prompts

### Request Self-Assessment

> "After presenting your findings, assess: How confident are you in these conclusions? What are the limitations of this research? What questions remain unanswered?"

### Request Source Diversity

> "Don't rely on a single source for major claims. I want to see corroboration from independent sources where possible."

### Request Conflict Flagging

> "If you find sources that disagree with each other, flag the conflict explicitly. Don't smooth over disagreements."

### Request Recency Check

> "Prioritize recent sources (last 3-5 years) for [fast-moving topic]. For each older source, note whether more recent work has confirmed, challenged, or superseded it."

---

## Prompt Template Integration

The research-assistant's prompt template (see `assets/templates/research-prompt-template.md`) incorporates these principles. Each section serves a specific purpose:

1. **Book/Chapter Context** → Prevents generic answers
2. **Specific Question** → Focuses the research
3. **Evidence Type** → Gets the right kind of evidence
4. **Scope/Boundaries** → Prevents scope creep
5. **Source Requirements** → Ensures citation quality
6. **Quality Criteria** → Sets the bar for "enough"
7. **Search Guidance** → Improves retrieval
8. **Special Requests** → Gets quotes, counterarguments, etc.
9. **Output Format** → Ensures usable structure

---

## When Research Falls Short

If research output is inadequate:

### Coverage Problem

_Research didn't address the question_
→ Rephrase question more specifically
→ Break into smaller sub-questions

### Depth Problem

_Not enough evidence_
→ Explicitly ask for more sources
→ Specify "I need at least X studies/examples"

### Quality Problem

_Sources are weak_
→ Specify source hierarchy more explicitly
→ Ask for peer-reviewed or primary sources specifically

### Format Problem

_Output is hard to use_
→ Provide explicit output format
→ Ask for specific sections

Use the follow-up prompt template (`assets/templates/follow-up-prompt-template.md`) to address specific deficiencies.

---

_Use these principles when generating research prompts and when troubleshooting inadequate research results._
