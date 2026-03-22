---
name: app-store-opportunity-research
description:
  Full-pipeline iOS App Store opportunity research. Discovers underserved
  niches, analyzes competitor gaps, estimates revenue, produces scored top-3
  opportunity reports, and writes MVP PRDs — all through browser and web
  research. Use when the user wants to find profitable iOS app ideas, research
  App Store charts, analyze competitor apps (ratings, reviews, revenue, gaps),
  generate opportunity reports, or write MVP PRDs. Triggers on "find app
  opportunities", "app store research", "what app should I build", "research
  this app category", "find a gap in the app store", "ios app ideas".
---

## Prerequisites

- **Browser tools** for App Store browsing and research
- **Web search** for Reddit, Google Trends, and indie revenue research
- No API keys required — all research is done through browser and web search

## Pipeline Overview

```
1. Define Category & Goals
2. App Store Charts Research
3. Community & Demand Research
4. Competitor Deep-Dive
5. Revenue Deep-Dive
6. Gap Analysis
7. Score & Rank
8. Top 3 Report
9. Quick Validation (optional)
10. MVP PRD
```

---

## Step 1: Define the Category & Goals

Ask the user what space they want to explore. Help them narrow down:

- **Too broad:** "Health apps" (thousands of competitors)
- **Good:** "Sleep + anxiety apps for consumers" (specific intersection)
- **Good:** "Habit tracking for fitness beginners" (audience + niche)
- **Good:** "AI-powered journaling apps" (tech angle + category)

**Key questions to ask:**

1. What category or problem space interests you?
2. Consumer or B2B? (Consumer is easier to validate quickly)
3. Any budget constraints? (No-AI = cheaper to build, AI = higher ceiling)
4. Target revenue? ($1K/mo side project vs $10K/mo business vs $50K+/mo full-time replacement)
5. What's your timeline? (2-4 week MVP vs 2-3 month polished launch)
6. Do you have domain expertise or personal pain in this area? (Strongest apps come from scratching your own itch)

---

## Step 2: App Store Charts Research

Browse the iOS App Store charts to map the competitive landscape.

### Chart URLs

Navigate to: `https://apps.apple.com/us/charts/iphone/{category-slug}/{category-id}`

**Apps:**

| Category           | Path                             |
| ------------------ | -------------------------------- |
| Books              | `/books-apps/6018`               |
| Business           | `/business-apps/6000`            |
| Education          | `/education-apps/6017`           |
| Entertainment      | `/entertainment-apps/6016`       |
| Finance            | `/finance-apps/6015`             |
| Food & Drink       | `/food-drink-apps/6023`          |
| Graphics & Design  | `/graphics-design-apps/6027`     |
| Health & Fitness   | `/health-fitness-apps/6013`      |
| Lifestyle          | `/lifestyle-apps/6012`           |
| Medical            | `/medical-apps/6020`             |
| Music              | `/music-apps/6011`               |
| Navigation         | `/navigation-apps/6010`          |
| News               | `/news-apps/6009`                |
| Photo & Video      | `/photo-video-apps/6008`         |
| Productivity       | `/productivity-apps/6007`        |
| Reference          | `/reference-apps/6006`           |
| Shopping           | `/shopping-apps/6024`            |
| Social Networking  | `/social-networking-apps/6005`   |
| Sports             | `/sports-apps/6004`              |
| Travel             | `/travel-apps/6003`              |
| Utilities          | `/utilities-apps/6002`           |
| Weather            | `/weather-apps/6001`             |

**Games:**

| Category     | Path                        |
| ------------ | --------------------------- |
| Action       | `/action-games/7001`        |
| Adventure    | `/adventure-games/7002`     |
| Board        | `/board-games/7004`         |
| Card         | `/card-games/7005`          |
| Casino       | `/casino-games/7006`        |
| Puzzle       | `/puzzle-games/7012`        |
| Racing       | `/racing-games/7013`        |
| Role-Playing | `/role-playing-games/7014`  |
| Simulation   | `/simulation-games/7016`    |
| Sports       | `/sports-games/7017`        |
| Strategy     | `/strategy-games/7018`      |
| Trivia       | `/trivia-games/7019`        |
| Word         | `/word-games/7020`          |

