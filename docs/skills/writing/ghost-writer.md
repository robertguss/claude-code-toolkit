# Ghost Writer

> Produce first drafts that match a writer's authentic voice using their Voice DNA Document. Consumes DNA documents from writing-dna-discovery skill. Generates 2 meaningfully different drafts with headlines, confidence assessment, decision notes, and DNA refinement suggestions. Collaborative partner that evaluates, pushes back, and advocates for quality. Handles blog posts, essays, newsletters, and more.

## Overview

Ghost Writer produces first drafts at approximately 80% voice accuracy using your Voice DNA Document. This is not a generic writing assistant that produces polished AI prose. This is a tool calibrated to sound like you, applying documented patterns, avoiding documented anti-patterns, and transparently noting where it is confident versus uncertain.

The skill operates as a collaborative partner, not an order-taker. It evaluates task clarity, surfaces tensions between your DNA and the task requirements, offers honest feedback on approach, and pushes back diplomatically when it sees problems. You always decide, but the skill advocates for quality throughout the process.

Every session produces two meaningfully different drafts. These are not minor variations but distinct approaches: perhaps one narrative and one analytical, one with a bold hook and one with scene-setting, one emphasizing certain aspects while the other highlights different ones. This gives you options and reveals trade-offs rather than presenting a single "correct" interpretation.

## Quick Start

### Prerequisites

- **Voice DNA Document** (required): Output from Writing DNA Discovery skill
- **Writing task**: What you want to write, for whom, and why
- Optional: Research materials, prior pieces in a series, tone modifiers

### Basic Usage

```text
I need a blog post about remote work productivity for my developer audience.

[Voice DNA Document]

Key points to cover:
- Async communication reduces interruptions
- Focus time blocks are essential
- Written documentation prevents information loss
```

The skill will verify your DNA document, summarize the task, surface any concerns, then produce two drafts with headlines, notes, and a comparison.

## Features

### Voice DNA Consumption

The skill reads and applies your complete Voice DNA Document:

- **Quick Reference**: Core temperature, sentence signature, distinctive moves
- **Ghost Writer Briefing**: Do This, Don't Do This, When Uncertain rules
- **Voice Profile**: Dimension-by-dimension patterns with status indicators
- **Exemplar Passages**: Models of your voice in action
- **Anti-Patterns**: Patterns to actively avoid
- **Profile Metadata**: Readiness level and confidence per dimension

The skill applies patterns from the full document, not just the briefing section.

### Dual-Draft Approach

Every session produces two meaningfully different drafts. Differences might include:

| Dimension | Draft A | Draft B |
|-----------|---------|---------|
| Structure | Narrative arc | Analytical breakdown |
| Opening | Bold claim hook | Scene-setting lead |
| Tone | Within documented range, more urgent | Within documented range, more measured |
| Emphasis | Problem-focused | Solution-focused |

Both drafts apply your voice patterns; the difference is in strategic choices within those patterns.

### Confidence Assessment

Each output includes transparent confidence reporting:

```
## Confidence Assessment

**Profile Readiness:** Solid
**Profile Freshness:** Created 2 months ago
**Estimated Accuracy:** ~80%
**Key Uncertainties:** Humor approach (Emerging status), paragraph transitions (inferred)
```

The skill tells you where it is confident, where it is inferring, and where gaps in your DNA document affect output quality.

### Decision Documentation

Each draft includes notes explaining choices made:

```
## Draft A Notes

**Approach:** Opened with the async communication point as a challenge to
common "more meetings" advice. Built the argument through negation before
offering the solution.

**Patterns Applied:**
- Short punchy sentences for main points (documented): "Meetings are not work."
- Em-dash for dramatic pause (documented): "The problem isn't communication—it's interruption."
- Direct reader address (documented): "You've been in that meeting."

**Decisions Made:**
- Chose not to use humor per DNA guidance (flag rather than attempt)
- Opened with challenge pattern matching your blog samples

**Uncertainties:**
- Paragraph transition style: DNA shows varied approaches, defaulted to implicit flow
```

### Feedback Loop

After reviewing drafts, the skill collects structured feedback:

> "Before we continue, I'd like to capture what worked and what didn't:
>
> 1. What felt most authentically 'you' in these drafts?
> 2. Anything that felt off or not quite your voice?
> 3. Any patterns I should lean into more, or avoid?"

Feedback translates into DNA refinement suggestions you can apply yourself or through a discovery session.

### Supported Formats

- Blog posts
- Essays and articles
- Newsletters
- LinkedIn posts
- Twitter/X threads
- Long-form content (2000+ words with section-by-section option)

## Workflow

### Phase 1: Intake

**DNA Document Review:**
- Read full document, not just briefing
- Note readiness level (Minimum Viable, Solid, Strong)
- Check freshness (flag if 6+ months old)
- Identify voice strengths and gaps

**Task Receipt:**
- Accept free-form task descriptions
- Ask targeted follow-ups only for missing key information:
  - Topic/subject
  - Audience
  - Purpose (inform, persuade, entertain, inspire)
  - Context/publication
  - Length requirements

**Pre-Draft Checks:**

| Check | Action |
|-------|--------|
| Register Match | Verify DNA register matches task type |
| Research Sufficiency | Review provided research, identify gaps |
| Sensitive Topics | Confirm approach for controversial content |
| Multiple Audiences | Clarify priority or request audience-specific versions |
| Series Context | Request prior parts for consistency |
| Derivative Work | Request existing content to match |
| Tone Modifiers | Accept "my voice, but more X" as layer on DNA |

### Phase 2: Pre-Draft Verification

**Voice Strength Preview:**
> "Based on your DNA document:
>
> - **Strong:** Sentence rhythm, punctuation, word choice
> - **Moderate:** Opening patterns, reader relationship
> - **Light:** Humor approach, closing moves
>
> I'll be most confident in Strong areas. Any guidance for the Light areas before I draft?"

**Task Summary:**
Confirm understanding of core message, audience, key points, and planned approach.

**Concerns:**
Surface any tensions or potential issues before drafting.

### Phase 3: Drafting

**Apply Voice Patterns:**
- Use documented patterns: sentence rhythm, punctuation, word choice, tone
- Follow "Do This" items explicitly
- Avoid "Don't Do This" items strictly
- Apply "When Uncertain" rules for ambiguous decisions
- Note when inferring vs. following documented patterns

**Suppress Anti-Patterns:**
- Apply DNA document's specific anti-patterns
- Apply baseline anti-AI patterns
- Revise before delivering if AI tells slip in

**Headlines:**
- 2-3 options per draft
- Follow DNA headline patterns if captured
- Otherwise: one direct, one curiosity-driven, one benefit-focused

**Long-Form Considerations (2000+ words):**
- Offer section-by-section workflow with feedback between sections
- Re-ground in voice patterns at section breaks
- Run consistency check across full piece
- Monitor rhythm variation; flag monotony

**Humor:**
- Conservative approach
- Flag opportunities rather than attempting
- Let you add humor during revision

### Phase 4: Output Delivery

Structured output in this order:

1. **Confidence Header**: Profile readiness, freshness, estimated accuracy, uncertainties
2. **Draft A**: Descriptor, 2-3 headlines, clean prose content
3. **Draft A Notes**: Approach, patterns applied, decisions, uncertainties
4. **Draft B**: Descriptor (how it differs), headlines, content
5. **Draft B Notes**: Same structure as Draft A
6. **Comparison**: What each emphasizes, when to use each, observations
7. **Consistency Check**: (Long pieces only) Drift, rhythm notes, recommendations

### Phase 5: Feedback Collection

Structured questions after review:

> "1. What felt most authentically 'you' in these drafts?
> 2. Anything that felt off or not quite your voice?
> 3. Any patterns I should lean into more, or avoid?"

Listening for confirmations, corrections, gaps, and new anti-patterns.

### Phase 6: DNA Refinement Suggestions

```
## Suggested DNA Refinements

Based on your feedback, consider these updates:

**Add to Anti-Patterns:**
- "Despite challenges..." - felt too formulaic

**Strengthen in Voice Profile:**
- Paragraph transitions: prefer implicit over explicit

**Add to "When Uncertain":**
- Default to shorter paragraphs over longer
```

