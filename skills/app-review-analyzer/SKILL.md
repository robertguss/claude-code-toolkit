---
name: app-review-analyzer
description:
  Systematically analyze app reviews for competitor research or own-app
  reputation management. Categorize reviews by sentiment and themes (bugs,
  missing features, UX complaints, pricing objections, praise, support issues),
  identify actionable patterns, produce structured analysis reports, and draft
  professional review responses. Use when the user says "analyze app reviews",
  "review analysis", "competitor reviews", "respond to reviews", "app review
  report", "what are users complaining about", "review sentiment analysis",
  "draft review responses", or wants to understand user feedback patterns for
  any iOS App Store or Google Play app.
---

## Prerequisites

- **Chrome browser** with Claude in Chrome extension (for reading store reviews)
- No API keys required — all analysis is done through live browser interaction
- Supports **iOS App Store** and **Google Play Store**

## Mode Selection

Ask the user which mode they need:

1. **Competitive Analysis** — Analyze a competitor's reviews to find gaps and
   opportunities
2. **Own App Management** — Analyze your own app's reviews to prioritize fixes,
   surface feature requests, and draft professional responses

If the user provides a competitor's app, use Competitive Analysis mode. If they
mention "my app" or "our app," use Own App Management mode.

---

## Competitive Analysis Mode

### Step 1: Navigate to the App Listing

Open the app's store page in Chrome:

- **iOS App Store:** Search on apps.apple.com or use a direct link
- **Google Play:** Search on play.google.com or use a direct link

Confirm the correct app with the user before proceeding.

### Step 2: Collect Reviews Systematically

Read reviews in two passes:

1. **Most Recent** — Sort by newest first. Read at least 30-50 reviews to
   capture current sentiment.
2. **Most Critical** — Sort by lowest rating (1-star, then 2-star). Read at
   least 20-30 critical reviews to surface pain points.

For each review, note:

- Star rating
- Date posted
- Review text (key quotes)
- Whether the developer responded

### Step 3: Categorize Reviews

Assign each review to one or more theme categories:

| Category               | Signals                                                          |
| ---------------------- | ---------------------------------------------------------------- |
| **Bug Reports**        | Crashes, errors, data loss, freezing, sync failures              |
| **Missing Features**   | "I wish it had...", "Why can't I...", "Needs..."                 |
| **UX Complaints**      | "Too complicated", "Can't find...", "Confusing", "Slow"          |
| **Pricing Objections** | "Too expensive", "Not worth it", "Used to be free"               |
| **Praise**             | Specific features users love, "best app for...", loyalty signals |
| **Support Complaints** | "No response", "Unhelpful", "Can't reach anyone"                 |

### Step 4: Produce the Analysis Report

Generate a structured report using the template in
`references/analysis-report-template.md`. The report must include:

1. **Theme Frequency Table** — Count of reviews per category, sorted by
   frequency
2. **Sentiment Trend** — Are recent reviews better or worse than older ones?
3. **Top 5 Pain Points** — With direct quotes from reviews
4. **Top 5 Praised Features** — Competitor strengths you must match or exceed
5. **Opportunity Summary** — Gaps you could fill, weaknesses to exploit

---

## Own App Management Mode

### Step 1: Navigate to Your App's Reviews

Open your app's store page in Chrome. Confirm the correct app.

### Step 2: Collect and Categorize Reviews

Follow the same collection process as Competitive Analysis (Steps 2-3 above).

### Step 3: Prioritize Issues

Score each theme by **Frequency x Severity**:

| Severity         | Definition                                               |
| ---------------- | -------------------------------------------------------- |
| **Critical (3)** | Data loss, crashes, security issues, payment failures    |
| **High (2)**     | Core functionality broken, major UX blockers             |
| **Medium (1)**   | Nice-to-have features, minor annoyances, cosmetic issues |

Calculate priority score: `count of reviews in theme x severity weight`

Sort themes by priority score descending. This is the fix-first order.

### Step 4: Draft Review Responses

For each negative review (1-3 stars), draft a response following the templates
in `references/response-templates.md`.

Key response principles:

- Respond within 24-48 hours — speed improves update likelihood
- Never be defensive or argumentative
- Personalize every response — reference specific details from their review
- Acknowledge the problem before offering solutions
- Include a direct contact method for follow-up when appropriate
- Keep responses concise (2-4 sentences for most cases)

Platform-specific notes:

- **iOS App Store:** Developer responses appear publicly under the review. Users
  receive a notification and can update their rating.
- **Google Play:** Developer responses also appear publicly. You can report
  policy-violating reviews (spam, off-topic, profanity) via the Play Console.

### Step 5: Produce the Action Plan

Generate a report using `references/analysis-report-template.md` with an
additional action plan section:

1. **Fix First** — Critical bugs and top pain points by priority score
2. **Add Next** — Most-requested features with user quotes as evidence
3. **Communicate** — Issues that need a public response or in-app messaging
4. **Monitor** — Themes to watch in future review cycles

---

## Review Category Quick Reference

Use this decision tree when categorizing ambiguous reviews:

```
Review mentions a crash/error/data loss?
  → Bug Report

Review says "I wish" or "please add" or "why can't I"?
  → Missing Feature

Review says "confusing" or "hard to use" or "can't find"?
  → UX Complaint

Review mentions price, subscription, cost, or payment?
  → Pricing Objection

Review says "no response" or "support" or "help"?
  → Support Complaint

Review is purely positive with no complaints?
  → Praise

Review has multiple themes?
  → Assign all applicable categories
```

## Resources

### references/

- **response-templates.md** — Detailed response templates for every review
  category with multiple variants each. Load when drafting review responses.
- **analysis-report-template.md** — Full markdown template for the analysis
  report output. Load when producing the final report.
