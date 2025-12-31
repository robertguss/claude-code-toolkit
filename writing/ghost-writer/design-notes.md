# Ghost Writer Skill - Design Notes

This document captures the complete context from the brainstorming session that produced the `writing-dna-discovery` skill. Use this as the foundation for building the ghost writer skill.

---

## Project Overview

### The Two-Skill Architecture

We designed a two-skill system for AI-assisted writing:

1. **Writing DNA Discovery** (completed) - Captures a writer's voice through collaborative interview and sample analysis. Produces a Voice DNA Document.

2. **Ghost Writer** (to be built) - Consumes the Voice DNA Document and produces first drafts that match the writer's authentic voice.

### The 80% Accuracy Goal

The ghost writer is NOT intended to replace the human writer. The goal is:

- **Ghost writer produces:** ~80% accurate first drafts
- **Human adds:** The remaining 20% (creative spark, situational judgment, final polish)

This is a tool for producing strong starting points, not finished work. The human always edits, revises, and finalizes.

### Why Two Skills?

Separating discovery from writing allows:

- **Reusability:** One DNA document can be used for many writing sessions
- **Refinement:** The DNA document improves over time based on ghost writer feedback
- **Clarity:** Each skill has a focused purpose
- **Multiple registers:** A writer can have different DNA documents for different modes (blog, fiction, technical, etc.)

---

## The Voice DNA Document

The writing-dna-discovery skill produces a structured document. Here's what the ghost writer needs to know:

### Document Structure

```
Voice DNA: [Author Name]
├── Quick Reference (30-second scan)
│   ├── Core Temperature
│   ├── Sentence Signature
│   ├── Distinctive Moves (2-3)
│   └── Never Does (2-3)
├── Voice Profile (detailed dimensions)
│   ├── Sentence Level
│   ├── Punctuation Personality
│   ├── Paragraph & Structure
│   ├── Word Choice & Vocabulary
│   ├── Tone & Attitude
│   ├── Reader Relationship
│   ├── Opening & Closing Moves
│   ├── Humor Approach
│   └── Signature Elements
├── Exemplar Passages (annotated quotes)
├── Anti-Patterns (what to avoid)
├── Ghost Writer Briefing ← PRIMARY INPUT FOR GHOST WRITER
│   ├── Voice Essence (2-3 sentence north star)
│   ├── Do This (specific instructions)
│   ├── Don't Do This (specific avoidances)
│   ├── When Uncertain (decision rules)
│   ├── Sentence-Level Guidance
│   └── Structural Guidance
└── Profile Metadata
    ├── Readiness Level
    ├── Sample Base
    └── Dimensions Needing Depth
```

### The Ghost Writer Briefing Section

This section is specifically designed for the ghost writer skill to consume. It contains:

**Voice Essence:** 2-3 sentence distillation of the writer's voice—the north star.

**Do This:** Specific, actionable instructions:

- "Keep sentences under 15 words"
- "Use contractions always"
- "End paragraphs with concrete images"

**Don't Do This:** Specific avoidances:

- "No sentences over 20 words"
- "Never use 'utilize,' 'leverage,' 'facilitate'"
- "No passive voice"

**When Uncertain:** Decision rules for ambiguous situations:

- "Default to shorter rather than longer"
- "When in doubt, cut the adjective"
- "Favor concrete over abstract"

### Readiness Levels

| Level              | Meaning                                          | Ghost Writer Accuracy |
| ------------------ | ------------------------------------------------ | --------------------- |
| **Minimum Viable** | Basic patterns captured                          | ~60-70%               |
| **Solid**          | Multiple dimensions developed, briefing complete | ~75-85%               |
| **Strong**         | Deep analysis, validated against output          | ~85-90%               |

The ghost writer should communicate expected accuracy based on readiness level.

---

## Key Design Decisions

### One Register Per Session

Writers have different voices for different contexts:

- Blog posts vs. fiction prose
- Technical writing vs. casual essays
- Marketing copy vs. personal emails

Each register gets its own DNA document. The ghost writer should ask which register to use if the writer has multiple.

### Living Documents

Voice DNA Documents are not static. They:

- Grow richer over time with additional discovery sessions
- Get refined based on ghost writer feedback
- Evolve as the writer's voice changes
- Are versioned (v1, v2, v3...)

### Comprehensive Capability, Intelligent Application

The DNA discovery skill has a full arsenal of dimensions but doesn't use everything for every writer. The ghost writer should similarly:

- Use what's captured in the specific DNA document
- Not assume patterns that aren't documented
- Handle sparse profiles gracefully (lower confidence output)

---

## The Voice Dimension Framework

