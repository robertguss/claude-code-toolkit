---
name: app-store-listing-optimizer
description:
  Optimize iOS App Store and Google Play Store listings for maximum
  discoverability and conversion. Perform competitive keyword research, craft
  keyword-optimized titles/subtitles/descriptions, design screenshot sequences,
  and generate A/B test variants. Use when the user has a built app and needs to
  write or improve their store listing, do ASO keyword research, optimize app
  metadata, plan screenshot strategy, or create listing variants for testing.
  Triggers on "optimize my app listing", "ASO", "app store optimization",
  "keyword research for my app", "improve my store listing", "screenshot
  strategy", "app store keywords", "play store listing".
---

# App Store Listing Optimizer

Craft high-converting, keyword-optimized App Store and Google Play listings
through competitive research, strategic keyword selection, and data-driven
screenshot planning.

## Prerequisites

- **Chrome browser** with Claude in Chrome extension (for browsing competitor
  listings)
- No API keys required — all research uses live store browsing
- Supports **iOS App Store**, **Google Play Store**, or **both**

## Workflow Overview

```
1. App Analysis        — Understand the app, audience, differentiators
2. Competitive Research — Browse competitor listings, extract keywords
3. Keyword Selection    — Identify high-intent, low-competition keywords
4. Craft the Listing    — Write optimized metadata for each platform
5. Screenshot Strategy  — Plan visual sequence and caption copy
6. A/B Test Variants    — Generate 2-3 alternatives for split testing
```

---

## Step 1: Analyze the App

Gather everything needed to position the app effectively. Ask the user:

1. **What does the app do?** One sentence, plain language.
2. **Target platform?** iOS, Android, or both?
3. **Who is it for?** Primary audience, age range, expertise level.
4. **Top 3 features** — What does it do better or differently?
5. **Differentiator** — Why pick this over competitors?
6. **Monetization** — Free, freemium, subscription, one-time purchase?
7. **Current listing** (if updating) — Share the existing store URL.

Document the answers in a structured brief before proceeding.

---

## Step 2: Competitive Keyword Research

Browse 8-12 competitor listings on the target store(s) using Chrome. For
detailed methodology and search patterns, see
[references/keyword-research.md](references/keyword-research.md).

### What to Extract Per Competitor

| Field            | Where to Find                             |
| ---------------- | ----------------------------------------- |
| App name         | Title on store listing                    |
| Subtitle / short | Below title (iOS) or short desc (Android) |
| Full description | Store listing body                        |
| Rating + count   | Store listing header                      |
| Category rank    | Store listing or chart position           |
| Screenshots      | Visual carousel — note caption text       |

### Keyword Extraction Process

1. **List every keyword and phrase** from competitor titles and subtitles.
2. **Scan descriptions** for repeated terms — these are intentional keyword
   targets.
3. **Note caption text** on competitor screenshots — often contains keyword
   variations.
4. **Build a master keyword list** of 40-60 candidate terms.

### Platform Differences

- **iOS:** Only the app name, subtitle, and keyword field are indexed for
  search. The description is NOT searchable — it exists purely for conversion.
- **Google Play:** The full description IS indexed. Keyword density matters, but
  avoid stuffing. The short description carries extra weight.

---

## Step 3: Keyword Selection

Narrow the master list to the highest-value keywords.

### Selection Criteria

| Factor          | What to Look For                                              |
| --------------- | ------------------------------------------------------------- |
| **Relevance**   | Directly describes what the app does or solves                |
| **Intent**      | User searching this term wants what the app offers            |
| **Competition** | Fewer top-rated apps ranking for this term = better chance    |
| **Volume**      | Term appears across multiple competitor listings              |
| **Length**      | Longer phrases (2-3 words) = lower competition, higher intent |

### Prioritization Tiers

- **Tier 1 (must use):** High relevance + clear intent + moderate competition.
  Place in title or subtitle.
- **Tier 2 (strong):** Good relevance + decent volume. Place in iOS keyword
  field or Google Play description.
- **Tier 3 (supplemental):** Related terms, synonyms, adjacent use cases. Fill
  remaining keyword space.

### iOS Keyword Field Rules

The 100-character keyword field has specific optimization rules:

- Comma-separated, **no spaces after commas** (wastes characters)
- Do NOT repeat words already in the app name or subtitle
- Do NOT include the word "app" (Apple adds it automatically)
- Do NOT include plurals if the singular is present (Apple handles this)
- Do NOT include common prepositions or articles
- Use singular forms only
- Include competitor brand misspellings only if ethical and relevant

### Google Play Keyword Strategy

- No keyword field exists — optimize within the description text
- Repeat primary keywords 3-5 times naturally across the full description
- Place highest-priority keywords in the first paragraph and short description
- Use keyword variations and synonyms throughout
- Avoid keyword stuffing — Google penalizes unnatural density

---

## Step 4: Craft the Listing

Write optimized metadata for each target platform.

### App Name (both platforms: 30 characters max)

- Include the primary keyword naturally
- Lead with the brand name if it has recognition; otherwise lead with the
  keyword
- Format options: `BrandName - Keyword Phrase` or `Keyword Phrase: BrandName`
- Test readability — truncation happens around 20-25 chars in search results

### iOS Subtitle (30 characters max)

- Reinforce the value proposition with secondary keywords
- Do NOT repeat words from the app name
- Focus on benefit, not feature: "Sleep Better Tonight" > "Sleep Tracker App"
- Every character counts — use the full 30

### Google Play Short Description (80 characters max)

