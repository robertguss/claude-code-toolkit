---
name: mobile-app-launch-checklist
description:
  Comprehensive step-by-step launch checklist for shipping mobile apps to the
  iOS App Store and Google Play Store. Covers pre-submission preparation, store
  asset creation, build and submission, launch day execution, and post-launch
  monitoring. Use when the user wants to launch a mobile app, prepare for App
  Store or Google Play submission, create a launch plan, review submission
  requirements, or ensure nothing is missed before releasing an app. Triggers on
  "launch checklist", "app submission", "prepare for launch", "app store
  submission", "google play submission", "ready to ship", "pre-launch review",
  "launch day plan".
---

# Mobile App Launch Checklist

Generate a structured, actionable launch checklist tailored to the user's app,
target platform(s), and timeline. Walk through each phase sequentially, confirm
completion of critical items, and flag blockers.

## Inputs

| Input       | Required | Description                        | Default            |
| ----------- | -------- | ---------------------------------- | ------------------ |
| App name    | Yes      | Name of the app being launched     | —                  |
| Platform    | Yes      | iOS, Android, or both              | Both               |
| Launch date | No       | Target launch date                 | 4 weeks from today |
| App type    | No       | Free, freemium, paid, subscription | Freemium           |

Ask for these inputs before generating the checklist. Adjust timelines and
requirements based on the target platform.

---

## Phase 1: Pre-Submission Preparation (2-4 Weeks Before)

### App Quality

- [ ] Crash-free rate exceeds 99.5% across all supported devices
- [ ] All core user flows tested end-to-end (onboarding, purchase, key features)
- [ ] Performance benchmarks met:
  - Cold launch under 2 seconds
  - Smooth scrolling at 60fps
  - Memory usage within platform limits
  - Battery impact acceptable (no background drain)
- [ ] Accessibility audit complete (VoiceOver/TalkBack, Dynamic Type, contrast)
- [ ] Offline behavior handled gracefully (error states, cached data)
- [ ] Edge cases tested: no network, low storage, permissions denied,
      interruptions

### Privacy & Compliance

- [ ] Privacy policy URL live and accessible
- [ ] **iOS:** App Tracking Transparency prompt implemented (if tracking)
- [ ] **Android:** Data safety section completed in Google Play Console
- [ ] GDPR compliance verified (if serving EU users): consent flows, data
      deletion
- [ ] CCPA compliance verified (if serving California users)
- [ ] Data collection accurately declared on both platforms
- [ ] Third-party SDK privacy policies reviewed

### Legal

- [ ] Terms of service URL live and accessible
- [ ] EULA prepared (required if subscription or in-app purchases)
- [ ] Open source license compliance: all libraries audited, attributions
      included
- [ ] Trademark search completed for app name

### Analytics & Monitoring

- [ ] Crash reporting integrated (Firebase Crashlytics, Sentry, or Bugsnag)
- [ ] Event tracking implemented for key actions (signup, purchase, core
      features)
- [ ] Funnel definitions configured (onboarding completion, trial-to-paid)
- [ ] Real-time dashboard set up for launch day monitoring
- [ ] Alerts configured for crash rate spikes and error thresholds

### Deep Linking

- [ ] **iOS:** Universal Links configured with apple-app-site-association file
- [ ] **Android:** App Links configured with assetlinks.json
- [ ] Deep links tested from email, SMS, social media, and web
- [ ] Deferred deep linking works for new installs (if applicable)

---

## Phase 2: Store Asset Preparation

Prepare all required store assets. See platform-specific reference files for
detailed specifications:

- [references/ios-submission.md](references/ios-submission.md) — Full iOS App
  Store Connect walkthrough, screenshot specs, common rejection reasons
- [references/google-play-submission.md](references/google-play-submission.md) —
  Full Google Play Console walkthrough, asset specs, policy requirements

### iOS App Store Connect

