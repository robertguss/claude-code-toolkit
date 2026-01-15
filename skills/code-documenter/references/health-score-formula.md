# Documentation Health Score Formula

Detailed explanation of how the documentation health score is calculated.

## Overall Health Score

The overall health score is a weighted average of four component scores:

```
Overall = (Coverage × 0.40) + (Freshness × 0.30) + (Quality × 0.20) + (Consistency × 0.10)
```

**Range:** 0-100  
**Interpretation:**
- 90-100: Excellent
- 80-89: Good
- 70-79: Adequate
- 60-69: Needs improvement
- <60: Poor

## Component Scores

### 1. Coverage Score (40% weight)

**What it measures:** Percentage of public surface area that is documented

**Calculation:**
```
Coverage = (documented_elements / total_public_elements) × 100
```

**Example for REST API:**
```
Documented endpoints: 12
Total endpoints: 12
Documented schemas: 3
Total schemas: 3
Documented error codes: 8
Total error codes: 10

Coverage = ((12 + 3 + 8) / (12 + 3 + 10)) × 100
         = (23 / 25) × 100
         = 92
```

**Adjustments:**
- **Critical elements undocumented:** -10 points per critical gap
  - Critical: Authentication, main API endpoints, installation
- **Examples missing:** -5 points if <50% of features have examples
- **Configuration undocumented:** -10 points if env vars or config missing

**Floor:** 0 (cannot go negative)

---

### 2. Freshness Score (30% weight)

**What it measures:** How current the documentation is relative to code

**Calculation:**

```
freshness_factor = 100 - (staleness_penalty)

staleness_penalty = (critical_stale × 20) + (important_stale × 10) + (minor_stale × 2)
```

**Staleness categories:**
- **Critical stale:** Docs contradict current code, examples don't run
- **Important stale:** New features undocumented, removed features still documented
- **Minor stale:** Out-of-date version numbers, old screenshots

**Example:**
```
Critical stale items: 0
Important stale items: 2
Minor stale items: 3

staleness_penalty = (0 × 20) + (2 × 10) + (3 × 2)
                  = 0 + 20 + 6
                  = 26

Freshness = 100 - 26 = 74
```

**Git-based freshness:**

If git is available, additional calculation:

```
commits_since_last_doc = number of commits since .doc-state.json was updated
max_acceptable_commits = 20

git_penalty = (commits_since_last_doc / max_acceptable_commits) × 30

Freshness = max(100 - staleness_penalty - git_penalty, 0)
```

**Example:**
```
Commits since last doc: 15
Max acceptable: 20

git_penalty = (15 / 20) × 30 = 22.5

Total penalty = 26 + 22.5 = 48.5
Freshness = 100 - 48.5 = 51.5
```

**Floor:** 0

---

### 3. Quality Score (20% weight)

**What it measures:** How well-written and useful the documentation is

**Calculation:**

```
Quality = base_quality + bonuses - penalties
```

**Base quality:** 70 (assuming adequate documentation exists)

**Bonuses (max +30):**
- Examples exist: +10
- Working, tested examples: +5
- ADRs present (≥3): +5
- Troubleshooting guide: +5
- Diagrams/visuals: +3
- Progressive examples (basic → advanced): +2

**Penalties:**
- No examples: -20
- Examples don't run: -15
- No troubleshooting: -10
- Jargon without definitions: -5
- Broken links: -5 per broken link (max -15)
- Poor formatting: -5
- No diagrams for complex concepts: -5

**Example:**
```
Base: 70
Has 12 working examples: +15
Has 4 ADRs: +5
Has troubleshooting: +5
Has 3 diagrams: +3
Has progressive examples: +2
Total bonuses: +30

No penalties

Quality = 70 + 30 - 0 = 100
```

**Example with penalties:**
```
Base: 70
Has examples but some don't run: +10 - 10 = 0
No troubleshooting: -10
3 broken links: -15
Total: 70 + 0 - 25 = 45
```

**Floor:** 20  
**Ceiling:** 100

---

### 4. Consistency Score (10% weight)

**What it measures:** Uniformity in style, terminology, and structure

**Calculation:**

```
Consistency = 100 - (inconsistency_penalty)
```

**Inconsistency penalties:**

**Terminology (max -30):**
- Same concept, different terms: -10 per conflict
- Inconsistent capitalization: -5 per conflict
- Example: "user" vs "customer" vs "client" → -10

**Tone (max -30):**
- Mix of formal and casual: -15
- Inconsistent voice (you vs one vs we): -10
- Varying formality across sections: -5

**Structure (max -20):**
- Inconsistent heading hierarchy: -10
- Different formatting for similar content: -5
- Mixed list styles: -5

**Formatting (max -20):**
- Inconsistent code block styling: -10
- Different link formats: -5
- Varying emphasis patterns: -5

**Example:**
```
Terminology issues:
- "API key" vs "access token" used interchangeably: -10

Tone issues:
- Mix of "you should" and "one should": -10

Structure issues:
- None

Formatting issues:
- Some code blocks have language labels, others don't: -10

Total penalty: -30
Consistency = 100 - 30 = 70
```

**Floor:** 0  
**Ceiling:** 100

---

## Complete Example Calculation

### Project State

