# Research Methods

How Claude conducts market research for book viability assessment.

## Qualitative Research (Claude performs via web search)

### Competitor Discovery

**Search patterns:**

- `[topic] books Amazon`
- `best [topic] books`
- `[topic] books for [audience]`
- `books like [known competitor]`

**What to capture:**

- Titles and subtitles (positioning signals)
- Author names and credentials
- Publisher (traditional vs. self-published)
- Bestseller badges in search results
- Publication dates (market freshness)

### Review Analysis

**Search patterns:**

- `[book title] review`
- `[book title] Goodreads`
- `[topic] book recommendations Reddit`

**What to capture from reviews:**

- Common praise themes (what readers value)
- Common complaints (gap opportunities)
- Unmet needs mentioned
- Comparisons to other books

### Gap Identification

Look for patterns in complaints:

- "I wish this book covered..."
- "The only problem is..."
- "Great but missing..."
- "Not for beginners" / "Too basic"

These signal positioning opportunities.

### Author Credibility Signals

Search for:

- Author's other books
- Author's credentials, background
- Author's platform (podcast, newsletter, social)
- Speaking engagements, media appearances

Assess fit between author's background and book's claims.

### Market Timing

Search for:

- Trend articles about the topic
- Google Trends data
- Recent news or cultural moments
- Competing books' publication dates

Assess: Is this trending up, stable, or declining?

## Quantitative Research (Human gathers, Claude analyzes)

Claude cannot directly access Amazon product pages due to technical restrictions. For quantitative data, Claude:

1. Identifies 5-8 key competitors from qualitative research
2. Generates pre-filled CSV with titles and URLs
3. Provides Amazon Field Guide (see `references/amazon-field-guide.md`)
4. User fills in: BSR, prices, reviews, rating, pages, KU status
5. Claude analyzes the completed data

### Quantitative Indicators

**BSR Analysis:**

- Average BSR across competitors = demand signal
- BSR spread = market consistency
- Low BSR + high reviews = proven demand

**Price Analysis:**

- Price range establishes market expectations
- Median price = likely sweet spot
- Outliers may indicate premium positioning

**Review Velocity:**

- Reviews ÷ months since publication ≈ monthly review rate
- Higher velocity = active market

**KU Saturation:**

- High KU presence = readers expect free access
- Low KU presence = opportunity or signal of premium market

## Synthesis

Combine qualitative and quantitative findings:

| Signal      | Positive                            | Negative                |
| ----------- | ----------------------------------- | ----------------------- |
| BSR         | Under 50K average                   | Over 100K average       |
| Reviews     | Many, with clear complaint patterns | Few, or no clear gaps   |
| Competition | Differentiation possible            | Crowded, no white space |
| Timing      | Trending or stable evergreen        | Declining interest      |
| Credibility | Author fits the topic               | Credibility gap         |
| Platform    | Existing audience                   | Starting from zero      |

## Limitations

**Claude cannot access:**

- Amazon product pages directly
- Real-time BSR data
- Exact sales figures
- KDP category structure
- Kindle Unlimited royalty rates

**Claude can assess:**

- Market presence and positioning
- Review sentiment and gaps
- Author-market fit
- Relative competition intensity
- Timing indicators
