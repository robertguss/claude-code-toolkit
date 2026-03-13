# Google Play Store Research

## Browsing Google Play Charts

### Top Charts

Browse top free/paid/grossing apps: `https://play.google.com/store/apps/top`

### Category Pages

Browse by category: `https://play.google.com/store/apps/category/{CATEGORY_ID}`

**Apps:**

| Category          | ID                  |
| ----------------- | ------------------- |
| Art & Design      | ART_AND_DESIGN      |
| Auto & Vehicles   | AUTO_AND_VEHICLES   |
| Beauty            | BEAUTY              |
| Books & Reference | BOOKS_AND_REFERENCE |
| Business          | BUSINESS            |
| Communication     | COMMUNICATION       |
| Dating            | DATING              |
| Education         | EDUCATION           |
| Entertainment     | ENTERTAINMENT       |
| Events            | EVENTS              |
| Finance           | FINANCE             |
| Food & Drink      | FOOD_AND_DRINK      |
| Health & Fitness  | HEALTH_AND_FITNESS  |
| House & Home      | HOUSE_AND_HOME      |
| Lifestyle         | LIFESTYLE           |
| Maps & Navigation | MAPS_AND_NAVIGATION |
| Medical           | MEDICAL             |
| Music & Audio     | MUSIC_AND_AUDIO     |
| News & Magazines  | NEWS_AND_MAGAZINES  |
| Parenting         | PARENTING           |
| Personalization   | PERSONALIZATION     |
| Photography       | PHOTOGRAPHY         |
| Productivity      | PRODUCTIVITY        |
| Shopping          | SHOPPING            |
| Social            | SOCIAL              |
| Sports            | SPORTS              |
| Tools             | TOOLS               |
| Travel & Local    | TRAVEL_AND_LOCAL    |
| Video Players     | VIDEO_PLAYERS       |
| Weather           | WEATHER             |

**Games:**

| Category     | ID                |
| ------------ | ----------------- |
| Action       | GAME_ACTION       |
| Adventure    | GAME_ADVENTURE    |
| Arcade       | GAME_ARCADE       |
| Board        | GAME_BOARD        |
| Card         | GAME_CARD         |
| Casino       | GAME_CASINO       |
| Casual       | GAME_CASUAL       |
| Educational  | GAME_EDUCATIONAL  |
| Music        | GAME_MUSIC        |
| Puzzle       | GAME_PUZZLE       |
| Racing       | GAME_RACING       |
| Role Playing | GAME_ROLE_PLAYING |
| Simulation   | GAME_SIMULATION   |
| Sports       | GAME_SPORTS       |
| Strategy     | GAME_STRATEGY     |
| Trivia       | GAME_TRIVIA       |
| Word         | GAME_WORD         |

### Data Differences from iOS

Google Play listings expose additional useful data:

| Field             | Notes                                                                  |
| ----------------- | ---------------------------------------------------------------------- |
| Install count     | Shown as range (e.g., "1M+") — more direct than iOS rating-count proxy |
| Last updated date | Prominently displayed — easy to spot stale apps                        |
| Requires Android  | Shows minimum API level — hints at tech debt                           |
| Content rating    | Everyone / Teen / Mature — affects audience size                       |
| In-app purchases  | Price range shown (e.g., "$0.99-$99.99 per item")                      |
| Developer website | Direct link — useful for competitor research                           |
| Similar apps      | Google's own recommendations — reveals competitive set                 |

### Country-Specific Research

Change locale with URL parameters:

- US: `?hl=en_US&gl=us`
- UK: `?hl=en_GB&gl=gb`
- Germany: `?hl=de&gl=de`
- Japan: `?hl=ja&gl=jp`
- Brazil: `?hl=pt_BR&gl=br`
- India: `?hl=en_IN&gl=in`
- South Korea: `?hl=ko&gl=kr`
- Australia: `?hl=en_AU&gl=au`

## Google Play ASO (vs iOS)

| Field             | Google Play                                   | iOS App Store                |
| ----------------- | --------------------------------------------- | ---------------------------- |
| App name          | 30 chars max                                  | 30 chars max                 |
| Short description | 80 chars max                                  | Subtitle: 30 chars max       |
| Full description  | 4,000 chars max (searchable)                  | 4,000 chars (NOT searchable) |
| Keywords          | No keyword field — extracted from description | 100 chars, comma-separated   |
| Screenshots       | Min 2, max 8 per device type                  | Max 10                       |
| Feature graphic   | Required (1024x500)                           | No equivalent                |
| Video             | YouTube link (optional)                       | App preview video (optional) |

**Key difference:** Google Play indexes the full description for search, so
keyword stuffing the description matters more than on iOS. On iOS, the keyword
field and app name are what matter.

## Android-Specific Tech Stack Options

For the PRD tech stack section, choose based on the user's situation:

### Native Android

- **Language:** Kotlin
- **UI:** Jetpack Compose
- **Architecture:** MVVM with ViewModel + StateFlow
- **DI:** Hilt / Koin
- **Persistence:** Room (SQLite), DataStore (preferences)
- **Best for:** Performance-critical apps, deep Android integration

### Cross-Platform (recommended for indie devs)

- **React Native / Expo:** JavaScript/TypeScript, largest community, works with
  Rork
- **Flutter:** Dart, excellent UI performance, growing ecosystem
- **Best for:** Shipping to both iOS and Android with one codebase

### Android-Specific Opportunities

Categories/features that are stronger opportunities on Android than iOS:

- **Personalization:** Android allows custom launchers, icon packs, widgets —
  huge category with no iOS equivalent
- **Tools/Utilities:** Android allows deeper system integration (file managers,
  default app replacement, automation)
- **Communication:** Default SMS/dialer replacement possible on Android
- **Sideloading market:** Apps rejected by Google Play can still distribute via
  APK — not possible on iOS

### Red Flags Specific to Android

- **Fragmentation:** If the app needs to work across many screen sizes and
  Android versions, testing burden is much higher
- **Lower willingness to pay:** Android users historically convert to paid at
  lower rates than iOS users (~50-70% of iOS conversion rates)
- **Piracy:** APKs are easily shared — subscription models are more defensible
  than one-time purchases on Android