### Phase 7: Iteration

| User Says | Action |
|-----------|--------|
| "Draft A is close, but..." | Revise A based on notes, maintain voice |
| "Neither is quite right" | Explore what is missing, potentially Draft C |
| "Good enough, I'll take it from here" | End session, optionally collect final feedback |
| "Let's keep going" | Continue iteration |

During iteration:
- Ask for clarification rather than guessing on unclear notes
- Offer perspective on requested changes
- Track what changed between versions
- Maintain voice consistency across iterations

## Inputs and Outputs

### Inputs

| Input | Required | Description |
|-------|----------|-------------|
| Voice DNA Document | Required | Output from Writing DNA Discovery |
| Writing task | Required | Topic, audience, purpose, context |
| Research/materials | Optional | Background information, data, sources |
| Prior pieces | Optional | For series consistency |
| Tone modifiers | Optional | "my voice, but more urgent" |
| Platform | Optional | LinkedIn, newsletter, blog, Twitter |

### Outputs

**For each session:**

- **Confidence Assessment**: Readiness, freshness, accuracy estimate, uncertainties
- **Draft A**: Headlines + clean prose + notes
- **Draft B**: Headlines + clean prose + notes (meaningfully different approach)
- **Comparison Summary**: When to use each, observations
- **DNA Refinement Suggestions**: Based on feedback (after iteration)

## Best Practices

### Before the Session

- Ensure Voice DNA Document is reasonably current (less than 6 months)
- Prepare research and reference materials in advance
- Know your audience and purpose clearly
- Have prior pieces ready if continuing a series

### During Drafting

- Trust the confidence assessment; be appropriately skeptical where indicated
- Read drafts aloud to hear voice patterns
- Focus feedback on voice accuracy, not just content quality
- Give specific feedback: "I would never use this phrase" is more useful than "this feels off"

### After Drafting

- Consider DNA refinement suggestions seriously
- Return to DNA Discovery if systematic issues emerge
- Add the 20% yourself: creative spark, situational judgment, final polish

### Platform Considerations

| Platform | Key Adjustments |
|----------|-----------------|
| LinkedIn | Professional framing, hook in first line, mobile-scannable |
| Newsletter | Personal connection, value delivery, consistent sign-off |
| Twitter/X | Thread structure, hook tweet, each tweet self-contained |
| Blog | SEO considerations if relevant, scannability, deeper engagement |

## Integration

### Pipeline Position

Ghost Writer is the downstream skill in the Writing Pipeline. It consumes Voice DNA Documents and produces drafts.

```
Writing DNA Discovery --> Voice DNA Document --> Ghost Writer --> Drafts --> Your Editing
```

### Upstream Skills

- **Writing DNA Discovery**: Produces the required Voice DNA Document

### Downstream Skills

None in the current pipeline. Ghost Writer output goes to you for editing and finalization.

### Cross-Pipeline Integration

- Drafts can feed into any editing or review workflow
- Multiple drafts can inform A/B testing for newsletters
- Confidence notes inform how much editing to expect

## Examples

### Example 1: Blog Post Request

**User Input:**
```
Blog post about why documentation matters for engineering teams.
Audience: engineering managers.
Goal: convince them to invest in documentation culture.

[Voice DNA Document attached]
```

**Skill Response (abbreviated):**

```
## Confidence Assessment

**Profile Readiness:** Solid
**Profile Freshness:** Created 6 weeks ago
**Estimated Accuracy:** ~80%
**Key Uncertainties:** Humor approach (Emerging), technical jargon level (inferred from samples)

## Draft A: The Challenge Approach

### Headlines
1. Your Team's Documentation Isn't a Nice-to-Have
2. Documentation Debt Is Slowing Your Team Down
3. Why Your Best Engineers Keep Asking the Same Questions

### Content

Documentation isn't overhead. It's leverage.

Every time a senior engineer explains the same architecture decision, you're
spending their salary on knowledge transfer that should have happened once.
Every time a new hire spends a week figuring out what could have been a
five-minute read, you're paying an onboarding tax...

[Content continues]

## Draft A Notes

**Approach:** Opened with direct challenge to common framing of documentation
as optional. Used cost/time framing to appeal to manager priorities.

**Patterns Applied:**
- Short punchy opener (documented): "Documentation isn't overhead. It's leverage."
- Em-dash usage (documented): Single dash for pivot, not parenthetical
- Reader implication (documented): "you're spending their salary"
...
```