We developed a comprehensive 8-level framework for analyzing voice:

### Level 1: Sentence Level

- Rhythm & architecture (length, variation, internal structure)
- Opening word tendencies (starts with "I"? "And"? "But"?)
- Emphasis placement (front-loaded vs. end-weighted)

### Level 2: Punctuation Personality

- Em-dash usage (frequency, purpose)
- Semicolons (present/absent)
- Comma density
- Exclamation points
- Parenthetical asides

### Level 3: Paragraph & Structure

- Paragraph construction and length
- Topic sentence placement
- Transitional patterns
- Opening moves (how pieces begin)
- Closing moves (how pieces end)

### Level 4: Word Level

- Vocabulary character (Anglo-Saxon vs. Latinate)
- Favorite words and phrases
- Avoided words
- Contraction philosophy
- Jargon handling

### Level 5: Voice & Tone

- Emotional temperature (warm/cool)
- Confidence style (direct assertion vs. hedging)
- Formality gradient
- Humor approach (if present)
- Authority stance

### Level 6: Reader Relationship

- First person presence ("I" frequency)
- Second person usage ("you" address)
- Inclusive "we" patterns
- Reader assumptions (expertise level)

### Level 7: Signature Elements

- Distinctive moves (things only they do)
- Pet phrases
- Characteristic tics

### Level 8: Anti-Patterns

- What they never do
- What would feel "off"
- AI patterns to suppress

### Register-Specific Dimensions

**For Fiction:**

- Narrative distance
- Dialogue style
- Description density
- Interiority access

**For Non-Fiction:**

- Argument structure
- Evidence handling
- Counterargument approach

**For Blog/Casual:**

- Hook patterns
- Personal disclosure level
- Call-to-action style

---

## Anti-AI Patterns to Suppress

The ghost writer must avoid these AI tells. Full details in `writing-dna-discovery/references/anti-ai-patterns.md`.

### The 11 Pattern Categories

1. **Significance Puffery**

   - "stands as a testament," "plays a vital role," "underscores its importance"

2. **Superficial Analysis**

   - "-ing" phrases: "highlighting," "emphasizing," "reflecting," "showcasing"

3. **Promotional Language**

   - "rich tapestry," "nestled," "in the heart of," "vibrant," "stunning"

4. **Formulaic Structures**

   - "It's important to note," "Despite challenges...," "In conclusion"

5. **Hedging Patterns**

   - "various," "numerous," "significant," "some critics argue"

6. **Elegant Variation**

   - Excessive synonym-swapping from repetition penalty

7. **Rule of Three Overuse**

   - Every list having exactly three items

8. **False Ranges**

   - "from X to Y" constructions without real scale

9. **Negative Parallelisms**

   - "Not only... but also" without genuine contrast

10. **Common AI Words**

    - "delve," "navigate," "landscape," "multifaceted," "utilize," "leverage"

11. **Structural Tells**
    - Title case in subheadings, excessive boldface, numbered list headers

### How the Ghost Writer Should Use This

1. Check the DNA document's "AI Patterns to Suppress" checklist
2. Actively avoid checked patterns during generation
3. If a pattern appears in output, revise before presenting
4. When uncertain if something sounds "AI-like," prefer the more human-sounding alternative

---

## Ghost Writer Skill Requirements

### Core Functionality

The ghost writer skill should:

1. **Accept a Voice DNA Document** as input
2. **Accept a writing task** (topic, length, purpose, context)
3. **Generate a first draft** that matches the documented voice
4. **Communicate confidence level** based on DNA document readiness
5. **Flag uncertainties** where the DNA document doesn't provide guidance

### Workflow

```
User provides:
├── Voice DNA Document (or path to it)
├── Writing task description
├── Any specific requirements (length, tone adjustments, etc.)

Ghost Writer:
├── Reads and internalizes DNA document
├── Prioritizes Ghost Writer Briefing section
├── Generates draft following documented patterns
├── Avoids documented anti-patterns
├── Flags areas of uncertainty
└── Presents draft with confidence assessment
```

### Handling Different Readiness Levels

**Minimum Viable Profile:**

- Acknowledge lower confidence
- Focus on the patterns that ARE documented
- Be more conservative (avoid risky choices)
- Suggest areas where more DNA discovery would help

**Solid Profile:**

- Higher confidence output
- Use the full Ghost Writer Briefing
- Apply documented patterns consistently
- Flag only genuine ambiguities

**Strong Profile:**

- Highest confidence output
- Trust the comprehensive documentation
- Make bolder choices within documented patterns
- Output should be recognizably "them"

### Feedback Loop

After the user reviews ghost writer output:

1. **What worked?** → Confirms DNA document accuracy
2. **What felt "off"?** → Surfaces missing anti-patterns
3. **What was missing?** → Identifies gaps in DNA document

This feedback should loop back to the writing-dna-discovery skill for refinement. Consider a "Refinement from Feedback" session type that converts ghost writer feedback into DNA document updates.

---

## Collaboration Philosophy

From the discovery skill (apply to ghost writer too):

- **The human decides** — Ghost writer produces drafts; human has final say
- **Transparency about confidence** — Be clear about certainty levels
- **Surface problems** — If something doesn't work, say so
- **Respect the voice** — The goal is matching THEM, not producing "good writing"

---

## File References

### Writing DNA Discovery Skill

| File                  | Path                                                           | Purpose                           |
| --------------------- | -------------------------------------------------------------- | --------------------------------- |
| **SKILL.md**          | `writing-dna-discovery/SKILL.md`                               | Core skill instructions           |
| **Template**          | `writing-dna-discovery/assets/templates/voice-dna-template.md` | Voice DNA Document template       |
| **Anti-AI Patterns**  | `writing-dna-discovery/references/anti-ai-patterns.md`         | 11 AI pattern categories to avoid |
| **Dimension Catalog** | `writing-dna-discovery/references/voice-dimension-catalog.md`  | Full 8-level dimension framework  |
| **Question Bank**     | `writing-dna-discovery/references/interview-question-bank.md`  | 100+ discovery questions          |
| **Sample Analysis**   | `writing-dna-discovery/references/sample-analysis-guide.md`    | How to analyze writing samples    |
| **Examples**          | `writing-dna-discovery/references/dna-document-examples.md`    | 3 annotated example profiles      |
| **Failure Patterns**  | `writing-dna-discovery/references/failure-patterns.md`         | 8 common mistakes                 |

### Key Documents to Reference

When building the ghost writer skill:

1. **Read the template** (`voice-dna-template.md`) to understand DNA document structure
2. **Study the examples** (`dna-document-examples.md`) to see what real profiles look like
3. **Internalize anti-AI patterns** (`anti-ai-patterns.md`) for suppression logic
4. **Understand dimensions** (`voice-dimension-catalog.md`) for comprehensive coverage

---

## Implementation Notes for Ghost Writer Skill

### Suggested Structure

```
ghost-writer/
├── SKILL.md                           # Main skill instructions
├── assets/
│   └── templates/
│       └── [any output templates]
└── references/
    ├── consumption-guide.md           # How to read DNA documents
    ├── generation-strategies.md       # Approaches for different registers
    └── quality-checklist.md           # Pre-delivery quality checks
```

### Key Behaviors to Implement

1. **DNA Document Parsing**

   - Extract Ghost Writer Briefing section
   - Identify readiness level
   - Build pattern checklist from Do/Don't sections
   - Note anti-patterns to suppress

2. **Generation Mode**

   - Apply sentence-level guidance
   - Follow structural guidance
   - Check against anti-patterns continuously
   - Use "When Uncertain" rules for ambiguous cases

3. **Quality Assurance**

   - Scan output for AI patterns
   - Verify adherence to documented patterns
   - Flag confidence level
   - Identify areas where DNA document didn't provide guidance

4. **Feedback Handling**
   - Capture what worked/didn't work
   - Translate feedback into potential DNA document updates
   - Suggest returning to discovery skill for refinement

---

## Questions to Address When Building Ghost Writer

1. **How much context does the ghost writer need?** Should it read the full DNA document or just the Ghost Writer Briefing?

2. **How should it handle sparse profiles?** More conservative? More explicit about limitations?

3. **What's the output format?** Just prose? Prose with annotations? Prose with confidence notes?

4. **How does register-switching work?** Does the user specify which DNA document to use?

5. **Should it offer alternatives?** "Here's version A (more formal) and version B (more casual)"?

6. **How does it handle length?** Short-form (tweets, headlines) vs. long-form (essays, chapters)?

7. **What about the feedback loop?** Built into ghost writer, or separate skill?

---

## Summary

The ghost writer skill should:

1. **Consume** the Voice DNA Document (especially the Ghost Writer Briefing)
2. **Generate** first drafts at ~80% accuracy to the author's voice
3. **Suppress** AI patterns identified in the anti-patterns reference
4. **Communicate** confidence based on DNA document readiness
5. **Enable** feedback that loops back to DNA discovery for refinement

The human always edits and finalizes. The ghost writer is a starting point, not a replacement.

---

_This document was created during the writing-dna-discovery skill development session. Use it as the foundation for building the ghost writer skill._
