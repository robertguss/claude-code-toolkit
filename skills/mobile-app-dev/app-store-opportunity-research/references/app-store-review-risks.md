# App Store Review Risks & Guidelines

Understanding App Store review risks before building saves weeks of wasted work.
Some categories have significantly higher rejection rates.

## High-Risk Categories

### Health & Medical Claims
- **Risk:** Apps making medical claims without clinical validation get rejected
- **Rules:** Cannot diagnose, treat, or claim to cure conditions. "Track your
  anxiety" is fine; "Cure your anxiety" is not.
- **Mitigation:** Use "wellness" language, include disclaimers, don't replace
  medical advice
- **Entitlements:** HealthKit access requires justification

### Kids & Education (COPPA/GDPR-K)
- **Risk:** Kids category has strict rules on data collection, ads, and external links
- **Rules:** No third-party analytics, no targeted ads, no links outside the app,
  no account creation for children
- **Mitigation:** If targeting kids, go fully offline and ad-free. Consider
  "Made for Kids" designation carefully — it's restrictive.
- **Age gate:** Required if content could be age-inappropriate

### Financial & Trading
- **Risk:** Apps providing financial advice or trading functionality face extra scrutiny
- **Rules:** Cannot guarantee returns, must include risk disclaimers, may need
  financial licenses depending on functionality
- **Mitigation:** Frame as "tracking" or "education" rather than "advice"

### VPN & Content Filtering
- **Risk:** VPN and content filtering apps require special entitlements
- **Rules:** Must request Network Extension entitlement from Apple, explain use case
- **Mitigation:** Apply for entitlement early in development, not after building

### Gambling & Contests
- **Risk:** Real-money gambling requires licenses in every jurisdiction
- **Rules:** Skill-based contests with entry fees are also regulated in many states
- **Mitigation:** Avoid real-money mechanics entirely for indie apps

## Medium-Risk Categories

### AI-Generated Content
- **Risk:** Apps generating AI content must handle inappropriate outputs
- **Rules:** Must filter harmful/illegal content, disclose AI use, handle edge cases
- **Mitigation:** Implement content filtering, add clear AI disclaimers

### Subscription Apps
- **Risk:** Apple scrutinizes subscription value and dark patterns
- **Rules:** Must clearly communicate what's free vs paid, no misleading trial UX,
  easy cancellation path, must deliver ongoing value
- **Mitigation:** Transparent pricing, generous free tier, clear upgrade prompts

### Data Collection & Privacy
- **Risk:** Privacy nutrition labels must be accurate; discrepancies cause rejection
- **Rules:** Must declare all data collection, link to privacy policy, implement
  App Tracking Transparency if tracking
- **Mitigation:** Minimize data collection, be fully transparent, consider
  privacy-first architecture (on-device processing)

## Low-Risk Categories

These categories have straightforward review processes:

- Simple utilities (calculators, converters, timers)
- Productivity tools (notes, lists, organizers)
- Entertainment (soundboards, wallpapers)
- Lifestyle (recipes, home organization)
- Reference (guides, dictionaries)
- Most games (no gambling, no real-money)

## Common Rejection Reasons (All Categories)

| Reason                        | Frequency | How to Avoid                                    |
| ----------------------------- | --------- | ----------------------------------------------- |
| Bugs/crashes                  | Very High | Test thoroughly on real devices before submitting |
| Incomplete metadata           | High      | Fill all fields, include screenshots for all sizes |
| Misleading description        | High      | Description must match actual functionality       |
| Guideline 4.3 (spam/copycat)  | Medium    | Ensure genuine differentiation from existing apps |
| Missing privacy policy        | Medium    | Always include, even for simple apps              |
| Minimum functionality         | Medium    | App must do more than a website could             |
| Broken links                  | Low       | Test all external links and deep links            |

## Pre-Submission Checklist

Before submitting any app to the App Store:

1. [ ] Privacy policy URL is live and accurate
2. [ ] Privacy nutrition labels match actual data collection
3. [ ] App Tracking Transparency implemented (if tracking)
4. [ ] No placeholder content or "coming soon" features
5. [ ] Tested on latest iOS version + one version back
6. [ ] Tested on multiple device sizes (iPhone SE through Pro Max)
7. [ ] All screenshots are accurate and up to date
8. [ ] Description matches actual functionality
9. [ ] No references to other platforms ("also on Android")
10. [ ] Subscription terms are clear and comply with StoreKit guidelines
11. [ ] HealthKit/location/camera permissions have clear purpose strings
12. [ ] No private API usage

## Apple Review Timeline

- **Standard review:** 24-48 hours (90% of submissions)
- **Expedited review:** Available for critical fixes, request via App Store Connect
- **First submission:** May take longer (3-5 days) as reviewers are more thorough
- **Rejection appeal:** Respond via Resolution Center with clear explanation
- **Tip:** Submit Monday-Wednesday for fastest turnaround