- [ ] App icon: 1024x1024 PNG, no transparency, no rounded corners
- [ ] Screenshots prepared for required device sizes:
  - 6.7" (1290x2796) — iPhone 15 Pro Max
  - 6.5" (1284x2778) — iPhone 14 Plus
  - 5.5" (1242x2208) — iPhone 8 Plus
- [ ] App preview video recorded (optional, 15-30 seconds, H.264)
- [ ] App description written (up to 4000 characters)
- [ ] Promotional text written (up to 170 characters, editable without review)
- [ ] Keywords field populated (up to 100 characters, comma-separated)
- [ ] What's New text written for version 1.0
- [ ] Age rating questionnaire completed
- [ ] App Review Information prepared:
  - Demo account credentials (if login required)
  - Review notes explaining non-obvious features
  - Contact information for reviewer questions
- [ ] App category and subcategory selected
- [ ] Support URL configured
- [ ] Copyright field filled

### Google Play Console

- [ ] Hi-res icon: 512x512 PNG
- [ ] Feature graphic: 1024x500 PNG or JPG — **REQUIRED, prominently displayed**
- [ ] Screenshots: minimum 2, maximum 8 per device type (16:9 or 9:16)
- [ ] Short description written (up to 80 characters)
- [ ] Full description written (up to 4000 characters, optimize for search)
- [ ] What's New text written
- [ ] Content rating questionnaire completed (IARC)
- [ ] Data safety form completed
- [ ] App category and tags selected
- [ ] Contact details configured (email required, phone/website optional)
- [ ] Target audience and content declarations completed

### Both Platforms

- [ ] Store listing localized for target markets (if applicable)
- [ ] Screenshot text and captions proofread
- [ ] All URLs (privacy policy, terms, support) return 200 status
- [ ] Preview the listing as users will see it

---

## Phase 3: Build & Submit

### iOS Submission

- [ ] Archive build in Xcode with Release configuration
- [ ] Upload build via Xcode or Transporter
- [ ] Export compliance questionnaire answered (encryption usage)
- [ ] Build appears in App Store Connect (allow 15-30 minutes for processing)
- [ ] Internal TestFlight testing completed (team members)
- [ ] External TestFlight testing completed (beta testers, requires Beta Review)
- [ ] All app metadata finalized in App Store Connect
- [ ] Submit for App Review
- [ ] **Expected review time:** 24-48 hours (can be longer, plan buffer)

### Android Submission

- [ ] Signed Android App Bundle (AAB) generated — APKs no longer accepted
- [ ] ProGuard/R8 obfuscation verified (no crashes from minification)
- [ ] Internal testing track: upload and verify on real devices
- [ ] Closed testing track: distribute to beta testers
- [ ] Open testing track (optional): broader beta audience
- [ ] Pre-launch report reviewed in Google Play Console (automated testing)
- [ ] All store listing metadata finalized
- [ ] Set staged rollout percentage (start at 10-20%, NOT 100%)
- [ ] Submit for review
- [ ] **Expected review time:** hours to 7 days (new apps take longer)

### Common Rejection Reasons

Avoid these before submitting. See reference files for full lists.

**iOS top rejections:**

- Crashes or bugs during review
- Broken links (privacy policy, support URL)
- Incomplete metadata or placeholder content
- Login required without demo account provided
- Guideline 4.3: spam or duplicate app
- Guideline 2.1: app not fully functional

**Google Play top rejections:**

