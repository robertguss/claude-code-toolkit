# Pricing Experiments Guide

## Experiment Prioritization

Run experiments in this order — each one is a higher-impact lever than the next:

| Priority | Experiment             | Expected Impact | Difficulty |
| -------- | ---------------------- | --------------- | ---------- |
| 1        | Free trial length      | 20-50% lift     | Low        |
| 2        | Paywall timing/trigger | 15-40% lift     | Medium     |
| 3        | Default plan selection | 10-30% lift     | Low        |
| 4        | Headline copy          | 5-20% lift      | Low        |
| 5        | Price point            | 10-30% lift     | Medium     |
| 6        | Social proof presence  | 5-15% lift      | Low        |
| 7        | Number of plan options | 5-15% lift      | Low        |
| 8        | CTA button copy        | 3-10% lift      | Low        |
| 9        | Feature list content   | 3-10% lift      | Low        |
| 10       | Visual design          | 3-10% lift      | Medium     |

---

## Experiment Design

### Anatomy of a Good Experiment

1. **Hypothesis** — "Changing [X] from [A] to [B] will increase [metric] by
   [amount] because [reasoning]"
2. **Primary metric** — one metric that determines success (e.g., trial start
   rate)
3. **Guardrail metrics** — metrics that must not degrade (e.g., retention,
   refund rate)
4. **Sample size** — minimum users per variant for statistical significance
5. **Duration** — how long to run before making a decision
6. **Segments** — new users only, all users, or specific cohorts

### Sample Size Requirements

For a standard A/B test with 95% confidence and 80% power:

| Baseline Rate | Minimum Detectable Effect | Sample Size Per Variant |
| ------------- | ------------------------- | ----------------------- |
| 5%            | 20% relative (5% → 6%)    | ~14,500                 |
| 5%            | 50% relative (5% → 7.5%)  | ~2,500                  |
| 10%           | 20% relative (10% → 12%)  | ~6,500                  |
| 10%           | 50% relative (10% → 15%)  | ~1,100                  |
| 20%           | 20% relative (20% → 24%)  | ~2,800                  |
| 20%           | 50% relative (20% → 30%)  | ~500                    |

**For indie apps with limited traffic:** focus on tests with large expected
effect sizes (>30% relative change). Small optimizations require traffic volumes
most indie apps do not have.

### Minimum Viable Experiment

If traffic is too low for formal A/B testing:

1. **Sequential testing** — run variant A for 2 weeks, then variant B for 2
   weeks. Less rigorous but practical for <1,000 users/month.
2. **Cohort comparison** — compare new users in week 1 (variant A) vs week 3
   (variant B). Account for seasonality.
3. **Price sensitivity survey** — ask users directly via in-app survey. "What
   would you expect to pay for this app?" with ranges.

---

## Experiment Playbooks

### Experiment 1: Free Trial Length

**Variants:**

- A: 3-day free trial
- B: 7-day free trial
- C: 14-day free trial (optional third variant if traffic allows)

**Primary metric:** Trial-to-paid conversion rate **Secondary metrics:** Trial
start rate, Day 30 retention **Why it matters:** Shorter trials create urgency
but fewer users start them. Longer trials build habit but many users forget to
cancel and then refund.

**Expected results:**

- 3-day: Higher conversion rate (50-70%), lower trial starts
- 7-day: Balanced (40-55% conversion, moderate trial starts)
- 14-day: Lower conversion (30-45%), higher trial starts

**Decision framework:** Optimize for total revenue, not conversion rate alone.
`Revenue = trial_starts * conversion_rate * price`

---

### Experiment 2: Paywall Timing

**Variants:**

- A: Show paywall after onboarding completion
- B: Show paywall after 3rd use of core feature
- C: Show paywall only on premium feature tap

**Primary metric:** Overall paywall conversion rate **Secondary metrics:** Day 7
retention, lifetime value **Why it matters:** Too early = user hasn't seen
value. Too late = user is happy with free tier.

**Expected results:**

- After onboarding: Highest impression volume, lowest conversion
- After 3rd use: Moderate impressions, highest conversion (user has seen value)
- On premium feature tap: Lowest impressions, moderate conversion (contextual)

**Decision framework:** Measure conversion AND retention together. A paywall
that converts 15% but causes 30% of non-converters to churn is worse than one
that converts 8% with 90% retention.

