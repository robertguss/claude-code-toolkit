# Opportunity Scoring Framework

Score each opportunity on 5 dimensions (1-5 scale). Total score determines rank.

## Scoring Rubric

### 1. Market Demand (1-5)

| Score | Criteria                                                                           |
| ----- | ---------------------------------------------------------------------------------- |
| 1     | No evidence of demand; no search volume; no Reddit posts                           |
| 2     | Minimal demand; few competitors; sparse user discussion                            |
| 3     | Moderate demand; several competitors exist; some search volume                     |
| 4     | Strong demand; active Reddit/forum discussions; growing trend                      |
| 5     | Intense demand; many "is there an app for X?" posts; rising trend on Google Trends |

### 2. Competition Weakness (1-5)

| Score | Criteria                                                              |
| ----- | --------------------------------------------------------------------- |
| 1     | Dominant player with 1M+ ratings and strong reviews; no gaps          |
| 2     | Strong incumbents but with minor UX issues                            |
| 3     | Several competitors; mixed reviews; some feature gaps                 |
| 4     | Competitors have poor reviews (<3.5 stars); clear missing features    |
| 5     | Competitors are widely hated; same complaints everywhere; outdated UX |

### 3. Revenue Potential (1-5)

| Score | Criteria                                                        |
| ----- | --------------------------------------------------------------- |
| 1     | Users expect free; no monetization path; ad-only viable         |
| 2     | Low willingness to pay (<$2/mo); small addressable market       |
| 3     | Moderate pricing possible ($3-5/mo); niche but paying audience  |
| 4     | Strong pricing ($6-10/mo); competitors successfully monetize    |
| 5     | Premium pricing ($10+/mo); proven willingness to pay; large TAM |

### 4. Build Feasibility (1-5)

| Score | Criteria                                                             |
| ----- | -------------------------------------------------------------------- |
| 1     | Requires hardware, complex AI, regulatory approval, or large team    |
| 2     | Significant backend infrastructure; complex integrations             |
| 3     | Moderate complexity; standard APIs; some backend needed              |
| 4     | Mostly frontend; minimal backend; well-documented APIs               |
| 5     | Pure frontend app; simple data model; solo dev can ship in 2-4 weeks |

### 5. Differentiation Clarity (1-5)

| Score | Criteria                                                        |
| ----- | --------------------------------------------------------------- |
| 1     | No clear differentiator; "me too" product                       |
| 2     | Slightly better UX but no unique value proposition              |
| 3     | One clear differentiator but hard to communicate                |
| 4     | Strong differentiator; easy to explain in one sentence          |
| 5     | Obvious gap everyone complains about; "why doesn't this exist?" |

## Score Interpretation

| Total Score | Assessment                                                   |
| ----------- | ------------------------------------------------------------ |
| 20-25       | Strong opportunity — pursue with confidence                  |
| 15-19       | Promising — worth building if the differentiator is clear    |
| 10-14       | Marginal — only pursue if you have a unique unfair advantage |
| 5-9         | Weak — avoid unless other factors compensate                 |

## Scorecard Template

```markdown
| Dimension                  | App Idea A | App Idea B | App Idea C |
| -------------------------- | ---------- | ---------- | ---------- |
| Market Demand (1-5)        |            |            |            |
| Competition Weakness (1-5) |            |            |            |
| Revenue Potential (1-5)    |            |            |            |
| Build Feasibility (1-5)    |            |            |            |
| Differentiation (1-5)      |            |            |            |
| **TOTAL**                  |            |            |            |
```

## Tiebreaker Criteria

When two opportunities score within 2 points of each other:

1. **Personal interest** — Will the builder stay motivated for 6+ months?
2. **Speed to market** — Which can ship an MVP faster?
3. **Moat potential** — Which builds defensibility over time (network effects,
   data, brand)?
4. **Content marketing fit** — Which has a natural content/SEO angle for growth?
