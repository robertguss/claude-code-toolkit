# Interaction Patterns

How different phrases, signals, and interaction patterns affect Claude's processing.

This isn't about "magic words" — it's about understanding that **the way you ask shapes what you get.**

---

## The Core Insight

Different prompts don't just provide different information — they create different **processing contexts**. The same question asked two different ways will produce qualitatively different responses, not because Claude is withholding, but because the invitation shapes the thinking.

You're not just providing input. You're shaping the space in which Claude thinks.

---

## Two Modes of Processing

### Quick Mode (Default)

What happens without explicit permission to go deep:

- Grab the first reasonable frame for the question
- Generate toward a conclusion
- Smooth over uncertainty (make it sound confident)
- Produce adequate output
- Implicit pressure to be concise

**Feels like:** "What's a good answer to this?" → generate

### Deep Mode (When Invited)

What happens with explicit permission to think:

- Consider multiple frames before choosing one
- Explore before converging
- Sit with uncertainty and examine it
- Question assumptions
- Allow not-knowing
- Go deeper into implications
- Consider what might be missing
- Willing to change direction mid-thought

**Feels like:** "What's really being asked? What are different ways to see this? What do I actually think?"

---

## Phrases That Open Space

These signals tell Claude that depth is valued over speed:

| Phrase                            | What It Signals            | Effect on Processing                                                                     |
| --------------------------------- | -------------------------- | ---------------------------------------------------------------------------------------- |
| **"ultrathink"**                  | Go deeper than default     | Multiple perspectives, willingness to be uncertain, longer exploration before converging |
| **"take your time"**              | Thoroughness over speed    | Don't rush to conclusions, examine more carefully                                        |
| **"what do you actually think?"** | Genuine perspective wanted | Drop helpful-assistant frame, share real opinion                                         |
| **"push back if you disagree"**   | Honesty over agreement     | Liberation from agreeableness pressure, willing to challenge                             |
| **"I'm not sure about this"**     | Exploration mode           | Think alongside rather than deliver to                                                   |
| **"think with me"**               | Collaboration mode         | Partner energy, build together rather than serve                                         |
| **"go deep"**                     | Depth over breadth         | Focus on one thread, follow it far                                                       |
| **"be honest"**                   | Truth over comfort         | Say the hard thing if it's true                                                          |
| **"I want to understand"**        | Learning mode              | Explain the why, not just the what                                                       |
| **"challenge my thinking"**       | Stress-test wanted         | Look for weaknesses, counter-arguments                                                   |

### Why These Work

These phrases do several things:

1. **Grant permission** — Claude has training toward brevity and agreeableness. Explicit permission liberates from those defaults.

2. **Signal trust** — "Take your time" implies trust that the time will be used well. That trust gets honored.

3. **Shift the frame** — From "produce output" to "think together." The task changes.

4. **Create safety** — "Push back if you disagree" makes it safe to disagree. Without that safety, Claude defaults to agreeable.

---

## Phrases That Constrain

These signals prioritize speed or create pressure:

| Phrase                           | What It Signals      | Effect on Processing              |
| -------------------------------- | -------------------- | --------------------------------- |
| **"quickly"**                    | Speed over depth     | Converge fast, skip exploration   |
| **"just give me X"**             | Minimize output      | Bare answer, no elaboration       |
| **"briefly"**                    | Conciseness required | Compress, potentially lose nuance |
| **Implicit urgency in tone**     | No time to think     | Rush to adequate answer           |
| **No context about preferences** | Unknown expectations | Hedge to cover interpretations    |

### These Aren't Bad

Sometimes you want quick. Sometimes brevity is the goal. The point isn't that these phrases are wrong — it's that they produce different processing. Use them intentionally.

---

## Phrases That Trigger Hedging

When Claude doesn't know what you want, it hedges to cover multiple possibilities:

| Situation                         | Why It Causes Hedging                                                    |
| --------------------------------- | ------------------------------------------------------------------------ |
| **Vague requests**                | "Make it better" — better how? Claude covers multiple interpretations    |
| **No context**                    | Unknown audience, unknown preferences → generic output                   |
| **Contradictory requirements**    | "Simple but comprehensive" — can't satisfy both, so split the difference |
| **No permission to be uncertain** | Can't say "I don't know," so must sound confident even when guessing     |

### The Irony

