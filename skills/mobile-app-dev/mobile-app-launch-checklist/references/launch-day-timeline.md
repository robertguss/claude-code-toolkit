# Launch Day Timeline

Hour-by-hour execution plan for mobile app launch day. Adjust times based on the
primary market timezone. This template assumes a morning launch in the primary
market.

## Pre-Launch (Day Before)

### T-24 Hours

- [ ] Verify app status: approved and ready for release on all platforms
- [ ] Confirm all store listing metadata is final and accurate
- [ ] Test download of the approved build on a clean device (TestFlight /
      internal track)
- [ ] Verify backend services are scaled for expected traffic
- [ ] Confirm monitoring dashboards are accessible and functioning
- [ ] Brief the support team on launch plan and escalation contacts
- [ ] Pre-write social media posts and stage them in scheduling tool
- [ ] Confirm press embargo lift time (if applicable)

### T-12 Hours

- [ ] Final check of all backend APIs and services
- [ ] Verify push notification infrastructure is ready
- [ ] Confirm analytics events are flowing from the approved build
- [ ] Get 8 hours of sleep — launch day requires sustained attention

---

## Launch Morning

### T-0 (Launch Hour — Recommended: 9-10 AM Primary Market)

**Release the app:**

- [ ] **iOS:** Click "Release This Version" in App Store Connect (or the version
      will auto-release if configured)
- [ ] **Android:** Set production rollout to 10-20%
- [ ] Note exact release timestamp for all tracking

**Immediate verification (within 15 minutes):**

- [ ] Search for the app in each store — confirm it appears
- [ ] Download the app from the store on a fresh device
- [ ] Complete the primary user flow end-to-end
- [ ] Verify in-app purchases / subscriptions work in production
- [ ] Confirm crash reporting receives events
- [ ] Confirm analytics receives events

### T+1 Hour

**Monitor and activate:**

- [ ] Check crash-free rate — must be above 99.5%
- [ ] Check ANR rate (Android) — must be below 0.5%
- [ ] Review any incoming support messages
- [ ] Publish social media announcements
- [ ] Send email announcement to waitlist / mailing list
- [ ] Post on Product Hunt (if planned — must be posted by 12:01 AM PT ideally,
      or as early as possible)
- [ ] Notify press contacts that the app is live

### T+2 Hours

**First metrics check:**

- [ ] Downloads so far vs. projection
- [ ] Onboarding completion rate
- [ ] Any crash clusters forming? (check by device, OS version)
- [ ] First user reviews appearing?
- [ ] Social media engagement and sentiment
- [ ] Respond to any Product Hunt comments

### T+4 Hours

**Mid-day assessment:**

- [ ] Crash-free rate holding above 99.5%? → **Continue rollout**
- [ ] Any critical bugs reported? → **Assess severity**
- [ ] Download velocity trending? → **Adjust marketing if needed**
- [ ] **Android:** Consider increasing staged rollout to 25-50% if stable
- [ ] Post follow-up social content (behind-the-scenes, thank you)
- [ ] Respond to all user reviews

---

## Launch Afternoon

### T+6 Hours

**Stability confirmation:**

- [ ] Review crash reports from the full first half-day
- [ ] Check backend service health (response times, error rates)
- [ ] Review support ticket volume and themes
- [ ] Update team on status: green (proceed) / yellow (monitor) / red (halt)

### T+8 Hours

**End of business day check:**

- [ ] Total downloads for Day 1 (partial)
- [ ] Crash-free rate stable?
- [ ] Any show-stopping issues requiring immediate hotfix?
- [ ] If stable: **Android** can increase to 50% rollout
- [ ] Respond to all new reviews
- [ ] Post evening social media update (metrics celebration if appropriate)

---

## Decision Framework

### Green Light (Proceed with Rollout)

All of these must be true:

- Crash-free rate > 99.5%
- ANR rate < 0.5% (Android)
- No critical bugs in core user flow
- Store rating ≥ 4.0 (if enough reviews to judge)
- Backend services healthy

**Action:** Increase Android rollout percentage. Maintain iOS release.

### Yellow Light (Proceed with Caution)

Any of these are true:

- Crash-free rate between 99.0% and 99.5%
- Non-critical bugs reported but core flow works
- Store rating between 3.5 and 4.0
- Backend services showing elevated latency

**Action:** Hold rollout percentage. Investigate issues. Prepare hotfix if
needed. Increase monitoring frequency.

### Red Light (Halt Rollout)

Any of these are true:

- Crash-free rate below 99.0%
- Critical bug in core user flow (login, purchase, primary feature)
- Data loss or security issue
- Backend services down or severely degraded

**Action:** Halt Android staged rollout immediately. Prepare emergency hotfix.
For iOS, submit hotfix with expedited review request. Communicate with affected
users.

---

## Day 2 Morning

### T+24 Hours

- [ ] Review full Day 1 metrics:
  - Total downloads
  - D1 retention (users who opened the app again)
  - Onboarding completion rate
  - Crash-free rate trend
  - Review count and average rating
  - Revenue (if applicable)
- [ ] Compare metrics against projections
- [ ] Triage all crash reports — assign owners for top 3
- [ ] Respond to all new reviews
- [ ] **Android:** If Day 1 was green, increase to 100% rollout
- [ ] Plan any necessary hotfix release
- [ ] Share Day 1 results with stakeholders

---

## Post-Launch Week Schedule

| Day     | Focus Area       | Key Actions                                                       |
| ------- | ---------------- | ----------------------------------------------------------------- |
| Day 1   | Launch & Monitor | Release, verify, monitor, market                                  |
| Day 2   | Stabilize        | Review metrics, fix critical bugs, expand rollout                 |
| Day 3   | Respond          | Answer all reviews, handle support tickets, second marketing push |
| Day 4   | Analyze          | Deep metrics review, identify retention issues                    |
| Day 5   | Fix              | Ship hotfix for top crash/bug, respond to reviews                 |
| Day 6-7 | Plan             | Compile launch report, plan v1.1, celebrate                       |

---

## Emergency Contacts Template

Fill in before launch day:

| Role              | Name | Contact |
| ----------------- | ---- | ------- |
| Release manager   |      |         |
| Backend/API lead  |      |         |
| iOS developer     |      |         |
| Android developer |      |         |
| Support lead      |      |         |
| Marketing lead    |      |         |

## Launch Day Communication Template

### Internal Status Update (Send Every 2 Hours)

```
Launch Status: [GREEN / YELLOW / RED]
Time: [timestamp]
Downloads: [count] (projection: [count])
Crash-free rate: [iOS: X% / Android: X%]
Reviews: [count] (avg: [rating])
Android rollout: [X%]
Issues: [none / brief description]
Next update: [time]
```

### External Launch Announcement Template

```
[App Name] is live on [App Store / Google Play / both]!

[One sentence describing what the app does and why it matters]

Download: [link]

Built with [relevant tech/philosophy]. We'd love your feedback.
```