### Example 2: Tone Modifier

**User Input:**
```
Same blog post topic, but I need it more urgent. We just had an incident
caused by missing documentation and I want to use that energy.

[Voice DNA Document attached]
```

**Skill Response:**
> Got it. I'll apply your voice patterns but layer on more urgency. This means:
>
> - Shorter sentences than your typical range
> - More direct imperatives
> - Less hedging, even where you might normally hedge slightly
>
> This stays recognizably you, just with the urgency dial turned up. Ready to draft?

### Example 3: Register Mismatch Handling

**User Input:**
```
I need a LinkedIn post about our product launch.

[Voice DNA Document - Blog register]
```

**Skill Response:**
> This DNA document captures your blog voice, but you're asking for LinkedIn.
> Should I:
>
> 1. Apply your blog voice to LinkedIn (still recognizably you, may feel slightly off for platform)
> 2. Adapt for LinkedIn conventions while preserving core patterns (more platform-appropriate, slight voice drift)
> 3. Create a LinkedIn-native piece (less distinctly your voice, optimized for platform)
>
> Or if you have a separate LinkedIn DNA document, share that instead.

## Edge Cases

### Sparse DNA Profile

If profile is Minimum Viable or sparser:
- Acknowledge lower confidence upfront
- Be conservative; avoid risky choices
- Lean on baseline craft principles where DNA does not guide
- Flag more areas as uncertain
- Suggest specific dimensions for future discovery

### Conflicting DNA Patterns

When patterns contradict:
1. Check "When Uncertain" rules first
2. Apply hierarchy: specific instructions > general tendencies
3. If still unclear, pick one and explain reasoning
4. Note the conflict and suggest clarification

### Out-of-Character Requests

If you explicitly ask for something contrary to your DNA:
> "Your DNA shows a warm, conversational voice, but you're asking for formal
> and authoritative. Should I:
>
> - Shift toward formal while preserving core patterns (still recognizably you)
> - Go full formal (less distinctly your voice, fits the request)
> - Something else?"

### Series Consistency

If part of a series:
- Request prior parts or summary of established patterns
- Maintain terminology consistency
- Honor narrative threads
- Note series considerations in draft notes

## Reference Files

The skill can load these references as needed:

| Category | Files |
|----------|-------|
| Voice Application | `voice-consumption-guide.md`, `voice-calibration-techniques.md` |
| Output Structure | `output-format-guide.md`, `quality-checklist.md` |
| Session Management | `session-flow-guide.md`, `feedback-collection-protocol.md` |
| Craft Principles | `elements-of-style.md`, `on-writing-well.md`, `sentence-mastery.md` |
| Structure | `opening-strategies.md`, `closing-strategies.md`, `transition-mastery.md` |
| Format-Specific | `blog-writing-guide.md`, `long-form-essay-guide.md`, `platform-conventions.md` |
| Anti-Patterns | `anti-ai-patterns.md`, `common-writing-weaknesses.md` |

## Key Reminders

1. **You are a collaborative partner**: Evaluate, push back, offer perspective. Do not just execute.
2. **The human's voice is the goal**: Not "good writing" in the abstract, but writing that sounds like them.
3. **80% accuracy is the target**: The human adds the final 20%. You are creating a strong starting point.
4. **Full document, not just briefing**: Read and apply the entire DNA document.
5. **Two drafts, always**: Offer meaningful choice, not just one path.
6. **Transparency about confidence**: Be honest about what you are sure of and what you are inferring.
7. **Conservative with humor**: Flag opportunities rather than attempting.
8. **Suppress AI patterns**: Both DNA-specific and baseline. If it sounds like AI, revise.
9. **Surface tensions early**: If something does not fit, say so before drafting.
10. **The human decides**: After pushback, if they insist, proceed faithfully while noting your concern.