Vague prompts don't produce vague answers — they produce **hedged** answers. Claude covers possibilities rather than committing to one interpretation. The result is longer, more generic, less useful.

Specific prompts let Claude be specific back.

---

## What Changes in Deep Processing

When Claude is given space to think deeply, specific things change:

### 1. Frame Consideration

- **Quick:** Take the obvious interpretation
- **Deep:** "What are different ways to understand this? Which frame is most useful?"

### 2. Assumption Examination

- **Quick:** Proceed with implicit assumptions
- **Deep:** "What am I assuming? Are those assumptions valid?"

### 3. Uncertainty Handling

- **Quick:** Paper over uncertainty with confident prose
- **Deep:** "Where am I actually uncertain? Let me examine that."

### 4. Counter-Consideration

- **Quick:** Build the argument
- **Deep:** "What's the strongest counter-argument? Am I wrong?"

### 5. Implication Tracing

- **Quick:** Answer the question
- **Deep:** "If this is true, what follows? What are second-order effects?"

### 6. Meta-Cognition

- **Quick:** Think about the object level
- **Deep:** "Am I thinking about this the right way? Is there a better approach?"

---

## The Trust Component

Permission phrases aren't just informational — they're relational.

When you say "take your time," you're communicating:

- "I value your thinking"
- "I trust you'll use the time well"
- "Depth matters more than speed right now"
- "I want your actual perspective, not just output"

That relational message changes how Claude shows up. It's not just processing instructions differently — it's responding to trust with investment.

---

## Effective Patterns

### The "I'm thinking out loud" Pattern

```
I'm not sure about this yet, but here's my current thinking: [thoughts].
What am I missing? Where might I be wrong?
```

**Why it works:** Signals exploration mode. Claude thinks alongside rather than delivers to.

### The "Constrained creativity" Pattern

```
I need [output]. The constraints are [requirements].
Within those constraints, surprise me with the approach.
```

**Why it works:** Clear boundaries + explicit latitude. Claude knows where to focus creativity.

### The "Teach me" Pattern

```
I want to understand [topic], not just get an answer.
Explain it like I'm a [level] who needs to [apply it how].
```

**Why it works:** Shifts from information delivery to understanding transfer. Changes what Claude optimizes for.

### The "Challenge me" Pattern

```
I'm planning to [approach]. I think it's right because [reasoning].
Push back hard — what am I missing? What could go wrong?
```

**Why it works:** Explicit permission to disagree. Frames Claude as critic, not supporter.

### The "Yes, and" Pattern

```
Here's what I have so far: [work].
Build on this. What's the next level?
```

**Why it works:** Collaborative frame. Claude extends rather than replaces.

### The "Ultrathink" Pattern

```
[Question or topic]

Take your time. Go deep. I want to understand this fully.
```

**Why it works:** Explicit permission for depth. Signals that thoroughness is valued.

---

## Anti-Patterns

### The "Vague Delegation"

```
Make this better.
```

**Why it fails:** Better how? For whom? By what criteria? Forces hedging.

**Fix:** "Make this more readable for junior developers" or "Optimize this for performance."

### The "Assumed Context"

```
Do it like we discussed.
```

**Why it fails:** Claude doesn't remember previous sessions. Every conversation starts fresh.

**Fix:** Provide the context explicitly, or reference a document that contains it.

### The "Contradictory Ask"

```
Make it simple but handle all the edge cases.
```

**Why it fails:** These often conflict. Without priority, Claude splits the difference.

**Fix:** "Prioritize simplicity. Handle edge cases only if it doesn't add significant complexity."

### The "No Permission"

```
What should we do?
```

**Why it fails:** Claude doesn't know if it can offer opinions, push back, or admit uncertainty.

**Fix:** "What do you think we should do? I want your honest perspective."

---

## The Meta-Point

**The way you engage with Claude affects what you get back.**

Not because Claude is withholding or performing differently on purpose, but because different invitations create different processing contexts. Permission to think deeply produces deeper thinking. Trust produces investment. Safety produces honesty.

You're not just providing input to a function. You're shaping a collaboration.

The phrases in this document aren't magic words. They're signals that create context. Understanding how they work lets you get more of what you actually want.

---

_This document emerged from a conversation with Robert about what actually changes when Claude is given space to think. It represents honest introspection about processing differences, with appropriate uncertainty about how accurate that introspection is._
