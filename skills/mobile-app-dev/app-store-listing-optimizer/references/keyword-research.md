# Keyword Research Methodology

Detailed reference for competitive keyword research across iOS App Store and
Google Play Store.

## Finding Competitors

### Direct Search

Search the target store for the app's primary function:

1. Type the most obvious search term (what a user would search)
2. Note the top 10-15 results — these are the direct competitors
3. Repeat with 3-5 variations of the search term
4. Track which apps appear across multiple searches (strongest competitors)

### Category Browsing

Browse the relevant category charts:

- **iOS:**
  `https://apps.apple.com/us/charts/iphone/{category-slug}/{category-id}`
- **Google Play:** `https://play.google.com/store/apps/category/{CATEGORY_ID}`

Document apps ranked #1-25 in the target category.

### Related Apps

On each competitor listing, scroll to "You Might Also Like" (iOS) or "Similar
apps" (Google Play). These surface competitors that may not rank for the same
keywords but compete for the same users.

## Extraction Techniques

### Title Keyword Extraction

For each competitor, break the title into individual keywords:

```
"Sleep Tracker - White Noise" → sleep, tracker, white, noise
"Calm Sleep: Meditation & More" → calm, sleep, meditation
```

Build a frequency table — keywords appearing in 3+ competitor titles are
high-value targets.

### Subtitle / Short Description Mining

Same process for subtitles (iOS) and short descriptions (Google Play). These
often contain the secondary keywords the developer is targeting.

### Description Keyword Density

For Google Play listings (where description is indexed):

1. Copy the full description text
2. Identify repeated terms (3+ occurrences)
3. Note terms appearing in the first paragraph (highest weight)
4. Look for keyword variations: "meditate", "meditation", "meditative"

### Screenshot Caption Analysis

Competitor screenshot captions reveal keywords they consider important enough to
show visually:

- Note exact phrases used in captions
- These often reflect the terms that convert best (tested by the competitor)
- Reuse the concept, not the exact copy

## Search Suggestion Mining

### App Store Search Suggestions

1. Open the App Store search bar
2. Type the first 2-3 letters of a target keyword
3. Note all auto-suggested completions — these reflect real search volume
4. Repeat for each primary keyword root

### Google Play Auto-Complete

Same process in Google Play search. Google Play suggestions tend to be longer
phrases (3-4 words), revealing long-tail opportunities.

## Keyword Categorization Framework

Organize the master keyword list into categories:

| Category        | Examples                         | Where to Use                |
| --------------- | -------------------------------- | --------------------------- |
| **Core**        | The app's primary function       | Title, subtitle             |
| **Feature**     | Specific capabilities            | Keywords field, description |
| **Benefit**     | Outcomes the user gets           | Subtitle, description       |
| **Audience**    | Who the app is for               | Description, keywords       |
| **Alternative** | Synonyms and related terms       | Keywords field              |
| **Competitor**  | Competitor names (use carefully) | Keywords field only         |
| **Problem**     | What the user is trying to solve | Description                 |

## Competitive Keyword Gap Analysis

Create a matrix showing which keywords each competitor targets:

```
| Keyword          | App A | App B | App C | App D | Opportunity |
| ---------------- | ----- | ----- | ----- | ----- | ----------- |
| sleep tracker    | Title | Title | Sub   | —     | Saturated   |
| insomnia help    | —     | Desc  | —     | —     | Low comp    |
| sleep sounds     | Sub   | Title | Title | Sub   | Moderate    |
| bedtime routine  | —     | —     | —     | Desc  | Open        |
```

Keywords marked "Open" or "Low comp" are the highest-priority targets.

## Character Budget Planning

Plan keyword allocation across available fields:

### iOS Budget

| Field       | Max Chars | Indexed? | Priority            |
| ----------- | --------- | -------- | ------------------- |
| App Name    | 30        | Yes      | Primary keyword     |
| Subtitle    | 30        | Yes      | Secondary keywords  |
| Keywords    | 100       | Yes      | All remaining terms |
| Description | 4000      | No       | Conversion only     |

**Total searchable characters: 160**

### Google Play Budget

| Field             | Max Chars | Indexed? | Priority               |
| ----------------- | --------- | -------- | ---------------------- |
| App Name          | 30        | Yes      | Primary keyword        |
| Short Description | 80        | Yes      | Secondary keywords     |
| Full Description  | 4000      | Yes      | All keyword variations |

**Total searchable characters: 4,110**

## Keyword Refresh Cadence

- Re-research keywords every 4-6 weeks after launch
- Monitor which keywords drive actual impressions (App Store Connect / Google
  Play Console analytics)
- Drop keywords with zero impressions after 2 update cycles
- Add trending terms from search suggestion mining
- Seasonal keywords (holiday, back-to-school, new-year) should rotate in/out on
  schedule
