# Google Play Console Submission Guide

## Account Prerequisites

- Google Play Developer account ($25 one-time fee)
- Google Play Console access at
  [play.google.com/console](https://play.google.com/console)
- Signing key managed by Google Play App Signing (recommended) or self-managed

## App Creation in Play Console

### Create the App

1. Open Google Play Console → All apps → Create app
2. Fill in:
   - App name (30 characters max)
   - Default language
   - App or Game designation
   - Free or Paid (cannot change after publishing)
3. Complete the declarations checklist before first submission

### Dashboard Setup Checklist

Google Play Console provides a setup dashboard with required steps. Complete all
items marked as mandatory before submitting:

- [ ] App access (does your app restrict access with login?)
- [ ] Ads declaration (does your app contain ads?)
- [ ] Content ratings (IARC questionnaire)
- [ ] Target audience
- [ ] News app declaration (if applicable)
- [ ] COVID-19 contact tracing / status app declaration (if applicable)
- [ ] Data safety form
- [ ] Government apps declaration (if applicable)

## Store Listing Assets

### App Icon

| Attribute | Requirement             |
| --------- | ----------------------- |
| Size      | 512 x 512 pixels        |
| Format    | PNG (32-bit with alpha) |
| File size | Up to 1024 KB           |

### Feature Graphic — REQUIRED

| Attribute    | Requirement       |
| ------------ | ----------------- |
| Size         | 1024 x 500 pixels |
| Format       | PNG or JPEG       |
| File size    | Up to 1024 KB     |
| Transparency | Not allowed       |

The feature graphic is prominently displayed on the store listing and in
promotional placements. Treat it as a billboard for the app.

**Best practices:**

- Do not place critical text in the outer 15% margins (may be cropped)
- Use bold, simple imagery that reads well at small sizes
- Include the app name and a short tagline
- Test visibility at both full size and thumbnail

### Screenshots

| Attribute     | Requirement                    |
| ------------- | ------------------------------ |
| Minimum       | 2 per device type              |
| Maximum       | 8 per device type              |
| Aspect ratio  | 16:9 or 9:16                   |
| Min dimension | 320px on shortest side         |
| Max dimension | 3840px on longest side         |
| Format        | PNG or JPEG (24-bit, no alpha) |

**Device types requiring screenshots:**

- Phone (required)
- 7-inch tablet (recommended)
- 10-inch tablet (recommended)
- Chromebook (recommended if targeting Chrome OS)

### Promotional Video

- Host on YouTube (unlisted is fine)
- Paste the YouTube URL in the store listing
- No age restriction on the video
- Keep under 2 minutes; first 30 seconds are most important
- Do not include ads in the video

## Store Listing Text

### Short Description

- Maximum 80 characters
- Appears prominently in search results and store listing
- Include primary keyword and value proposition
- Equivalent to iOS "subtitle" in prominence

### Full Description

- Maximum 4000 characters
- First 1-3 lines visible before "Read more" — make them count
- **Google Play has no keyword field** — optimize the full description for
  target search terms naturally
- Use formatting: bullet points, line breaks, emoji (sparingly)
- Include a call to action near the end

### What's New (Release Notes)

- Maximum 500 characters
- Shown to existing users considering the update
- Be specific about changes, not generic ("bug fixes and improvements")

## Content Rating (IARC)

1. Navigate to Policy → App content → Content ratings
2. Start the IARC questionnaire
3. Answer questions about: violence, sexuality, language, substances, user
   interaction, data sharing, location sharing, purchasing
4. Receive automatic rating for multiple regions:
   - ESRB (Americas)
   - PEGI (Europe)
   - USK (Germany)
   - ClassInd (Brazil)
   - GRAC (South Korea)
   - IARC Generic
5. Review and apply the ratings

**Warning:** Inaccurate responses can lead to app removal. Be thorough and
honest.

## Data Safety Form

Required for all apps. Declare:

1. **Data collection:** What types of data the app collects
   - Personal info (name, email, phone, address)
   - Financial info (purchase history, credit info)
   - Location (approximate, precise)
   - App activity (app interactions, search history)
   - Device/IDs (device ID, advertising ID)

2. **Data sharing:** What data is shared with third parties
   - Include analytics SDKs, ad networks, crash reporters

3. **Data handling practices:**
   - Is data encrypted in transit?
   - Can users request data deletion?
   - Is the app compliant with the Families policy (if targeting children)?

4. **Security practices:**
   - Data encrypted in transit (HTTPS)
   - Follows Google Play Families Policy (if applicable)

## Build Upload

### App Bundle Requirements

- **Format:** Android App Bundle (.aab) — APKs no longer accepted for new apps
- **Signing:** Enroll in Google Play App Signing (required for new apps)
- **Upload key:** Used to sign the upload; Google re-signs with the app signing
  key
- **Target API level:** Must target latest required API level (currently API 34
  / Android 14 for new apps)

### Testing Tracks

| Track      | Audience               | Review Required  | Purpose            |
| ---------- | ---------------------- | ---------------- | ------------------ |
| Internal   | Up to 100 testers      | No               | Quick team testing |
| Closed     | Invite-only, unlimited | Yes (first time) | Beta testing       |
| Open       | Anyone can join        | Yes              | Public beta        |
| Production | All users              | Yes              | Live release       |

### Upload Process

1. Select the testing track → Create new release
2. Upload the signed .aab file
3. Add release notes
4. Review and roll out

### Pre-Launch Report

Google automatically tests the uploaded build on real devices:

- Accessibility issues
- Crashes and ANRs
- Security vulnerabilities
- Performance metrics

Review the pre-launch report before promoting to production.

## Staged Rollout

### How It Works

- Set a percentage of users to receive the update
- Recommended progression: 10% → 25% → 50% → 100%
- Monitor crash rate and ANR rate at each stage
- Pause or halt rollout if issues arise

### Rollout Controls

- **Increase percentage:** Click "Edit release" → adjust percentage
- **Halt rollout:** Stops the update from reaching new users
- **Resume rollout:** Continue from where it was halted
- **Full rollout:** Release to 100% of users

### When to Halt

- Crash-free rate drops below 99%
- ANR rate exceeds 0.5%
- Critical bug reports from users in rollout
- Unexpected battery or data usage spikes

## Common Rejection Reasons and Fixes

### Policy: Deceptive Behavior

**Rejection:** App description or screenshots don't match functionality.

**Fix:** Update store listing to accurately reflect current features. Remove
claims about features not yet implemented.

### Policy: Privacy and Data Safety

**Rejection:** Data safety form doesn't match actual data collection.

**Fix:** Audit all SDKs and libraries for data collection. Update data safety
form to match reality. Add privacy policy link.

### Policy: Families

**Rejection:** App targets children but violates Families Policy.

**Fix:** If not targeting children, update target audience settings. If
targeting children, comply with COPPA and Families Policy requirements.

### Policy: Permissions

**Rejection:** App requests permissions not justified by core functionality.

**Fix:** Remove unnecessary permission requests. Provide in-context explanation
before requesting each permission. Use the least-privileged permission
available.

### Policy: Ads

**Rejection:** Ads are deceptive, interruptive, or inappropriate.

**Fix:** Use non-intrusive ad formats. Do not show ads that mimic system
notifications. Label ads clearly. Do not show inappropriate ads in apps
targeting children.

### Technical: Target API Level

**Rejection:** App doesn't target the required minimum API level.

**Fix:** Update `targetSdkVersion` in build.gradle to the current requirement.
Test on the latest Android version.

### Technical: 64-bit Requirement

**Rejection:** App doesn't include 64-bit native libraries.

**Fix:** Ensure all native libraries (NDK) include arm64-v8a and x86_64
architectures. Using App Bundles handles this automatically for most cases.

## Post-Publish Actions

1. Verify the listing appears in Google Play search
2. Install from the store on a test device
3. Confirm in-app billing works in production
4. Check Firebase / analytics for incoming data
5. Review the Android vitals dashboard for crash and ANR rates
6. Apply for editorial feature consideration via Play Console
