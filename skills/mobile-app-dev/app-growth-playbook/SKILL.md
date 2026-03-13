---
name: app-growth-playbook
description:
  Generate platform-specific, actionable growth playbooks for mobile apps. Use
  when planning a Product Hunt launch, creating TikTok/Reels content strategies,
  setting up Apple Search Ads campaigns, preparing App Store featuring
  submissions, building referral loops, designing email/push re-engagement
  campaigns, writing Reddit launch posts, or creating content marketing plans
  for app growth. Provides templates, scripts, timing guides, and step-by-step
  processes — not generic advice.
---

# App Growth Playbook

## Core Workflow

### 1. Assess Current State

Gather the following before selecting channels:

- **Downloads**: monthly installs, trend direction, organic vs. paid split
- **Retention**: D1, D7, D30 retention rates
- **Revenue**: ARPU, LTV, current monetization model
- **Audience**: primary demographic, geographic concentration, device split
- **Current channels**: what has been tried, what worked, what failed

### 2. Select Growth Channels

Use the channel selection matrix to pick 2-3 channels based on app category and
budget.

| Channel               | Best For                                       | Budget    | Timeline to Results |
| --------------------- | ---------------------------------------------- | --------- | ------------------- |
| Product Hunt          | B2B, productivity, developer tools             | Free      | 1-2 weeks           |
| Reddit                | Niche/community apps, indie projects           | Free      | 2-4 weeks           |
| TikTok/Reels          | Consumer apps, visual apps, lifestyle          | Free      | 4-8 weeks           |
| Apple Search Ads      | Any iOS app with clear keywords                | $5-20/day | 1-2 weeks           |
| App Store Featuring   | High-quality, design-forward apps              | Free      | 4-12 weeks          |
| Content Marketing/SEO | Apps solving searchable problems               | Free-low  | 2-6 months          |
| Referral/Viral Loops  | Social, messaging, collaboration apps          | Dev time  | 4-8 weeks           |
| Email/Push            | Apps with existing user base needing retention | Free-low  | 1-2 weeks           |

**Budget tiers:**

- **$0/month**: Product Hunt, Reddit, TikTok/Reels, App Store Featuring,
  Referral
- **$150-600/month**: Apple Search Ads, Content Marketing (hosting/tools)
- **$600+/month**: Paid social, influencer partnerships, Google Ads

### 3. Execute Channel Playbooks

Load the appropriate reference file for detailed execution:

- `references/product-hunt-playbook.md` — Full Product Hunt launch timeline,
  templates, and activation plan
- `references/social-media-templates.md` — TikTok/Reels scripts, Reddit posts,
  hashtag strategies
- `references/paid-acquisition.md` — Apple Search Ads and Google Ads campaign
  setup
- `references/content-marketing.md` — Blog templates, SEO strategies, landing
  page patterns

### 4. Measure and Iterate

Track these metrics weekly per channel:

| Metric                | Formula                        | Target       |
| --------------------- | ------------------------------ | ------------ |
| CAC                   | spend / installs               | < 1/3 of LTV |
| Install-to-trial rate | trials / installs              | > 30%        |
| Trial-to-paid rate    | paid / trials                  | > 10%        |
| Payback period        | CAC / monthly revenue per user | < 3 months   |
| Channel ROI           | (revenue - spend) / spend      | > 2x         |

**Decision framework after 2 weeks per channel:**

- ROI > 2x → double budget
- ROI 1-2x → optimize creative/targeting for 2 more weeks
- ROI < 1x → pause and reallocate to higher-performing channel

## Channel Playbook Summaries

### Product Hunt Launch

**Preparation timeline**: start 2 weeks before launch.

Key elements:

- Schedule for Tuesday-Thursday, post goes live at 12:01 AM PT
- Secure a hunter with 1,000+ followers or self-hunt with a strong network
- Prepare maker's comment (first comment on post) — personal story, not sales
  pitch
- Build activation list of 50+ people who will upvote and comment authentically
- Prepare 5 different social media announcements for launch day

Load `references/product-hunt-playbook.md` for the full timeline, hunter
outreach template, maker's comment template, and activation plan.

### Reddit Launch & Ongoing