---

### Experiment 3: Default Plan Selection

**Variants:**

- A: Monthly plan pre-selected
- B: Annual plan pre-selected
- C: No plan pre-selected

**Primary metric:** Revenue per paywall view **Secondary metrics:** Plan mix (%
annual vs monthly), refund rate **Why it matters:** Pre-selecting annual
increases ARPU but may increase chargebacks if users feel tricked.

**Expected results:**

- Monthly pre-selected: Higher conversion count, lower ARPU
- Annual pre-selected: Lower conversion count, higher ARPU, watch refund rate
- No pre-selection: Lowest conversion, but most intentional subscribers

---

### Experiment 4: Headline Copy

**Variants:**

- A: Benefit-focused ("Build Habits That Actually Stick")
- B: Outcome-focused ("Join 50,000 Users Who Changed Their Lives")
- C: Feature-focused ("Unlock Unlimited Tracking & Analytics")

**Primary metric:** Trial start rate **Secondary metrics:** Paywall scroll
depth, time on paywall **Why it matters:** The headline is the first thing users
read. It frames everything below it.

**Expected results:** Benefit and outcome headlines typically outperform
feature-focused headlines by 15-30%.

---

### Experiment 5: Price Point

**Variants:**

- A: $4.99/mo ($29.99/yr)
- B: $6.99/mo ($44.99/yr)
- C: $9.99/mo ($59.99/yr)

**Primary metric:** Revenue per user (not conversion rate alone) **Secondary
metrics:** Conversion rate, churn rate at 30/60/90 days **Why it matters:**
Higher price = fewer conversions but more revenue per conversion. The optimum
depends on your app's perceived value.

**Revenue calculation:**

```
Revenue per 1,000 paywall views:
$4.99 at 12% conversion = $598.80
$6.99 at 9% conversion  = $629.10  ← often the winner
$9.99 at 6% conversion  = $599.40
```

**Warning:** Price experiments are the hardest to run cleanly. Different users
seeing different prices can cause complaints. Consider sequential testing
(change price for all users, measure cohort performance over time).

---

## Measuring Results

### Statistical Significance

Do not make decisions until reaching statistical significance (p < 0.05).

**Quick significance check:**

- Use an online calculator (e.g., ABTestGuide, Evan Miller's calculator)
- Input: visitors per variant, conversions per variant
- Output: confidence level and whether the result is significant

**Common mistakes:**

- Peeking at results too early and declaring a winner
- Stopping the test as soon as one variant "looks better"
- Running tests for less than 1 full week (day-of-week effects)
- Not accounting for novelty effect (new UI converts better initially)

### Minimum Test Duration

Always run for at least:

- **7 days** — to capture day-of-week variation
- **14 days** — for subscription tests (to capture trial expiration)
- **1 full billing cycle** — for price tests (to capture actual payments)

### Revenue vs Conversion Rate

Optimize for **revenue per paywall view**, not conversion rate:

```
Revenue per paywall view = conversion_rate * average_revenue_per_conversion
```

A variant with 5% conversion at $9.99/mo generates more revenue than 10%
conversion at $3.99/mo.

---

## RevenueCat Experiments

RevenueCat has built-in experiment support (requires paid plan):

1. Create an experiment in the RevenueCat dashboard
2. Define control and variant offerings
3. Set allocation percentage (usually 50/50)
4. RevenueCat automatically tracks revenue metrics per variant
5. View results in the Experiments tab with statistical significance

**Advantages:** Tracks actual revenue (not just conversions), handles
subscription lifecycle automatically, accounts for refunds and renewals.

**Limitation:** Only tests different offerings (price/plan structure). For
paywall UI/copy tests, use a feature flag system (PostHog, LaunchDarkly,
Firebase Remote Config) alongside RevenueCat.

---

## Post-Experiment Action Plan

After each experiment concludes:

1. **Document the result** — hypothesis, variants, sample sizes, winner, lift
2. **Implement the winner** for all users
3. **Wait 2 weeks** before starting the next experiment (clean baseline)
4. **Re-test the winner** in 6 months (user base evolves, market changes)
5. **Share learnings** — price sensitivity and paywall behavior inform product
   decisions beyond just the paywall
