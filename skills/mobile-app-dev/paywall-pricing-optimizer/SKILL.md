---
name: paywall-pricing-optimizer
description:
  Design effective paywalls, structure subscription tiers, and optimize pricing
  for mobile apps. Covers monetization model selection, paywall screen design,
  pricing psychology, A/B testing strategy, and RevenueCat/StoreKit/Google
  Billing integration. Use when the user wants to monetize an app, design a
  paywall, choose between subscription vs one-time purchase, set pricing tiers,
  improve conversion rates, plan pricing experiments, or integrate in-app
  purchases. Triggers on "design my paywall", "how should I price my app",
  "subscription tiers", "monetization strategy", "paywall copy", "free trial
  length", "RevenueCat setup", "improve paywall conversion".
---

## Prerequisites

- A defined app concept (what it does, who it serves)
- Target platform (iOS, Android, or both)
- Revenue goal (hobby $1K/mo vs business $10K/mo)
- No tools required — this skill produces strategy and implementation guidance

## Workflow Overview

```
1. Assess the App
2. Choose Monetization Model
3. Design Subscription Tiers
4. Set Pricing
5. Design the Paywall Screen
6. Plan Pricing Experiments
```

---

## Step 1: Assess the App

Gather these inputs before making any monetization decisions:

**Questions to ask:**

1. What core value does the app provide? (entertainment, productivity, health,
   utility)
2. How often do users engage? (daily, weekly, occasionally)
3. Who is the target audience? (age, income, tech savviness)
4. What do competitors charge? (research 3-5 direct competitors)
5. Does the app have ongoing costs? (AI API calls, server infrastructure,
   content creation)

**Usage frequency determines model viability:**

| Frequency       | Best Models                      | Why                                      |
| --------------- | -------------------------------- | ---------------------------------------- |
| Daily           | Subscription                     | High engagement justifies recurring cost |
| 2-3x per week   | Subscription or freemium         | Moderate engagement, needs strong value  |
| Weekly or less  | One-time purchase or consumable  | Hard to justify subscription             |
| Sporadic/urgent | One-time purchase or pay-per-use | Users pay when they need it              |

---

## Step 2: Choose Monetization Model

### Decision Framework

```
Does the app provide ongoing, evolving value?
├── YES → Does it have significant per-use costs (AI, API)?
│   ├── YES → Freemium with consumables (credits/tokens)
│   └── NO → Subscription
└── NO → Is it a tool with finite, clear value?
    ├── YES → One-time purchase (or lifetime unlock)
    └── NO → Freemium with ads + optional ad removal
```

### Model Deep-Dive

**Subscription** (~70% of top-grossing apps)

- Best for: ongoing value, content, AI features, daily-use apps
- Pros: predictable revenue, high LTV, aligns with App Store incentives
- Cons: higher churn, requires continuous value delivery
- Apple/Google take: 30% year 1, 15% year 2+ (Small Business Program)

**One-Time Purchase**

- Best for: utilities, tools with finite value, privacy-focused apps
- Pros: simple, no churn anxiety, easy to communicate value
- Cons: no recurring revenue, need constant new user acquisition
- Tip: offer a "Pro" unlock at $9.99-29.99 for utilities

**Freemium with Consumables**

- Best for: AI-heavy apps (credits/tokens), on-demand services
- Pros: pay-for-what-you-use feels fair, low barrier to start
- Cons: unpredictable revenue, complex to balance
- Pattern: give 10-20 free credits, then sell packs ($2.99/50, $9.99/200)

**Ads + Ad Removal**

- Best for: mass-market apps with 100K+ DAU
- Pros: monetize free users, ad removal is easy upsell
- Cons: only viable at massive scale, degrades UX
- Reality check: most indie apps never reach the DAU needed

---

## Step 3: Design Subscription Tiers

### Free vs Premium Split

The free tier must deliver enough value to hook users, but leave them wanting
more. Apply the **"taste, not feast"** principle.

**What goes in Free:**

- Core functionality (enough to experience the value proposition)
- Limited usage (3-5 uses per day, 7-day history, basic features)
- Onboarding and setup
- Basic customization

**What goes in Premium:**

- Unlimited usage
- Advanced features (AI, analytics, export, sync)
- Customization and personalization
- Ad removal (if applicable)
- Priority support or early access

### Tier Naming

Choose names that communicate value, not hierarchy:

| Pattern          | Free Tier | Paid Tier | Best For           |
| ---------------- | --------- | --------- | ------------------ |
| Status-based     | Basic     | Pro       | Productivity tools |
| Capability-based | Starter   | Unlimited | Usage-limited apps |
| Experience-based | Free      | Premium   | Content/media apps |
| Playful          | Explorer  | Champion  | Gamified/wellness  |

