# Revenue Estimation Toolkit

Revenue estimation is critical for deciding whether an opportunity is worth
pursuing. Never rely on a single method — triangulate from multiple sources.

## Method 1: Rating-Count Proxy

iOS doesn't show download counts, but rating counts are a useful proxy.

### The Formula

```
Estimated downloads = rating_count × multiplier
```

| App Type              | Multiplier | Reasoning                                    |
| --------------------- | ---------- | -------------------------------------------- |
| Free apps (no prompt) | × 80-120   | Few users bother to rate                     |
| Free apps (prompted)  | × 40-60    | Rating prompts increase rate                 |
| Paid apps             | × 20-40    | Paying users rate more often                 |
| Subscription apps     | × 30-50    | Mix of prompted and organic                  |

### Confidence Levels

| Rating Count | Confidence | Notes                                         |
| ------------ | ---------- | --------------------------------------------- |
| >10,000      | High       | Large sample, multiplier is reliable          |
| 1,000-10,000 | Medium     | Reasonable estimate, ±30% margin              |
| 100-1,000    | Low        | Wide variance, use as directional only        |
| <100         | Very Low   | Could be new, niche, or genuinely unpopular   |

### Example Calculation

App with 5,000 ratings (subscription, uses rating prompts):
- Estimated downloads: 5,000 × 40 = 200,000
- At 5% conversion to paid: 10,000 paying users
- At $14.99/yr: ~$150K/yr = ~$12.5K/mo

**Important:** This is a rough estimate. Always cross-reference with other methods.

## Method 2: App Store Chart Position

Chart position correlates with daily downloads:

| Chart Position (US) | Estimated Daily Downloads | Notes                     |
| -------------------- | ------------------------- | ------------------------- |
| Top 10 Overall       | 30,000-100,000+           | Major apps only           |
| Top 50 Overall       | 10,000-30,000             | Significant traction      |
| Top 10 Category      | 2,000-10,000              | Category leader           |
| Top 50 Category      | 500-2,000                 | Solid performer           |
| Top 100 Category     | 200-500                   | Moderate traction         |
| Top 200 Category     | 50-200                    | Baseline visibility       |

These numbers vary significantly by category. Health & Fitness top 10 is very
different from Board Games top 10.

## Method 3: Public Revenue Data Sources

### Direct Revenue Reports

- **IndieHackers.com:** Filter by iOS apps, many share exact MRR
- **Twitter #buildinpublic:** Indie devs post monthly revenue screenshots
- **RevenueCat blog:** "State of Subscription Apps" annual reports with aggregate
  data by category
- **Sub Club podcast:** Founders share revenue numbers openly
- **AppFigures/Sensor Tower blogs:** Occasional free category reports

### Search Patterns

```
"{app name}" revenue OR MRR OR ARR
"{app name}" "monthly revenue"
site:indiehackers.com "{category}" revenue ios
site:twitter.com "{app name}" revenue
"{category} app" "$" "per month" site:reddit.com
```

### Known Indie iOS Revenue Data Points (Reference)

| App              | Category         | Revenue       | Model        | Team Size |
| ---------------- | ---------------- | ------------- | ------------ | --------- |
| Rootd            | Health/Anxiety   | $1M+ total    | Subscription | 1 person  |
| Daylio           | Mood tracker     | ~$50K/mo      | Freemium     | Small     |
| Finch            | Self-care        | ~$2M/mo       | Subscription | Small     |
| Calm             | Meditation       | $100M+/yr     | Subscription | Company   |
| Wipr             | Ad blocker       | Undisclosed   | One-time $2  | 1 person  |
| 1Blocker         | Ad blocker       | $3-5M/yr      | Subscription | Small     |
| Carrot Weather   | Weather          | ~$20K/mo      | Subscription | 1 person  |
| Halide           | Camera           | Undisclosed   | One-time     | 2 people  |
| Streaks          | Habit tracker    | Undisclosed   | One-time $5  | 1 person  |
| Dark Noise       | Sound machine    | ~$3-5K/mo     | One-time     | 1 person  |

## Method 4: Competitor Pricing Reverse Engineering

If competitors charge subscription prices, you can estimate their revenue floor:

```
Minimum viable revenue = team_size × $100K/yr (rough salary cost)
```

If a 5-person company charges $9.99/mo, they need at minimum:
- $500K/yr revenue to survive
- = ~4,200 active subscribers
- = probably 40,000-80,000 total downloads (at 5-10% conversion)

This gives you a floor estimate of market size.

## Method 5: Revenue Modeling Template

For your own opportunity, build a simple model:

```
Monthly Revenue = Downloads/mo × Trial Start Rate × Trial→Paid Rate × Price/mo

Example:
- ASO + marketing drives 3,000 downloads/mo
- 40% start free trial = 1,200 trials
- 20% convert to paid = 240 new subscribers/mo
- At $14.99/yr ($1.25/mo effective) = $300/mo new MRR
- With 5% monthly churn, steady state ≈ 4,800 subscribers
- Steady state revenue ≈ $6,000/mo

Lifetime model alternative:
- 3,000 downloads/mo
- 15% buy lifetime at $39.99 = 450 purchases = $18,000/mo
```

Adjust assumptions based on category benchmarks in
[benchmarks.md](benchmarks.md).

## Revenue Red Flags

- No competitor in the category charges more than $2.99 (low WTP ceiling)
- Top apps are free with no in-app purchases (users expect free)
- Category is dominated by ad-supported apps (race to the bottom)
- All subscription competitors have "too expensive" as the #1 complaint
- Category has a strong free open-source alternative

## Revenue Green Flags

- Multiple competitors successfully charge $9.99+/mo (proven WTP)
- Users in Reddit threads say "I'd gladly pay for..." 
- Competitor with poor quality still makes money (market will support better product)
- Category has high switching costs (data lock-in, learning curve)
- Problem is painful enough that money is not the primary objection
