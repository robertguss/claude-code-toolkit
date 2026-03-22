# iOS App Store Optimization (ASO) Guide

ASO drives ~40% of app discovery. Get this right and you have a free,
compounding growth channel.

## How App Store Search Works

Apple indexes these fields for search:

| Field          | Char Limit | Indexed? | Visible?    | Priority |
| -------------- | ---------- | -------- | ----------- | -------- |
| App Name       | 30 chars   | Yes      | Yes         | Highest  |
| Subtitle       | 30 chars   | Yes      | Yes         | High     |
| Keyword Field  | 100 chars  | Yes      | No (hidden) | High     |
| In-App Purchase names | N/A | Yes      | Partial     | Low      |
| Developer Name | N/A        | Yes      | Yes         | Low      |

**NOT indexed:** Full description, "What's New" text, review content.
(Unlike Google Play, Apple does NOT search the description.)

## Keyword Research Process

### Step 1: Brainstorm Seed Keywords

Start with 20-30 keywords a user might search:

- Core function ("habit tracker", "sleep sounds")
- Problem being solved ("can't sleep", "track spending")
- Category terms ("productivity app", "fitness tracker")
- Competitor names (yes, you can rank for these)
- Synonyms and variations ("journal" vs "diary" vs "log")

### Step 2: Evaluate Keywords

For each keyword, assess:

- **Relevance:** Does it describe what your app does? (Must be high)
- **Search volume:** Are people actually searching this? (Check autocomplete in
  App Store search — if it autocompletes, it has volume)
- **Competition:** How many strong apps rank for this? (Search it and see)
- **Difficulty:** Can you realistically rank on page 1?

### Step 3: Prioritize by Opportunity

| Keyword Type        | Volume | Competition | Strategy                          |
| ------------------- | ------ | ----------- | --------------------------------- |
| Head terms          | High   | Very High   | Put in app name if possible       |
| Mid-tail            | Medium | Medium      | Subtitle and keyword field        |
| Long-tail           | Low    | Low         | Keyword field, easy wins          |
| Competitor names    | Medium | Low         | Keyword field (legal and common)  |
| Misspellings        | Low    | Very Low    | Keyword field, free traffic       |

### Step 4: Optimize the Keyword Field

The 100-character keyword field is your most underutilized asset:

**Rules:**
- Comma-separated, no spaces after commas
- Do NOT repeat words already in your app name or subtitle
- Do NOT use "app", "free", or category names Apple adds automatically
- Use singular OR plural, not both (Apple matches both)
- Include common misspellings of competitor names
- Use the full 100 characters — every character counts
- Separate word fragments get combined by Apple's algorithm

**Example:**
App name: "ZenSleep - Sleep Sounds"
Subtitle: "White Noise & Relaxation"

Keyword field (100 chars):
```
insomnia,meditation,calm,rain,ocean,fan,nature,bedtime,nap,rest,snore,baby,asmr,anxiety,stress,focus
```

Notice: no "sleep", "sounds", "white", "noise", or "relaxation" — those are
already in the name/subtitle.

## Screenshot Strategy

Screenshots are the #1 conversion factor after the app name/icon.

### Best Practices

1. **First screenshot is critical** — it's the only one most people see in search results
2. **Show the app in use**, not just UI — demonstrate the value proposition
3. **Add captions** — short, benefit-focused text above/below the screenshot
4. **Use all 10 slots** — more screenshots = more real estate in search results
5. **Design for 6.7" (iPhone Pro Max)** — this is the required size, others
   are generated automatically

### Screenshot Sequence Formula

| Position | Purpose                | Caption Example                     |
| -------- | ---------------------- | ----------------------------------- |
| 1        | Hero shot — core value | "Track your habits effortlessly"    |
| 2        | Key differentiator     | "Beautiful insights at a glance"    |
| 3        | Social proof / stats   | "Join 50,000+ users" (if applicable)|
| 4        | Feature highlight #1   | "Smart reminders that work"         |
| 5        | Feature highlight #2   | "Customizable to your routine"      |
| 6        | Feature highlight #3   | "Privacy-first — your data stays local" |
| 7        | Onboarding ease        | "Set up in 30 seconds"              |
| 8        | Design quality         | "Dark mode & widgets included"      |
| 9        | Premium features       | "Unlock powerful analytics"         |
| 10       | Call to action         | "Start your free trial today"       |

## App Preview Video

- **Length:** 15-30 seconds (shorter is better — most people won't watch 30s)
- **Format:** Show the app being used, not a cinematic trailer
- **First 3 seconds:** Must hook — show the core value immediately
- **No text-only frames** — Apple may reject
- **Autoplay:** Videos autoplay on mute in search results — make it visually
  compelling without audio

## Subtitle Optimization

The subtitle is prime real estate — 30 characters that appear in search results.

**Good subtitles:**
- "Smart Habit Tracker & Streaks" (keyword-rich, benefit-clear)
- "Block Ads & Trackers Everywhere" (action + scope)
- "Budget Planner & Bill Tracker" (two keywords)

**Bad subtitles:**
- "The Best App Ever" (no keywords, no value)
- "Version 2.0" (wasted space)
- "By [Company Name]" (no value to user)

## App Name Strategy

Your app name has 30 characters. Use them wisely:

**Formula:** `{Brand Name} - {Primary Keyword Phrase}`

**Examples:**
- "Sentinel - Ad Blocker & Privacy" (brand + category + differentiator)
- "PennyPal - Budget with Your Pet" (brand + category + hook)
- "CozyFarm - Garden Sim Game" (brand + category)

**Rules:**
- Brand name first for memorability
- Dash separator is standard
- Include your #1 keyword phrase after the dash
- Don't stuff keywords — Apple rejects "spammy" names

## Localization for ASO

Localizing your App Store listing (even without translating the app itself)
gives you access to keyword rankings in other languages:

**High-value localizations for US developers:**
- Spanish (US has 40M+ Spanish speakers)
- French (Canadian market)
- Portuguese (Brazilian market)
- German (high-spending European market)
- Japanese (high ARPU, premium market)

You can localize just the metadata (name, subtitle, keywords, screenshots)
without localizing the app itself.

## ASO Iteration Cycle

ASO is not set-and-forget. Iterate monthly:

1. **Track rankings** for your target keywords (use App Store Connect or free tools)
2. **Monitor conversion rate** in App Store Connect analytics
3. **A/B test** screenshots and descriptions (available via App Store Connect
   product page optimization)
4. **Update keywords** based on what's working and trending
5. **Respond to reviews** — Apple considers developer engagement
6. **Update regularly** — apps updated recently rank higher than stale ones