Avoid: "Lite" (implies inferior), numbered tiers (confusing), more than 2 tiers
for indie apps (3+ tiers create decision paralysis).

### Two-Tier vs Three-Tier

**Two tiers (recommended for most indie apps):**

- Free + Premium
- Simple, clear upgrade path
- One decision: upgrade or not

**Three tiers (only if justified):**

- Free + Standard + Pro
- Use the decoy effect: make Standard the obvious choice
- Only viable if you have meaningfully different feature sets for each

---

## Step 4: Set Pricing

### Pricing Benchmarks by Category (2025)

| App Type           | Monthly     | Annual       | One-Time     |
| ------------------ | ----------- | ------------ | ------------ |
| Simple utility     | $2.99-4.99  | $19.99-29.99 | $4.99-9.99   |
| Habit/tracker      | $4.99-6.99  | $29.99-44.99 | $9.99-14.99  |
| Productivity       | $5.99-9.99  | $39.99-59.99 | $14.99-29.99 |
| Health/fitness     | $6.99-12.99 | $39.99-79.99 | -            |
| AI-powered tool    | $9.99-19.99 | $59.99-99.99 | -            |
| Education/learning | $6.99-14.99 | $49.99-99.99 | -            |
| Creative tool      | $4.99-9.99  | $29.99-59.99 | $14.99-29.99 |

### Pricing Sweet Spots

| Tier         | Monthly           | Annual              | Best For                 |
| ------------ | ----------------- | ------------------- | ------------------------ |
| Impulse buy  | $2.99-4.99/mo     | $19.99-29.99/yr     | Simple utilities         |
| **Standard** | **$5.99-6.99/mo** | **$34.99-44.99/yr** | **Most indie apps**      |
| Premium      | $9.99-14.99/mo    | $59.99-99.99/yr     | AI-heavy or professional |

### Pricing Psychology Rules

1. **Anchor with annual pricing** — show annual plan first, display the
   per-month equivalent, cross out the monthly price to show savings
2. **Use odd pricing** — $6.99 not $7.00, $49.99 not $50.00
3. **Show savings percentage** — "Save 40%" on annual plan
4. **Three-tier decoy** — if offering 3 options, make the middle tier the
   obvious best value (price it closer to the cheap option, feature-set closer
   to the expensive one)
5. **Pre-select the best-value plan** — highlight and pre-select the annual plan

### Free Trial Strategy

| Length  | Best For                       | Conversion Impact                     |
| ------- | ------------------------------ | ------------------------------------- |
| 3 days  | Apps with immediate value      | Higher conversion, lower trial starts |
| 7 days  | Standard choice for most apps  | Balanced conversion and adoption      |
| 14 days | Apps requiring habit formation | Higher trial starts, lower conversion |
| 30 days | B2B or complex tools           | Very low conversion, use sparingly    |

**Introductory offers:**

- 50% off first month or first year
- Extended free trial (14 days instead of 7)
- Seasonal promotions (New Year, back to school)

---

## Step 5: Design the Paywall Screen

### Hard vs Soft Paywall

**Hard paywall** (before any use):

- Only for apps with strong brand recognition or no free alternative
- Very few indie apps should use this
- Risk: 90%+ of users bounce immediately

**Soft paywall** (after value demonstration):

- Show the paywall after the user has experienced value
- Best triggers for showing the paywall:
  - After 3-5 uses of the core feature
  - After completing onboarding
  - After hitting a usage limit ("You've used 3 of 3 free scans today")
  - After achieving a milestone ("Great progress! Unlock unlimited tracking")
  - On attempting a premium feature (contextual upgrade prompt)

### Paywall Screen Anatomy

Design the paywall screen with these sections in order:

**1. Hero Section**

- Benefit-focused headline (NOT feature-focused)
- Bad: "Unlock Premium Features"
- Good: "Track Every Habit, Crush Every Goal"
- Good: "Never Lose a Thought Again"
- Subheadline reinforcing the outcome

**2. Feature/Benefit List**

- 3-5 items maximum (more causes decision fatigue)
- Use checkmarks or icons
- Frame as benefits, not features:
  - Bad: "Unlimited storage"
  - Good: "Save everything, forget nothing"
- Optional: side-by-side Free vs Premium comparison

**3. Social Proof**

- Star rating with review count ("4.8 stars from 12,000 reviews")
- Testimonial quote from a real review
- User count ("Join 50,000+ users")
- Press mentions or awards

**4. Pricing Cards**

- Show annual plan first (left or top position)
- Highlight annual as "Best Value" or "Most Popular"
- Show per-month equivalent for annual plan
- Show savings: "Save 40%" or cross out monthly equivalent
- Pre-select the annual plan

**5. Call-to-Action**

- Action-oriented text:
  - Good: "Start Free Trial", "Try 7 Days Free", "Unlock Everything"
  - Bad: "Subscribe", "Buy", "Purchase"