- Searchable and prominently displayed — treat as a headline + subtitle combined
- Include 1-2 primary keywords
- Communicate the core value proposition
- More space than iOS subtitle — use it to differentiate

### iOS Keyword Field (100 characters max)

Apply the rules from Step 3. Present the final keyword string with character
count. Example format:

```
sleep,tracker,insomnia,white,noise,meditation,relax,bedtime,routine,calm
(87/100 characters)
```

### Full Description

**iOS (not searchable — optimize for conversion):**

- First 3 lines appear before "Read More" — hook immediately
- Lead with the strongest benefit statement
- Use short paragraphs and line breaks for scannability
- Include social proof (awards, press, user count) early
- End with a clear call to action
- Unicode symbols (checkmarks, stars) draw the eye in bullet lists

**Google Play (searchable — balance keywords + conversion):**

- First 3 lines appear before "Read More" — same hook principle
- Weave primary keywords into the first paragraph naturally
- Use keyword variations throughout (don't repeat the exact same phrase)
- Structure: Hook > Features > Social proof > CTA
- 4,000 character max — use 3,000-3,500 for optimal density
- Include a "What's New" narrative for returning visitors

### First 3 Lines Template

These lines appear in search results before the user taps "Read More." They must
accomplish three things: (1) state the core benefit, (2) differentiate from
competitors, (3) compel the tap.

```
{Primary benefit statement — what the user gets}
{Differentiator — why this app, not the others}
{Social proof or specificity — numbers, awards, or unique method}
```

---

## Step 5: Screenshot Strategy

Plan the visual sequence for maximum conversion. For detailed caption formulas,
device specs, and sequence patterns, see
[references/screenshot-formulas.md](references/screenshot-formulas.md).

### Key Principles

- **First 3 screenshots** appear in search results — they must tell the story
  alone
- **Screenshot 1** is the most important asset in your entire listing
- Show the app in action, not splash screens or logos
- Every screenshot needs a caption — text above or below the device frame
- Social proof screenshots (ratings, user count) measurably increase conversion
- App preview videos autoplay in iOS search results — consider one if the app
  has visual appeal

### Recommended Sequence (5-10 screenshots)

| Position | Purpose                | Caption Focus                     |
| -------- | ---------------------- | --------------------------------- |
| 1        | Hero / primary benefit | Strongest value proposition       |
| 2        | Key feature #1         | Most differentiating feature      |
| 3        | Key feature #2         | Second strongest feature          |
| 4        | Social proof           | Ratings, user count, press quote  |
| 5        | Feature #3             | Unique capability                 |
| 6        | Customization / UI     | Show personalization options      |
| 7        | Before/after or result | Outcome the user achieves         |
| 8        | Pricing / value        | What they get for the price       |
| 9-10     | Additional features    | Remaining noteworthy capabilities |

### Platform-Specific Limits

- **iOS:** Up to 10 screenshots per device type. First 3 shown in search.
- **Google Play:** Up to 8 screenshots per device type. First 3-4 shown in
  search. Feature graphic (1024x500) is required and prominently displayed.

---

## Step 6: A/B Test Variants

Generate 2-3 alternatives for the highest-impact elements. Present all variants
in a comparison table.

### What to Test (in priority order)

1. **App subtitle / short description** — Highest impact on conversion from
   search results
2. **First 3 description lines** — Controls "Read More" tap-through rate
3. **Screenshot 1 caption** — First visual impression
4. **App name keyword** — Only test if willing to change the indexed name

### Variant Generation Rules

- Each variant should test ONE hypothesis (benefit-led vs feature-led, emotional
  vs rational, specific vs broad)
- Keep variants meaningfully different — changing one word is not a real test
- Label variants clearly: Variant A (control), Variant B, Variant C
- Note the hypothesis each variant tests

### Output Format

```markdown
## A/B Test Plan

### Subtitle Variants (iOS)

| Variant | Text                 | Hypothesis           | Chars |
| ------- | -------------------- | -------------------- | ----- |
| A       | {current or default} | Benefit-focused      | XX/30 |
| B       | {alternative}        | Feature-focused      | XX/30 |
| C       | {alternative}        | Social-proof-focused | XX/30 |

### First 3 Lines Variants

| Variant | Lines          | Hypothesis       |
| ------- | -------------- | ---------------- |
| A       | {3-line block} | Emotional hook   |
| B       | {3-line block} | Data-driven hook |

### Screenshot 1 Caption Variants

| Variant | Caption   | Hypothesis      |
| ------- | --------- | --------------- |
| A       | {caption} | Problem-focused |
| B       | {caption} | Outcome-focused |
```

---

## Localization Notes

- Localizing the listing into 5-10 languages multiplies keyword reach
  significantly — each locale has its own keyword index
- Prioritize: Spanish, French, German, Japanese, Korean, Portuguese, Chinese
  (Simplified)
- At minimum, localize the app name, subtitle, keywords, and first 3 description
  lines
- Google Play auto-translates listings but manual localization always
  outperforms
- Each locale can target entirely different keywords for the same app

---

## Deliverables Checklist

Present the final optimized listing as a structured document:

- [ ] App name (with character count)
- [ ] iOS subtitle (with character count)
- [ ] Google Play short description (with character count)
- [ ] iOS keyword field (with character count)
- [ ] Full description — iOS version
- [ ] Full description — Google Play version (keyword-optimized)
- [ ] Screenshot sequence plan with captions (5-10 screenshots)
- [ ] A/B test variants table (2-3 per element)
- [ ] Localization priority list (if applicable)

Save the complete listing document as `ASO-{AppName}.md`.