**Coverage:**
- 12/12 endpoints documented
- 3/3 schemas documented
- 8/10 error codes documented
- No critical gaps

```
Coverage = ((12 + 3 + 8) / (12 + 3 + 10)) × 100
         = 92
```

**Freshness:**
- 0 critical stale items
- 2 important stale items (new endpoints not documented)
- 3 minor stale items (version numbers)
- 5 commits since last doc update

```
staleness_penalty = (0 × 20) + (2 × 10) + (3 × 2) = 26
git_penalty = (5 / 20) × 30 = 7.5
Freshness = 100 - 26 - 7.5 = 66.5 → 67
```

**Quality:**
- Base: 70
- 12 working examples: +15
- 4 ADRs: +5
- Troubleshooting guide: +5
- 3 diagrams: +3
- No penalties

```
Quality = 70 + 28 = 98
```

**Consistency:**
- One terminology inconsistency: -10
- Minor formatting issues: -5

```
Consistency = 100 - 15 = 85
```

**Overall:**
```
Overall = (92 × 0.40) + (67 × 0.30) + (98 × 0.20) + (85 × 0.10)
        = 36.8 + 20.1 + 19.6 + 8.5
        = 85
```

**Result:** Health score of 85 (Good)

---

## Health Score Trending

The manifest tracks the last 10 health scores:

```json
"trend": [65, 72, 78, 85, 85]
```

**Interpretation:**

**Upward trend (65 → 85):**
- ✅ Documentation improving
- ✅ Debt being addressed
- ✅ Quality increasing

**Flat trend (85 → 85):**
- ⚠️ Stable but not improving
- ⚠️ May indicate acceptable plateau
- ⚠️ Or may indicate neglect

**Downward trend (92 → 85):**
- ❌ Quality declining
- ❌ Debt accumulating
- ❌ Freshness degrading
- ❌ Needs attention

---

## Improvement Strategies

### To Improve Coverage (if <85)

1. Identify undocumented elements
2. Prioritize public API documentation
3. Add examples for complex features
4. Document error scenarios

### To Improve Freshness (if <85)

1. Update docs after each feature
2. Remove references to deleted features
3. Test and update examples
4. Address git commit gap

### To Improve Quality (if <85)

1. Add working examples
2. Create ADRs for major decisions
3. Build troubleshooting guide
4. Add diagrams for complex concepts
5. Fix broken links

### To Improve Consistency (if <85)

1. Create terminology glossary
2. Standardize tone throughout
3. Use consistent formatting
4. Apply consistent structure

---

## Health Score as Quality Gate

### Recommended Thresholds

**For production release:**
- Minimum overall score: 80
- Minimum coverage: 90
- Minimum freshness: 85

**For open source launch:**
- Minimum overall score: 85
- Minimum coverage: 95
- Minimum quality: 85

**For internal tools:**
- Minimum overall score: 70
- Minimum coverage: 80
- Minimum freshness: 70

### CI/CD Integration

The health score can be checked in CI:

```bash
#!/bin/bash
# check-docs-health.sh

HEALTH_SCORE=$(jq '.healthScore.overall' .doc-state.json)
MIN_SCORE=80

if (( $(echo "$HEALTH_SCORE < $MIN_SCORE" | bc -l) )); then
  echo "❌ Documentation health score ($HEALTH_SCORE) below minimum ($MIN_SCORE)"
  exit 1
else
  echo "✅ Documentation health score: $HEALTH_SCORE"
  exit 0
fi
```

Add to CI pipeline:
```yaml
- name: Check Documentation Health
  run: ./scripts/check-docs-health.sh
```

---

## Calibration and Adjustments

### Initial Baseline

First documentation run typically scores:
- 50-70: Brand new docs, gaps expected
- 70-80: Decent first pass
- 80-90: Unusually thorough initial effort
- 90-100: Rare, very comprehensive

### Realistic Targets

**Maintainable scores:**
- 85-95: Excellent and sustainable
- 95-100: Requires constant attention

**Avoid perfectionism:**
- 100/100 is rarely maintainable
- 85-90 is typically "good enough"
- Focus on high-value improvements

### When Scores Seem Wrong

If health score seems inaccurate:
1. Review component scores individually
2. Check for overly harsh penalties
3. Verify bonus criteria are fair
3. Adjust weights if needed (advanced)

**Default weights are appropriate for most projects:**
- Coverage: 40% (most important)
- Freshness: 30% (critical for accuracy)
- Quality: 20% (matters, but subjective)
- Consistency: 10% (nice to have)

---

## FAQ

**Q: Why is coverage weighted highest?**
A: Undocumented features are worse than imperfect documentation. Coverage ensures basics are present.

**Q: Why is consistency only 10%?**
A: Perfect consistency is nice but not critical. Better to have complete, fresh docs with minor inconsistencies than perfect but incomplete docs.

**Q: Can I change the weights?**
A: The skill uses standard weights. If needed, manually adjust manifest scores, but default weights work well for most projects.

**Q: What's a "good" health score?**
A: 80+ is good, 85+ is very good, 90+ is excellent. Anything above 80 indicates solid documentation.

**Q: How often should I check health score?**
A: After each feature release or weekly for active projects. Track trend over time.