- Make the button large, high-contrast, and unmissable
- Below CTA: "Cancel anytime" or "No commitment"

**6. Trust Signals**

- "Cancel anytime" (most important — always include)
- "No commitment"
- "Secured by Apple" / "Secured by Google Play"
- "Restore purchases" link
- Privacy policy link

See [references/paywall-copy-formulas.md](references/paywall-copy-formulas.md)
for headline templates, CTA variations, and feature list copy patterns.

### Common Paywall Mistakes

1. **Too many plan options** — 2 is ideal, 3 max. Never 4+.
2. **Feature-focused copy** — users buy outcomes, not features.
3. **No free trial** — always offer a trial for subscriptions.
4. **Paywall too early** — show value before asking for money.
5. **Weak CTA** — "Subscribe" converts far worse than "Start Free Trial".
6. **No social proof** — testimonials and ratings build trust.
7. **Missing "Cancel anytime"** — this single line lifts conversion 10-15%.
8. **No price anchoring** — always show what the user saves.
9. **Ugly design** — the paywall is a product page; invest in its design.
10. **Same paywall everywhere** — contextualize based on what triggered it.

---

## Step 6: Plan Pricing Experiments

Before committing to a pricing strategy, plan what to test.

See [references/pricing-experiments.md](references/pricing-experiments.md) for
detailed A/B testing methodology, sample size calculators, and experiment
prioritization.

### What to Test First (Priority Order)

1. **Free trial length** (3 vs 7 vs 14 days) — biggest lever
2. **Paywall timing** (after onboarding vs after 3 uses vs on premium feature)
3. **Annual vs monthly default** (which is pre-selected)
4. **Headline copy** (benefit A vs benefit B)
5. **Price point** ($4.99 vs $6.99 vs $9.99)
6. **Social proof** (with vs without)

### Key Metrics to Track

| Metric                   | Formula                            | Target   |
| ------------------------ | ---------------------------------- | -------- |
| Trial start rate         | Trials / paywall views             | 15-30%   |
| Trial-to-paid conversion | Paid / trial starts                | 40-60%   |
| Paywall conversion rate  | Purchases / paywall views          | 5-15%    |
| ARPU (avg revenue/user)  | Total revenue / total users        | Varies   |
| LTV (lifetime value)     | ARPU \* avg subscription length    | > 3x CAC |
| Monthly churn rate       | Cancellations / active subscribers | < 10%    |

---

## RevenueCat / StoreKit / Google Billing Integration

### RevenueCat (Recommended for Indie Devs)

RevenueCat abstracts StoreKit and Google Billing into a single SDK. Free up to
$2,500/mo MTR.

**Setup pattern:**

1. Create a RevenueCat project and add App Store / Google Play apps
2. Configure products in App Store Connect / Google Play Console
3. Configure offerings and entitlements in RevenueCat dashboard
4. Install SDK: `expo install react-native-purchases`
5. Initialize on app launch with API key
6. Fetch offerings to display on paywall
7. Make purchase and check entitlement status
8. Handle restore purchases

**Key concepts:**

- **Product** — the SKU in App Store Connect / Google Play Console
- **Entitlement** — what the user unlocks (e.g., "premium")
- **Offering** — a group of packages shown on the paywall (allows remote config)
- **Package** — a product within an offering (e.g., monthly, annual)

### StoreKit 2 (iOS Native)

Use StoreKit 2 for Swift/SwiftUI apps without RevenueCat:

- `Product.products(for:)` to fetch products
- `product.purchase()` to initiate purchase
- `Transaction.currentEntitlements` to check active subscriptions
- `Transaction.updates` to listen for transaction changes
- Handle `Transaction.unverified` cases

### Google Play Billing Library (Android Native)

Use Billing Library 6+ for Kotlin/Java apps:

- `BillingClient.queryProductDetailsAsync()` to fetch products
- `BillingClient.launchBillingFlow()` to initiate purchase
- `BillingClient.queryPurchasesAsync()` to check active subscriptions
- Acknowledge purchases within 3 days or they auto-refund

### Cross-Platform (Expo / React Native)

For Expo apps, RevenueCat is the standard approach:

- `expo install react-native-purchases`
- Configure `app.json` with `eas.build` for native module support
- Test with sandbox accounts on both platforms
- Use `expo-dev-client` for development builds (Expo Go does not support IAP)

---

## Output Deliverables

At the end of this workflow, deliver:

1. **Monetization model recommendation** with reasoning
2. **Tier structure** — what is free vs premium
3. **Pricing recommendation** — monthly, annual, and any introductory offers
4. **Paywall screen spec** — layout, copy, and design direction
5. **Experiment plan** — first 3 tests to run, ordered by impact
6. **Integration guidance** — RevenueCat/StoreKit/Billing setup steps