**Core principle**: contribute value first, promote second.

Key elements:

- Research 5-10 subreddits where the target audience participates
- Use "soft launch" format — ask for feedback, share the journey, not "check out
  my app"
- Target subreddits: r/SideProject, r/IndieDev, r/EntrepreneurRideAlong, plus
  niche-specific
- Follow each subreddit's self-promotion rules exactly
- Build karma and history before posting about the app

Load `references/social-media-templates.md` for Reddit post templates and
subreddit research guide.

### TikTok/Reels Content

**Video structure** (20 seconds total):

1. Hook (2s) — pattern interrupt or bold claim
2. Problem (3s) — relatable frustration
3. Demo (10s) — screen recording with zooms and annotations
4. Result (3s) — before/after or outcome
5. CTA (2s) — "Link in bio" or "Search [app name]"

**Hook formulas:**

- "POV: you discover an app that [solves specific problem]"
- "This app is a game changer for [audience]"
- "Stop [old way]. Start [new way with app]"
- "I wish I found this app sooner"

Load `references/social-media-templates.md` for full video scripts, posting
schedule, and hashtag strategy.

### Apple Search Ads

**Campaign structure for indie budgets ($5-20/day):**

| Campaign   | Keywords               | Bid        | Budget Share |
| ---------- | ---------------------- | ---------- | ------------ |
| Brand      | App name, variations   | $0.50-1.00 | 10%          |
| Competitor | Competitor app names   | $1.00-3.00 | 20%          |
| Category   | Generic category terms | $0.75-2.00 | 40%          |
| Discovery  | Search Match (auto)    | $0.50-1.50 | 30%          |

Load `references/paid-acquisition.md` for full setup guide, bid optimization,
and creative set strategy.

### App Store Featuring

**What Apple looks for:**

- Exceptional design following Human Interface Guidelines
- Accessibility support (VoiceOver, Dynamic Type)
- Adoption of latest Apple technologies (widgets, Live Activities, visionOS)
- Localization (more languages = higher chance)
- No crashes, no major bugs

**How to submit:**

1. Open App Store Connect → navigate to the app
2. Use the "Promote Your App" section or email appstorepromotion@apple.com
3. Time submissions around iOS releases, seasonal events, or major app updates
4. Create App Store Connect events for in-app promotions

Load `references/content-marketing.md` for tips on optimizing App Store
presence.

### Referral & Viral Loops

**Trigger moments** — prompt sharing after:

- First achievement or milestone
- Positive feedback moment (completed task, reached goal)
- Social proof moment (join streak, leaderboard placement)
- Content creation (user generates something shareable)

**Incentive structures that convert:**

- 7-day premium trial for both referrer and invitee
- In-app credits or currency
- Feature unlocks (themes, icons, advanced features)
- Never require a referral — always make it optional

Load `references/content-marketing.md` for referral program design patterns.

### Email & Push Notification Strategy

**Push notification rules:**

- Send within user's active hours (track per-user timezone)
- Limit to 1-2 per day maximum
- Personalize with user data (name, last action, streak count)
- Use urgency sparingly — not every message is urgent

**Re-engagement timing:**

| Segment     | Timing | Message Type                |
| ----------- | ------ | --------------------------- |
| D1 churned  | Day 2  | "You left off at [state]"   |
| D7 churned  | Day 8  | Feature they haven't tried  |
| D30 churned | Day 31 | Major update or new feature |
| D90 churned | Day 91 | "We miss you" + incentive   |

Load `references/content-marketing.md` for email sequence templates and push
notification copy patterns.

## Execution Priority

For a brand-new app with zero budget, execute channels in this order:

1. **Week 1-2**: Optimize App Store listing (screenshots, description, keywords)
2. **Week 2-3**: Soft launch on Reddit (r/SideProject, niche subreddits)
3. **Week 3-4**: Product Hunt launch
4. **Week 4-8**: Begin TikTok/Reels content (3 videos/week)
5. **Week 4+**: Start Apple Search Ads at $5/day
6. **Month 2+**: Build referral loop into the app
7. **Month 3+**: Begin content marketing / SEO

For an app with an existing user base, start with email/push re-engagement and
referral loops before acquiring new users.