- Data safety form inaccurate or incomplete
- Missing privacy policy for apps requesting sensitive permissions
- Deceptive behavior (description doesn't match functionality)
- Broken core functionality
- Target audience misconfigured (apps for children have extra requirements)

---

## Phase 4: Launch Day

Follow the hour-by-hour launch day timeline in
[references/launch-day-timeline.md](references/launch-day-timeline.md) for a
detailed execution plan.

### Release Strategy

- [ ] **iOS:** Release manually (not automatically after approval) for control
- [ ] **Android:** Staged rollout at 10-20% initially
- [ ] Coordinate release timing across platforms (if launching on both)
- [ ] Choose launch time: Tuesday-Thursday, 9-10 AM in primary market timezone

### Monitoring (First 6 Hours)

- [ ] Watch crash-free rate in real-time (target: >99.5%)
- [ ] **Android:** Monitor ANR (App Not Responding) rate (target: <0.5%)
- [ ] Check App Store Connect / Play Console for review alerts
- [ ] Monitor support channels for user-reported issues
- [ ] Track download velocity against projections
- [ ] Watch first user reviews and ratings

### Support Readiness

- [ ] Prepared responses drafted for common issues:
  - Login/account problems
  - Payment/subscription questions
  - Feature explanations
  - Known issues acknowledgment
- [ ] Support team briefed on new features and known limitations
- [ ] Escalation path defined for critical issues

### Marketing Activation

- [ ] Social media posts scheduled (Twitter/X, LinkedIn, Instagram)
- [ ] Product Hunt launch prepared (if applicable — launch at 12:01 AM PT)
- [ ] Reddit posts in relevant subreddits (follow community rules)
- [ ] Press outreach sent to relevant journalists/bloggers
- [ ] Email announcement sent to waitlist/existing users
- [ ] App Store / Play Store promotional campaign activated (if using)

### Go/No-Go Decision Points

- **Halt rollout if:** crash-free rate drops below 99%, critical bug in core
  flow
- **Proceed to 50% if:** 4+ hours stable, no critical issues, reviews positive
- **Proceed to 100% if:** 24+ hours stable at 50%, metrics within targets

---

## Phase 5: Post-Launch (Week 1)

### Review Management

- [ ] Respond to every review (positive and negative) within 24 hours
- [ ] Flag and report fraudulent/spam reviews
- [ ] Categorize feedback themes for product roadmap input
- [ ] **iOS:** Implement SKStoreReviewController for in-app review prompts
      (after positive moments, max 3 times per 365 days)
- [ ] **Android:** Implement In-App Review API (after meaningful engagement)

### Crash Triage & Hotfix

- [ ] Review crash reports daily for the first week
- [ ] Prioritize crashes by user impact (affected users x severity)
- [ ] Ship hotfix within 48 hours for any crash affecting >1% of users
- [ ] **iOS:** Request expedited review for critical hotfixes
- [ ] **Android:** Use staged rollout to validate hotfix before full release

### Metrics Review

Track and review these metrics at Day 1, Day 3, and Day 7:

| Metric                   | Target | Action if Below            |
| ------------------------ | ------ | -------------------------- |
| D1 Retention             | >40%   | Review onboarding flow     |
| D7 Retention             | >20%   | Review core value delivery |
| Crash-free rate          | >99.5% | Prioritize stability fixes |
| Store rating             | >4.0   | Address top complaints     |
| Trial-to-paid conversion | >5%    | Review paywall and pricing |
| Session length           | >3 min | Review engagement hooks    |
| Onboarding completion    | >70%   | Simplify onboarding steps  |

### Feature Request & Visibility

- [ ] Submit App Store feature request to Apple editorial team (via App Store
      Connect → App Features page)
- [ ] Apply for Google Play editorial feature (via Play Console → Store presence
      → Feature request)
- [ ] Compile feature request list from user feedback for v1.1 planning
- [ ] Schedule v1.1 planning session based on launch data

---

## Generating the Checklist

When producing the checklist for the user:

1. **Tailor to platform.** Remove iOS-specific items for Android-only launches
   and vice versa. Keep both sections for cross-platform launches.
2. **Adjust timeline.** Map checklist phases to the user's actual launch date.
   Add specific dates to each phase header.
3. **Flag blockers.** Mark items that block submission (privacy policy, app
   icon, signed build) distinctly from nice-to-haves (preview video, Product
   Hunt).
4. **Save as file.** Write the completed checklist to
   `LAUNCH-CHECKLIST-{AppName}.md` in the project root.
5. **Offer to deep-dive.** After generating the checklist, ask if the user wants
   to walk through any specific phase in detail, referencing the appropriate
   reference file.