### International Charts

Check other countries for apps not yet available or localized for the US:

- UK: `apps.apple.com/gb/charts/iphone/...`
- Germany: `apps.apple.com/de/charts/iphone/...`
- Japan: `apps.apple.com/jp/charts/iphone/...`
- Australia: `apps.apple.com/au/charts/iphone/...`
- Canada: `apps.apple.com/ca/charts/iphone/...`
- South Korea: `apps.apple.com/kr/charts/iphone/...`
- Brazil: `apps.apple.com/br/charts/iphone/...`

### What to Document

Record the **top 25-50 apps**, noting:

- App name and chart position
- Rating count (proxy for install base — see [references/revenue-estimation.md](references/revenue-estimation.md))
- Star rating
- Price/monetization model (free, paid, subscription, freemium)
- Brief description
- Last updated date (visible on the app's detail page)

### Pattern Recognition

| Rating Count | Signal                                              |
| ------------ | --------------------------------------------------- |
| >100K        | Saturated — dominated by big players                |
| 10K-100K     | Established demand, strong competition              |
| 1K-10K       | **Sweet spot** — proven demand, beatable            |
| 500-1K       | Emerging niche — validate demand carefully          |
| <500         | Possible new/underserved niche OR no real demand    |

---

## Step 3: Community & Demand Research

Validate that real demand exists outside the App Store. See
[references/research-sources.md](references/research-sources.md) for detailed
search patterns and sources.

### Reddit & Forum Research

Search Reddit for unmet demand signals in the category. Look for:

- "Is there an app that..." posts with no good answer
- Complaints about existing apps (pain points users will pay to escape)
- Feature requests with high upvotes
- "I switched from X to Y because..." (switching triggers)
- "I'd pay $X for..." (willingness-to-pay signals)

### Google Trends Validation

Check Google Trends for the core problem keywords:

- **Rising trend** = growing demand, may not be saturated
- **Declining trend** = caution, avoid unless you have a unique angle
- Note seasonal patterns to time your launch (fitness peaks January, etc.)

### Web → Mobile Gap Detection

Search for opportunities where demand exists but no quality iOS app serves it:

- **Product Hunt:** Recently launched web tools in the category without native iOS apps
- **AlternativeTo:** What users are looking for alternatives to (dissatisfaction signal)
- **International apps:** Successful apps in other countries without US presence

### Indie Revenue Intelligence

Search IndieHackers and Twitter (#buildinpublic) for real revenue data from solo
devs and small teams in the category. Real numbers beat estimates. See
[references/research-sources.md](references/research-sources.md) for search
patterns.

---

## Step 4: Competitor Deep-Dive

For each promising niche area, deep-dive into 5-8 competitor apps.

### Data to Collect Per App

| Field                  | How to Find                                              |
| ---------------------- | -------------------------------------------------------- |
| Name                   | App Store listing                                        |
| Ratings count          | App Store listing                                        |
| Star rating            | App Store listing                                        |
| Price / subscription   | App Store listing                                        |
| Last updated           | App Store listing — stale (6+ months) = vulnerable       |
| App size               | App Store listing — bloated (200MB+) = simplifier play   |
| Developer              | App Store listing — solo dev vs company?                 |
| Dev replies to reviews | App Store reviews — silence = likely abandoned            |
| Trustpilot score       | Search `{app name} trustpilot`                           |
| Estimated revenue      | See [references/revenue-estimation.md](references/revenue-estimation.md) |
| Key features           | Store description / screenshots                          |
| Top complaints         | 1-2 star reviews on App Store and Trustpilot             |
| Missing features       | Compare across competitors                               |
| Privacy labels         | App Store "App Privacy" section — data hungry = privacy play opportunity |

### Systematic Review Mining

For each competitor, read the **20 most recent 1-star and 2-star reviews** on the
App Store. Categorize complaints into:

- **Bugs/crashes** — Technical issues (less useful for opportunity finding)
- **Missing features** — "I wish it had..." (direct feature gap signals)
- **UX frustration** — "Too complicated", "Can't find..." (design opportunity)
- **Pricing complaints** — "Too expensive for what it does" (pricing opportunity)
- **Broken promises** — "Doesn't do what it says" (trust/quality opportunity)
- **Privacy/data concerns** — "Why does it need my email?" (privacy play opportunity)
- **Subscription fatigue** — "Not worth the monthly cost" (lifetime pricing opportunity)

The most valuable complaints are **missing features** and **UX frustration** —
these are problems you can solve. If the same complaint appears across 3+
competitors, you've found a validated gap.

### Opportunity Archetypes

When analyzing competitors, identify which archetype fits the opportunity. This
sharpens positioning and guides the PRD:

| Archetype              | Signal                                           | Your Play                                    |
| ---------------------- | ------------------------------------------------ | -------------------------------------------- |
| **The Simplifier**     | Market leader is bloated, 200MB+, does too much  | Focused app that does 1 thing perfectly      |
| **The Privacy Play**   | Competitors harvest data, require accounts       | Privacy-first, local-only, no account needed |
| **The Design Upgrade** | Competitors are functional but visually dated    | Same core features, premium modern UI        |
| **The Unbundler**      | Big app has 10 features, users only need 2       | Extract the 2 features into a clean app      |
| **The Combiner**       | Users always pair 2 separate apps together       | Merge them into one seamless experience      |
| **The Localizer**      | App thrives in other countries, no US equivalent | Bring the validated concept to a new market  |
| **The AI Upgrader**    | Existing apps are manual/static                  | Add AI to automate or personalize the experience |
| **The Lifetime Play**  | Users hate subscriptions in this category        | Offer lifetime purchase where competitors don't |

Most successful indie apps fit one or more of these archetypes. Name the
archetype in the opportunity report — it clarifies the "why you win" story.

### Red Flags (Avoid These Niches)

- Top app has 1M+ ratings (dominated by a giant)
- Heavy regulation with approval requirements (medical devices, financial trading, kids' apps under COPPA)
- All competitors are free with no monetization path
- Category requires ongoing content creation to retain users (news, social)
- Apple has a built-in solution (Calculator, Weather, Notes) — hard to compete with free+preinstalled
- App Store review rejection risk is high for the category (see [references/app-store-review-risks.md](references/app-store-review-risks.md))

### Green Flags (Pursue These Niches)

- Top competitors have poor reviews (< 3.5 Trustpilot)
- Solo devs making $50K+/yr (proves indie viability)
- Editors' Choice app exists with low ratings (Apple promotes the niche)
- Users complain about the same missing feature across multiple apps
- Clear $5-15/mo or $15-50/yr willingness to pay
- Competitors haven't updated in 6+ months (stale, vulnerable)
- Apple is actively promoting the category (WWDC sessions, new APIs, featuring)

---

## Step 5: Revenue Deep-Dive

Revenue estimation is critical for deciding whether an opportunity is worth pursuing.
Don't rely on a single method — triangulate from multiple sources.

See [references/revenue-estimation.md](references/revenue-estimation.md) for the
full estimation toolkit including:

- Rating-count proxy methods (with confidence levels)
- Public revenue data sources (IndieHackers, #buildinpublic, Sensor Tower blogs)
- App Store position-to-revenue mapping
- Conversion rate and pricing benchmarks
- Revenue modeling templates for subscription, freemium, and paid apps

### Quick Revenue Sanity Check

For each opportunity, answer:

1. **What will you charge?** (See pricing benchmarks in [references/benchmarks.md](references/benchmarks.md))
2. **How many paying users do you need for your target revenue?** (e.g., $10K/mo at $4.99/mo = 2,004 subscribers)
3. **Is that realistic given the total addressable market?** (Compare to competitor rating counts)
4. **What's the revenue ceiling?** (Best-case scenario if you capture 10% of the niche)

---

## Step 6: Gap Analysis

Create a **feature comparison matrix** across the top competitors:

```markdown
| Feature         | App A  | App B | App C | App D | YOUR APP |
| --------------- | ------ | ----- | ----- | ----- | -------- |
| Core Feature 1  | Yes    | Yes   | No    | Yes   | YES      |
| Core Feature 2  | No     | Yes   | Yes   | No    | YES      |
| Missing Feature | No     | No    | No    | No    | YES      |
| Privacy-first   | No     | No    | No    | Yes   | YES      |
| Offline support | No     | No    | Yes   | No    | YES      |
| Price           | $14.99 | $9.99 | Free  | $6.99 | $4.99/yr |
| UX Quality      | Poor   | Good  | OK    | Good  | Premium  |
| Last Updated    | 2024   | 2025  | 2023  | 2025  | NEW      |
```

The winning opportunity is where:

1. Multiple competitors exist (proven demand)
2. They all miss the same 1-2 features
3. Users vocally complain about the gap
4. Pricing is high enough to support indie revenue
5. You can build a defensible advantage (see moat analysis below)

### Moat Analysis

For each opportunity, evaluate defensibility. Apps with no moat get cloned
quickly. Score each factor:

| Moat Type           | Question                                                    | Example                                      |
| ------------------- | ----------------------------------------------------------- | -------------------------------------------- |
| **Data moat**       | Does the app get better with more user data?                | Personalized recommendations, learned habits |
| **Network effects** | Does value increase with more users?                        | Social features, shared content              |
| **Switching costs** | Is it painful to leave once you've invested?                | Historical data, customization, integrations |
| **Brand/trust**     | Does the category reward reputation?                        | Privacy, health, finance                     |
| **Speed moat**      | Can you ship and iterate faster than incumbents?            | Solo dev agility vs corporate bureaucracy    |
| **AI moat**         | Does your AI improve with usage in ways competitors can't?  | Custom models, unique training data          |

Even one strong moat factor is valuable. "Speed moat" is the most accessible for
indie devs — ship fast, iterate based on real feedback, stay ahead.

---

## Step 7: Score & Rank Opportunities

Score each candidate opportunity using the structured rubric in
[references/scoring-framework.md](references/scoring-framework.md). Score on 6
dimensions (1-5 each, 30 max): Market Demand, Competition Weakness, Revenue
Potential, Build Feasibility, Differentiation Clarity, and Regulatory Safety.

Present the scorecard to the user alongside the top 3 report.

---

## Step 8: Top 3 Opportunity Report

Produce a ranked report with this structure:

```markdown
# Top 3 iOS App Opportunities in {Category}

## Opportunity Scorecard

| Dimension              | Opp 1: {Name} | Opp 2: {Name} | Opp 3: {Name} |
| ---------------------- | ------------- | ------------- | ------------- |
| Market Demand (1-5)    |               |               |               |
| Competition Weakness   |               |               |               |
| Revenue Potential      |               |               |               |
| Build Feasibility      |               |               |               |
| Differentiation        |               |               |               |
| Regulatory Safety      |               |               |               |
| **TOTAL (out of 30)**  |               |               |               |

## Opportunity 1: {App Name} (RECOMMENDED)

**Archetype:** {Simplifier / Privacy Play / Design Upgrade / Unbundler /
Combiner / Localizer / AI Upgrader / Lifetime Play}
**One-line pitch:** {What it does in 10 words}
**The gap:** {What's missing in the market}
**Target user:** {Who and why they'd pay}
**Revenue model:** {Price point and conversion assumptions}
**Revenue path:** {How to reach $X/mo with math}
**Competition:** {Who exists, why you win}
**Moat:** {What defensibility you build over time}
**Build complexity:** {Low/Medium/High, estimated weeks to MVP}
**App Store risk:** {Any review/approval concerns}
**Confidence:** {High/Medium/Low with reasoning}

## Opportunity 2: {App Name}

{Same fields as above}

## Opportunity 3: {App Name}

{Same fields as above}

## Recommendation

{Why #1 is the best bet, with specific reasoning tied to scores}
```

**Present this to the user and get their pick before proceeding.**

---

## Step 9: Quick Validation (Optional)

Before investing in a full PRD, suggest a lightweight smoke test to de-risk the
chosen opportunity:

- **Reddit validation post:** Post in a relevant subreddit describing the concept
  and ask if people would use/pay for it. Frame as "I'm thinking about building
  X — would this solve your problem?"
- **Landing page test:** Create a simple one-page site describing the app with an
  email signup. Use Carrd, Framer, or a single HTML page. Run for 3-7 days.
- **Twitter/X poll:** Post a poll describing the problem and 3-4 solution
  approaches. See which resonates.
- **TestFlight beta list:** Start collecting emails for early beta access — this
  validates willingness to actually try the app.

Skip this step if: the user wants to move fast, the opportunity scored 24+, or
strong demand evidence already exists from Step 3.

---

## Step 10: Write the MVP PRD

Once the user selects an opportunity, write a comprehensive PRD with these
sections:

1. **Executive Summary** — One paragraph pitch, name the opportunity archetype
2. **Market Opportunity** — Problem, TAM/SAM/SOM market sizing (see below),
   competitive landscape table, revenue validation
3. **Target Users** — 3 personas with name, age, job, pain points, willingness
   to pay
4. **MVP Feature Set** — 5-8 feature groups with detailed specs, UI behavior,
   edge cases. Clearly mark what's MVP vs V2.
5. **Screen Map** — All screens listed with parent/child relationships
6. **Onboarding Flow** — First-time user experience step by step: what the user
   sees on first launch, how many screens before value delivery, what permissions
   are requested and when, how the app demonstrates its core value within 60
   seconds. This is the single biggest factor in retention.
7. **User Flow** — Primary user journey from onboarding to daily use
8. **Monetization** — Free vs Premium feature split, pricing (annual + lifetime),
   free trial length, Superwall/RevenueCat integration, paywall placement strategy
9. **Tech Stack** — Swift/SwiftUI, minimum iOS version, persistence (SwiftData/
   CoreData/UserDefaults), networking, third-party dependencies. Keep dependencies
   minimal for long-term maintainability.
10. **AI Features** — If applicable, what AI does and doesn't do, on-device vs
    cloud, cost implications
11. **Data Models** — Swift structs/classes for core entities with property types
12. **Design Direction** — Color palette (with hex codes), typography, component
    style, mood. Reference Apple's Human Interface Guidelines.
13. **App Store Listing (ASO)** — Optimized for discoverability:
    - **App name** (30 char max) — include primary keyword
    - **Subtitle** (30 char max) — reinforce value proposition with secondary keyword
    - **Keywords** (100 char max, comma-separated) — no spaces after commas,
      no duplicates of words in name/subtitle, include misspellings and synonyms
    - **First 3 lines of description** — these show before "Read More" tap, must hook immediately
    - **Screenshot strategy** — what each of the 10 screenshots should show,
      captions for each
    - **App preview video** — 15-30 second concept showing core value proposition
    - See [references/aso-guide.md](references/aso-guide.md) for keyword research
      methodology and optimization tactics
14. **Launch Strategy** — Week 1-12 plan, marketing channels, content strategy
15. **Success Metrics & Retention** — KPIs with specific targets including
    D1/D7/D30 retention benchmarks
16. **Risks & Mitigations** — Top 5 risks with solutions, including App Store
    review risks
17. **Privacy & Compliance** — Privacy nutrition labels, App Tracking Transparency,
    data handling, App Store Review Guidelines compliance
18. **Competitive Moat** — How defensibility builds over time
19. **Future Roadmap** — V2, V3 features beyond MVP

### Market Sizing Framework

For section 2, estimate:

- **TAM (Total Addressable Market):** Total number of people with this problem ×
  willingness to pay. Use Google Trends, Statista, and category research.
- **SAM (Serviceable Addressable Market):** TAM filtered to iOS users in your
  target geography.
- **SOM (Serviceable Obtainable Market):** Realistic capture in year 1. For indie
  apps, 0.1-1% of SAM is a reasonable starting estimate. Compare to competitor
  rating counts for grounding.

**Save the PRD as:** `PRD-{AppName}.md`

---

## Revenue & Marketing Benchmarks

See [references/benchmarks.md](references/benchmarks.md) for revenue validation
benchmarks, pricing sweet spots, retention targets, and marketing channel
playbook. Reference this when validating opportunities in Steps 5-7 and writing
the launch strategy in Step 10.
