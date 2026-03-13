# iOS App Store Connect Submission Guide

## Account Prerequisites

- Apple Developer Program membership ($99/year)
- App ID registered in Apple Developer portal
- Provisioning profiles configured for distribution
- Certificates: Apple Distribution certificate active and valid

## App Store Connect Setup

### Create the App Record

1. Log in to [App Store Connect](https://appstoreconnect.apple.com/)
2. Navigate to My Apps → "+" → New App
3. Fill in required fields:
   - Platform: iOS
   - App name (30 characters max, must be unique on the store)
   - Primary language
   - Bundle ID (must match Xcode project)
   - SKU (internal identifier, not public)

### App Information Tab

- **Category:** Select primary and optional secondary category
- **Content Rights:** Declare if app contains third-party content
- **Age Rating:** Complete questionnaire (violence, language, mature themes)

### Pricing and Availability

- Set price tier or configure in-app purchases
- Select availability by country/region
- Pre-order configuration (optional, up to 180 days before release)

## Screenshot Specifications

### Required Device Sizes

| Device                          | Resolution  | Required                          |
| ------------------------------- | ----------- | --------------------------------- |
| 6.7" iPhone (iPhone 15 Pro Max) | 1290 x 2796 | Yes                               |
| 6.5" iPhone (iPhone 14 Plus)    | 1284 x 2778 | Yes                               |
| 5.5" iPhone (iPhone 8 Plus)     | 1242 x 2208 | Yes (if supporting older devices) |
| 12.9" iPad Pro (6th gen)        | 2048 x 2732 | Required if iPad app              |
| 12.9" iPad Pro (2nd gen)        | 2048 x 2732 | Required if iPad app              |

### Screenshot Rules

- Minimum 1 screenshot per required size, maximum 10
- Format: PNG or JPEG, RGB color space, no alpha
- Must represent the actual app experience
- Text overlays allowed but must not mislead
- Status bar content should be clean (full signal, full battery, 9:41 AM)
- Screenshots for one size can be auto-scaled to other sizes in some cases

### Screenshot Best Practices

1. **First screenshot is critical** — it appears in search results
2. Show the core value proposition immediately
3. Use device frames for professional appearance
4. Include concise callout text (2-4 words per screen)
5. Tell a story across screenshots: problem → solution → features → social proof
6. Localize text overlays for each target market

## App Preview Video Specifications

| Attribute  | Requirement                                      |
| ---------- | ------------------------------------------------ |
| Duration   | 15-30 seconds                                    |
| Format     | H.264, M4V, MP4, MOV                             |
| Resolution | Must match screenshot resolution for device size |
| Frame rate | 30fps                                            |
| Audio      | AAC, optional but recommended                    |
| File size  | Up to 500 MB                                     |

### Video Best Practices

- Show real app footage, not marketing animations
- Demonstrate the core experience in the first 5 seconds
- Add captions (many users browse without sound)
- Record on device or simulator at native resolution

## App Icon Requirements

| Attribute       | Requirement                         |
| --------------- | ----------------------------------- |
| Size            | 1024 x 1024 pixels                  |
| Format          | PNG                                 |
| Color space     | sRGB or Display P3                  |
| Transparency    | Not allowed                         |
| Rounded corners | Do not apply — the system adds them |
| Layers/alpha    | Flattened, no alpha channel         |

## Build Upload Process

### Via Xcode

1. Select Generic iOS Device as build target
2. Product → Archive
3. Window → Organizer → select archive → Distribute App
4. Select App Store Connect → Upload
5. Follow prompts for signing and export compliance

### Via Transporter

1. Export archive as .ipa from Xcode Organizer
2. Open Transporter app (free from Mac App Store)
3. Drag .ipa file into Transporter
4. Click Deliver

### Build Processing

- Builds take 15-30 minutes to process after upload
- Status progresses: Processing → Ready for Sale / Ready for Review
- Check email for processing failure notifications
- Invalid Binary status requires fix and re-upload

## Export Compliance

Answer these questions during submission:

1. **Does your app use encryption?**
   - HTTPS only → Yes, but exempt (select appropriate exemption)
   - Custom encryption → May require ERN (Encryption Registration Number)
   - No encryption at all → No

2. **Common exemptions:**
   - Standard HTTPS/TLS for API calls
   - Standard encryption from iOS SDK
   - Authentication-only encryption

## App Review Process

### Timeline

- **Standard review:** 24-48 hours (90% of apps)
- **Expedited review:** Request via App Store Connect for critical bug fixes
- **Extended review:** Up to 7 days for complex apps or first submissions

### Review Information to Provide

- **Demo account:** Username and password for any authenticated features
- **Review notes:** Explain non-obvious functionality, special hardware needs,
  or features that require specific conditions to test
- **Contact info:** Phone number and email for reviewer questions
- **Attachment:** Screenshots or video of features that are hard to access

## Common Rejection Reasons and Fixes

### Guideline 1.2: User-Generated Content

**Rejection:** App allows user-generated content without moderation.

**Fix:** Implement content reporting, blocking, and filtering. Add terms of
service. Provide mechanism to report offensive content.

### Guideline 2.1: App Completeness

**Rejection:** App crashes, has broken features, or includes placeholder
content.

**Fix:** Test every feature thoroughly. Remove all placeholder text, images, and
lorem ipsum. Ensure all buttons and links function.

### Guideline 2.3: Accurate Metadata

**Rejection:** Screenshots or description don't match the app.

**Fix:** Retake screenshots from the current build. Update description to
reflect actual features. Remove mentions of features not yet implemented.

### Guideline 3.1.1: In-App Purchase

**Rejection:** App uses external payment for digital content.

**Fix:** Use Apple's In-App Purchase for all digital goods and subscriptions.
Physical goods and services can use external payment.

### Guideline 4.0: Design

**Rejection:** App is a thin wrapper around a website, or copies another app.

**Fix:** Provide native functionality beyond what the website offers. Ensure the
app has unique value and doesn't simply duplicate App Store apps.

### Guideline 4.3: Spam

**Rejection:** App is too similar to existing apps (including your own).

**Fix:** Ensure your app has unique functionality and value. Do not submit
multiple versions of the same app targeting different keywords.

### Guideline 5.1.1: Data Collection and Storage

**Rejection:** App collects data without proper disclosure or consent.

**Fix:** Update privacy policy. Implement consent flows. Declare all data
collection in App Privacy section. Minimize data collection.

### Guideline 5.1.2: Data Use and Sharing

**Rejection:** App shares data with third parties without user consent.

**Fix:** Disclose all third-party SDKs that collect data. Implement opt-in
consent for data sharing. Update privacy policy.

## Post-Approval Actions

### Release Options

- **Manually release:** You control when the app goes live (recommended)
- **Automatic release:** Goes live immediately after approval
- **Scheduled release:** Set a specific date and time

### Phased Release (Staged Rollout)

- Available for updates (not initial release)
- Releases to increasing percentages: 1%, 2%, 5%, 10%, 20%, 50%, 100%
- Over 7 days by default
- Can pause, resume, or release to all users at any point

### After Release

1. Verify the listing is live and correct
2. Download the app from the store to test
3. Confirm in-app purchases work in production
4. Check that analytics and crash reporting receive data
5. Submit promotional artwork for editorial consideration
