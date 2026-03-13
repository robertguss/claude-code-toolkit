# Research Sources & Search Patterns

## Reddit Research

Reddit surfaces unmet demand that App Store charts never show.

### High-Value Search Queries

Use web search with these patterns:

```
site:reddit.com "is there an app" {category/problem}
site:reddit.com "looking for an app" {category/problem}
site:reddit.com "I wish" {competitor app name}
site:reddit.com "switched from" {competitor app name}
site:reddit.com "alternative to" {competitor app name}
site:reddit.com "{category}" app recommendation
```

### Key Subreddits by Category

| Category         | Subreddits                                                       |
| ---------------- | ---------------------------------------------------------------- |
| General app recs | r/AppRecommendations, r/iphone, r/ios, r/androidapps             |
| Productivity     | r/productivity, r/ADHD, r/GetStudying, r/bulletjournal           |
| Health & Fitness | r/fitness, r/loseit, r/running, r/meditation, r/sleep            |
| Finance          | r/personalfinance, r/YNAB, r/budgeting, r/financialplanning      |
| Mental Health    | r/anxiety, r/depression, r/selfimprovement, r/DecidingToBeBetter |
| Parenting        | r/parenting, r/daddit, r/Mommit, r/NewParents                    |
| Food & Cooking   | r/MealPrepSunday, r/EatCheapAndHealthy, r/Cooking                |
| Education        | r/learnprogramming, r/languagelearning, r/GetStudying            |
| Travel           | r/travel, r/solotravel, r/digitalnomad                           |
| Lifestyle        | r/minimalism, r/declutter, r/organization                        |

### What to Extract from Reddit

- **Unmet needs:** Posts asking "is there an app that..." with no good answer
- **Pain points:** Complaints about existing apps (features, pricing, UX)
- **Switching triggers:** Why users left one app for another
- **Willingness to pay:** Comments about pricing ("I'd pay $X for...")
- **Feature requests:** Highly upvoted feature suggestions on app subreddits

## Google Trends Validation

Before committing to an opportunity, verify search demand:

1. **Navigate to:** `https://trends.google.com/trends/`
2. **Search the core problem keyword** (e.g., "sleep tracker app", "habit
   tracker")
3. **Check 5-year trend:** Rising = green light, declining = caution, stable =
   okay
4. **Compare related terms:** See what variations are growing fastest
5. **Check seasonality:** Fitness peaks in January, tax apps in spring, etc.

### Interpreting Trends

- **Rising >50% YoY:** Strong signal — growing demand, may not be saturated yet
- **Stable:** Proven demand, but competition is likely established
- **Declining:** Avoid unless you've found a specific underserved angle
- **Seasonal spikes:** Plan launch timing around peak interest

## Cross-Platform Gap Detection

Look for opportunities where demand exists but supply is weak on iOS:

### Android → iOS Gaps

1. Browse Google Play top charts in the same category
2. Identify apps with 1M+ installs on Android
3. Search the App Store for equivalents
4. If no strong iOS equivalent exists → high-confidence opportunity

### Web → Mobile Gaps

1. Search Product Hunt for recently launched web tools in the category
2. Check if they have a native mobile app
3. Popular web tools without mobile apps = opportunity (especially if the use
   case is mobile-native)

### International → US Gaps

1. Check App Store charts in other countries (UK, Germany, Japan, South Korea)
2. Identify top apps not available or not localized for the US market
3. Successful international apps with no US presence = validated concept

### How to Browse Other Countries

Change the country code in the App Store URL:

- UK: `apps.apple.com/gb/charts/iphone/...`
- Germany: `apps.apple.com/de/charts/iphone/...`
- Japan: `apps.apple.com/jp/charts/iphone/...`
- Australia: `apps.apple.com/au/charts/iphone/...`
- Canada: `apps.apple.com/ca/charts/iphone/...`
- South Korea: `apps.apple.com/kr/charts/iphone/...`
- Brazil: `apps.apple.com/br/charts/iphone/...`
- India: `apps.apple.com/in/charts/iphone/...`

## Indie Hacker Revenue Intelligence

Real revenue data beats estimates. Search these sources:

### IndieHackers.com

```
site:indiehackers.com {category} revenue
site:indiehackers.com {app name}
```

Browse: `https://www.indiehackers.com/products` — filter by revenue range and
category.

### Twitter/X Revenue Reports

```
site:twitter.com "{category} app" "revenue" OR "MRR" OR "ARR"
site:twitter.com "{category} app" "$" "month"
```

Indie devs frequently share monthly revenue screenshots. Search for:

- `#buildinpublic {category}`
- `#indiehackers {category} revenue`

### Other Sources

- **MicroConf talks:** Search YouTube for `microconf {category}` — founders
  share detailed revenue breakdowns
- **Starter Story:** `https://www.starterstory.com/` — founder interviews with
  revenue data
- **AppFigures / Sensor Tower blogs:** Sometimes publish category revenue
  reports

## Product Hunt & Alternative Discovery

### Product Hunt

Browse `https://www.producthunt.com/` for recently launched apps in the space:

- See what's being built (market direction)
- Check upvote counts (demand signal)
- Read comments for feature requests and criticism

### AlternativeTo

Browse `https://alternativeto.net/` — search for competitor apps to find:

- What users are looking for alternatives to (dissatisfaction signal)
- Which alternatives have the most "likes" (demand signal)
- User comments explaining why they switched
