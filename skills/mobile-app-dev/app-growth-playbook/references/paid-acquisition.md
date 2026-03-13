# Paid Acquisition Playbook

## Apple Search Ads Setup

### Account Setup

1. Go to searchads.apple.com and sign in with the Apple ID linked to App Store
   Connect
2. Add payment method (credit card or Apple Ads credit)
3. Create the first campaign group named after the app

### Campaign Structure

Create 4 campaigns, each with a distinct purpose:

#### Campaign 1: Brand Defense (10% of budget)

**Purpose:** Capture users searching for the app by name. Prevent competitors
from stealing brand searches.

- **Match type:** Exact match
- **Keywords:** app name, app name variations, common misspellings
- **Default bid:** $0.50-1.00 (brand terms are cheap)
- **Negative keywords:** none needed

**Example for a fitness app called "FitTrack Pro":**

```
Keywords: "fittrack pro", "fittrackpro", "fit track pro", "fittrack"
Bid: $0.50
Daily budget: $1-2
```

#### Campaign 2: Competitor Conquest (20% of budget)

**Purpose:** Show ads when users search for competing apps.

- **Match type:** Exact match
- **Keywords:** competitor app names, competitor brand terms
- **Default bid:** $1.00-3.00 (competitive, higher CPT)
- **Negative keywords:** add brand terms to avoid overlap

**How to find competitor keywords:**

1. Search App Store for the app's primary category
2. Note the top 20 apps in the category
3. Add each competitor name as an exact match keyword
4. Monitor which ones convert and prune those that don't after 100 impressions

**Example:**

```
Keywords: "myfitnesspal", "strava", "nike training", "peloton app"
Bid: $2.00
Daily budget: $3-4
```

#### Campaign 3: Category/Generic (40% of budget)

**Purpose:** Capture users searching for a type of app, not a specific one.

- **Match type:** Broad match and exact match (separate ad groups)
- **Keywords:** category terms, problem-based phrases, use-case phrases
- **Default bid:** $0.75-2.00
- **Negative keywords:** competitor names (handled in Campaign 2), irrelevant
  terms

**Keyword research process:**

1. List 10 ways someone would describe the app's function
2. Use Apple Search Ads keyword suggestions tool
3. Check App Store search suggestions (type partial words)
4. Review competitor App Store descriptions for keyword ideas

**Example:**

```
Exact match ad group:
"fitness tracker", "workout app", "exercise log", "gym tracker"
Bid: $1.50

Broad match ad group:
"fitness tracker", "workout app"
Bid: $1.00 (lower because broad match is less targeted)
```

#### Campaign 4: Discovery (30% of budget)

**Purpose:** Find new keywords Apple's algorithm suggests.

- **Match type:** Search Match (automatic)
- **Default bid:** $0.50-1.50
- **Negative keywords:** ALL keywords from Campaigns 1-3 (to avoid overlap)
- **Strategy:** Mine this campaign weekly for converting keywords, then move
  them to the appropriate campaign

### Bid Optimization Process

**Week 1-2: Data gathering**

- Set bids at the midpoint of suggested range
- Do not change bids — let data accumulate
- Need minimum 100 impressions per keyword to evaluate

**Week 3+: Optimization cycle (run weekly)**

| Metric                         | Action                                               |
| ------------------------------ | ---------------------------------------------------- |
| CPA < target, high impressions | Increase bid 10-20% to get more volume               |
| CPA < target, low impressions  | Increase bid 20-30% to compete for more auctions     |
| CPA > target, high impressions | Decrease bid 10-20%                                  |
| CPA > target, low impressions  | Pause keyword — not enough volume at any price       |
| High impressions, low taps     | Improve ad creative (custom product pages)           |
| High taps, low installs        | Improve App Store listing (screenshots, description) |

**Target CPA formula:**

```
Target CPA = LTV × target ROI ratio

Example:
- LTV = $15
- Target 3x ROI
- Target CPA = $15 / 3 = $5
```

### Creative Set Optimization

Apple Search Ads pull screenshots from the App Store listing. Optimize with
Custom Product Pages:

1. Create 3-4 Custom Product Pages in App Store Connect
2. Each page targets a different audience segment with different screenshot sets
3. Assign each Custom Product Page to the relevant ad group

**Example product page variants:**

- **Variant A (Beginners):** Screenshots showing ease of setup, simple UI
- **Variant B (Power Users):** Screenshots showing advanced features,
  integrations
- **Variant C (Social Proof):** Screenshots with review quotes, user count,
  awards

### Budget Pacing

**$5/day budget ($150/month):**

```
Brand: $0.50/day
Competitor: $1.00/day
Category: $2.00/day
Discovery: $1.50/day
```

**$10/day budget ($300/month):**

```
Brand: $1.00/day
Competitor: $2.00/day
Category: $4.00/day
Discovery: $3.00/day
```

**$20/day budget ($600/month):**

```
Brand: $2.00/day
Competitor: $4.00/day
Category: $8.00/day
Discovery: $6.00/day
```

## Google Ads for Apps (Universal App Campaigns)

### When to Use Google Ads vs. Apple Search Ads

| Factor            | Apple Search Ads           | Google UAC                         |
| ----------------- | -------------------------- | ---------------------------------- |
| Platform          | iOS only                   | Android + iOS                      |
| Targeting control | High (keyword level)       | Low (algorithmic)                  |
| Creative control  | Limited (App Store assets) | More options (text, video, images) |
| Best for          | High-intent users          | Volume at lower CPA                |
| Minimum budget    | $5/day                     | $10-20/day recommended             |

### Google UAC Setup

1. Create a Google Ads account linked to Google Play Console (or App Store for
   iOS)
2. Select "App promotion" campaign type
3. Choose optimization goal:
   - **Install volume** — start here to build data
   - **In-app actions** — switch after 100+ conversions
   - **ROAS** — switch after 500+ conversions with revenue data

### Asset Requirements

Provide Google with:

- **Text ideas:** 5 headlines (30 char max), 5 descriptions (90 char max)
- **Images:** 3-5 images in landscape (1200x628), portrait (1200x1500), and
  square (1200x1200)
- **Videos:** 1-3 videos (landscape and portrait) — 15-30 seconds
- **HTML5 ads:** optional, for interactive ads

**Headline formulas:**

```
"[Solve Problem] in [Time]"
"Free [App Category] App"
"[Number] [Users/Reviews] Love [App Name]"
"Try [App Name] — [Key Benefit]"
"[Action Verb] [Outcome] Today"
```

### Budget and Bidding

- Set target CPI (cost per install) at 80% of target — Google's algorithm learns
  and optimizes
- Minimum budget: 10x target CPI per day
- Allow 2 weeks for the algorithm to learn before adjusting

**Example:**

```
Target CPI: $2.00
Set bid: $1.60
Daily budget: $20 (10 × $2.00)
Learning period: 14 days
```

### Optimization Cadence

| Week | Action                                                                |
| ---- | --------------------------------------------------------------------- |
| 1-2  | Do not touch. Let algorithm learn.                                    |
| 3    | Review CPI and conversion rate. If CPI > 2x target, lower bid 10%.    |
| 4    | Add or replace worst-performing text/image assets.                    |
| 5-6  | If hitting CPI target, increase budget 20-30%.                        |
| 7-8  | Switch optimization goal to in-app actions if enough conversion data. |
