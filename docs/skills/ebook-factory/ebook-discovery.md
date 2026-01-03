# Ebook Discovery

> Surface ebook ideas you didn't know you had. Use when ready to discover what ebooks might be hiding in your content, expertise, or thinking.

## Overview

Ebook Discovery is the optional "upstream" skill that feeds into Concept Development. It's designed for divergent, generative exploration - answering "what's here?" rather than "is this right?"

This skill serves two types of creators equally well: those with published content to mine (blog posts, videos, newsletters, podcasts) and those with unpublished expertise (tacit knowledge that feels obvious to you but valuable to others). Both paths are rich territory for ebook discovery.

Claude operates as an active intellectual partner who contributes ideas proactively, not just a facilitator who asks questions. The skill emphasizes one question at a time, pushback with reasoning, and progressive disclosure of options rather than overwhelming menus.

## Quick Start

### Prerequisites
- Clarity on whether you have published content to mine or unpublished expertise to extract
- Willingness to explore and be challenged on viability
- A file location for your Discovery Tracker document

### Basic Usage

1. **Invoke the skill** when you want to explore what ebooks might be hiding in your work
2. **Answer the orientation question** about your content vs. expertise starting point
3. **Share your intent** (income, authority, audience service, passion project)
4. **Create the Discovery Tracker** document
5. **Explore entry modes** with Claude's guidance

## Features

### 11 Entry Modes for Discovery

The skill provides 11 distinct modes for uncovering ebook candidates, introduced progressively rather than as an overwhelming menu:

**Content-Based Modes** (mine what you've published):
| Mode | What It Finds |
|------|---------------|
| **Content Audit** | Patterns in blog posts, videos, newsletters, podcasts, teaching materials |
| **Book Extraction** | Sections from larger book projects that could stand alone |
| **Failed Project Resurrection** | Abandoned drafts and stalled projects (wrong format, not wrong idea?) |

**Audience-Based Modes** (learn from your readers/viewers):
| Mode | What It Finds |
|------|---------------|
| **Repeated Questions Analysis** | YouTube comments, email replies, questions after talks |

**Knowledge-Based Modes** (surface what you know):
| Mode | What It Finds |
|------|---------------|
| **Expertise Extraction** | Tacit knowledge that feels obvious to you but valuable to others |
| **Contrarian Positions** | Views that push against mainstream thinking |
| **Translation Bridges** | Things you explain between worlds you inhabit |
| **Personal Systems** | Workflows, processes, disciplines you've developed |

**Archive-Based Modes** (dig through your thinking):
| Mode | What It Finds |
|------|---------------|
| **Zettelkasten Mining** | Clusters of connected notes revealing ebook-shaped ideas |
| **Parking Lot Review** | Ideas parked during brainstorms, cross-project intersections |
| **Deep Archive Mining** | Book marginalia, reading responses, long emails, "I wish this existed" frustrations |

### Ebook-Specific Pressure Testing

Throughout discovery, Claude applies constant format-fit calibration:
- **Too thin?** Could be a blog post instead
- **Too thick?** Should be a full book
- **Ebook-shaped?** Natural scope of 10,000-25,000 words with focused transformation

### Viability Assessment

Candidates are evaluated against core viability criteria:
- Clear idea (1-2 sentences)
- Reader exists (specific person, not category)
- Transformation defined (concrete before/after)
- Author fit (unique perspective or experience)
- Ebook fit (genuinely 10,000-25,000 words)

## Workflow

### First Session Flow

```
1. Orientation Question
   "Do you have published content to mine, or unpublished expertise to extract?"

2. Recommend Starting Mode
   Claude suggests initial mode with reasoning

3. Intent Question
   "What's driving you to create ebooks?"

4. Create Tracker
   Establish the Discovery Tracker document

5. Begin Exploration
   Deep dive into selected mode
```

### During Exploration

- **Deep dives, not quick scans** - Each mode warrants full exploration
- **Active contribution** - Claude offers observations and candidate ideas
- **Light triage** - Viability assessment as candidates surface
- **Pattern recognition** - Cross-cutting themes often reveal strongest candidates
- **Contextual transitions** - New modes introduced when relevant

### Session End

1. Update the tracker with current state
2. Review candidates surfaced this session
3. Note where to pick up next
4. Identify candidates ready for Concept Development

### Returning Sessions

When returning with an existing tracker:
1. Claude reads tracker to orient
2. Status summary provided (modes explored, candidates, where you left off)
3. Focus direction requested
4. Skip orientation if context is clear

## Inputs & Outputs

### Inputs

| Input | Description |
|-------|-------------|
| **Content inventory** | Blog posts, videos, newsletters, podcasts, teaching materials |
| **Expertise areas** | Professional skills, hard-won knowledge, unique perspectives |
| **Intent** | Income, authority, audience service, lead generation, passion |
| **Existing material** | Drafts, notes, Zettelkasten, parked ideas |

### Outputs

**Discovery Tracker** containing:
- User profile (content inventory, expertise areas, intent)
- Exploration log (which modes explored, how deeply)
- Candidates with viability ratings and reasoning
- Patterns and insights across candidates
- Session notes for multi-session continuity

**Handoff Summary** for selected candidate:
- Core idea (1-2 sentences)
- Source (which mode, what material)
- Ebook-shaped assessment
- Viability notes with reasoning
- Known concerns

## Best Practices

### Do
- **Start with your strongest path** - Content creators start with Content Audit, expertise holders with Expertise Extraction
- **Go deep before going wide** - Explore one mode thoroughly before switching
- **Trust Claude's pattern recognition** - Cross-cutting themes often reveal the best candidates
- **Note validation signals** - High engagement, repeat questions, direct requests
- **Be honest about energy** - Low energy = low completion probability

### Don't
- **Force all 11 modes** - Use what's relevant to your situation
- **Rush viability assessment** - Light triage during exploration, deeper assessment at transitions
- **Ignore "too thin" or "too thick" signals** - Format fit matters
- **Skip the intent question** - It shapes which candidates to prioritize
- **Treat this as brainstorming** - It's structured discovery with ebook-specific pressure

### Red Flags

| Warning Sign | What It Means |
|--------------|---------------|
| Can't state idea in 1-2 sentences | Not yet clear enough |
| "Everyone" as the reader | No specific audience |
| Vague transformation | Just information, not behavior change |
| "Anyone could write this" | No unique author fit |
| Stretching to fill pages | Too thin for ebook |
| Can't cut without losing essentials | Too thick for ebook |

## Integration

### Pipeline Position

Ebook Discovery is **Skill 0** - the optional upstream skill that feeds into Concept Development. Users with existing ideas can skip directly to Concept Development.

```
[Ebook Discovery] --> [Ebook Concept Development] --> [Ebook Architecture] --> ...
     (optional)
```

### Upstream Skills
None - this is the entry point to the pipeline.

### Downstream Skills
- **[Ebook Concept Development](./ebook-concept-development.md)** - Takes selected candidate and develops it into a structured concept with defined reader, transformation, promise, content source, and scope.

### Handoff Criteria

A candidate is ready for Concept Development when:
- Core idea stated in 1-2 sentences
- Source identified (which mode, what material)
- Appears ebook-shaped (not too thin, not too thick)
- Viability notes captured with reasoning
- Known concerns documented
- User has decided to pursue it

## Examples

### Example 1: Content Creator with YouTube Channel

**Situation:** YouTuber with 50K subscribers and 200+ videos on productivity topics.

**Discovery path:** Content Audit reveals a cluster of 8 videos on "morning routines" with unusually high engagement. Comments repeatedly ask for more detail on the "energy audit" concept mentioned in one video.

**Outcome:** Strong candidate identified - an ebook deep-diving the energy audit framework, expanding what couldn't fit in video format.

### Example 2: Professional with Unpublished Expertise

**Situation:** Engineering manager who's never published content but keeps getting asked how they handle difficult performance conversations.

**Discovery path:** Expertise Extraction surfaces the specific framework they've developed over 10 years. Repeated Questions Analysis (from 1-on-1s and conference chats) validates demand.

**Outcome:** Candidate for an ebook on performance conversation frameworks for engineering managers.

### Example 3: Writer with Abandoned Projects

**Situation:** Writer with three abandoned book projects, each stalled around 15,000 words.

**Discovery path:** Failed Project Resurrection reveals all three projects stalled because they were "too big." Each could be ebook-sized if scope was narrowed. One project on "writing habits" still generates enthusiasm.

**Outcome:** Resurrection of the writing habits project as an ebook with tighter scope.

### Example 4: Multi-Domain Expert

**Situation:** UX designer who also does improv comedy and has been explaining design thinking to comedy people and performance skills to designers.

**Discovery path:** Translation Bridges surfaces unique insights from bridging these worlds. Personal Systems reveals a specific warm-up routine adapted from improv for design brainstorming sessions.

**Outcome:** Ebook on applying improv principles to design workshops - unique positioning at the intersection.

## Reference Files

The skill includes these reference documents loaded as needed:

| Reference | Purpose |
|-----------|---------|
| `entry-modes-guide.md` | Deep guidance for all 11 discovery modes |
| `expertise-extraction-guide.md` | Dedicated support for the harder unpublished expertise path |
| `candidate-assessment.md` | Viability criteria, examples, validation signals |
| `discovery-anti-patterns.md` | Common problems and interventions |
| `prioritization-guide.md` | Choosing among candidates, series thinking |
| `content-transformation.md` | How different content types become ebooks |
| `discovery-questions.md` | Powerful question toolkit |

## Templates

| Template | Purpose |
|----------|---------|
| `discovery-tracker-template.md` | Living document for tracking discovery progress |
| `handoff-summary-template.md` | Clean handoff to Concept Development |
