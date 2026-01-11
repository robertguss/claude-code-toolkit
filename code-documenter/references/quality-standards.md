# Documentation Quality Standards

Concrete criteria for evaluating documentation quality. These standards guide documentation generation and assessment.

## The Four Quality Dimensions

Documentation quality is measured across four dimensions:

1. **Coverage** (40% of health score)
2. **Freshness** (30% of health score)
3. **Quality** (20% of health score)
4. **Consistency** (10% of health score)

---

## 1. Coverage Quality

**Definition:** What percentage of the public surface area is documented?

### Scoring Criteria

| Score | Coverage | Description |
|-------|----------|-------------|
| 90-100 | ≥95% | Nearly complete coverage |
| 80-89 | 85-94% | Good coverage, minor gaps |
| 70-79 | 75-84% | Adequate, noticeable gaps |
| 60-69 | 65-74% | Partial coverage |
| <60 | <65% | Significant gaps |

### What Counts as "Public Surface"

**For APIs:**
- Every endpoint
- Every request parameter
- Every response field
- Every error code
- Authentication requirements

**For CLIs:**
- Every command
- Every flag/option
- Every subcommand
- Configuration options
- Environment variables

**For Libraries:**
- Every exported function
- Every exported class
- Every public method
- Every exported type
- Key configuration options

**For Web Apps:**
- Every user-facing feature
- Major UI components
- Configuration options
- Deployment process

### Quality Criteria for Coverage

✅ **High Quality:**
- Every public element has documentation
- No "TODO" or placeholder sections
- Examples provided for non-trivial elements
- Edge cases and limitations noted

❌ **Low Quality:**
- Missing documentation for key features
- Placeholder text like "Coming soon"
- No examples for complex features
- Undocumented breaking changes

### Example: API Coverage

**100% Coverage:**
```markdown
### GET /api/users/:id

Retrieves a single user by ID.

**Parameters:**
- `id` (required): User ID as UUID

**Response:** 200 OK
[full response example]

**Errors:**
- 401: Unauthorized
- 404: User not found

**Example:**
[working code example]
```

**50% Coverage:**
```markdown
### GET /api/users/:id

Gets a user.
```

---

## 2. Freshness Quality

**Definition:** How current is the documentation relative to the codebase?

### Scoring Criteria

| Score | Freshness | Description |
|-------|-----------|-------------|
| 90-100 | Current | Docs match latest code |
| 80-89 | Mostly current | 1-2 minor outdated items |
| 70-79 | Somewhat stale | 3-5 outdated items |
| 60-69 | Stale | 6-10 outdated items |
| <60 | Very stale | >10 outdated items or critical stale docs |

### What Makes Docs Stale

**Code changed, docs didn't:**
- New features undocumented
- Changed API signatures not updated
- Removed features still documented
- Old examples that no longer work

**Indicators of staleness:**
- Git commits adding features without doc updates
- Inline code comments contradicting docs
- Examples using deprecated patterns
- Screenshots showing old UI

### Quality Criteria for Freshness

✅ **High Quality:**
- All recent changes documented
- Examples tested and working
- Breaking changes clearly noted
- Migration guides for major changes

❌ **Low Quality:**
- Examples don't run
- References to removed features
- Old version numbers in examples
- Contradictions between code and docs

### Example: Fresh vs. Stale

**Fresh:**
```markdown
### Authentication (Updated: 2025-01-10)

We use JWT tokens. As of v2.0, tokens expire after 1 hour.

**Breaking Change in v2.0:** Token lifetime reduced from 24h to 1h.

**Migration:** Implement token refresh. See [refresh guide](./auth-refresh.md)
```

**Stale:**
```markdown
### Authentication

We use session cookies.

[Note: This was true in v1.x but changed in v2.0]
```

---

## 3. Quality Quality

**Definition:** How well-written and useful is the documentation?

This dimension evaluates the documentation itself, not just coverage or freshness.

### Scoring Criteria

| Score | Quality Level | Description |
|-------|---------------|-------------|
| 90-100 | Excellent | Clear, complete, helpful, abundant examples |
| 80-89 | Good | Clear and helpful, some examples |
| 70-79 | Adequate | Understandable but could be better |
| 60-69 | Poor | Confusing or minimal |
| <60 | Very poor | Unclear, unhelpful, or misleading |

### Quality Factors

#### Clarity
- Concepts explained before used
- Technical terms defined
- Logical flow of information
- No ambiguity

#### Completeness
- "Why" explained, not just "what"
- Edge cases covered
- Limitations noted
- Troubleshooting provided

#### Examples
- Working code examples
- Multiple examples showing different use cases
- Examples progress from simple to complex
- Examples are realistic

#### Usability
- Easy to navigate
- Good table of contents
- Cross-references work
- Searchable

### Quality Criteria

✅ **High Quality:**
- Multiple working examples per major feature
- Architecture Decision Records explaining "why"
- Troubleshooting section with real issues
- Diagrams for complex concepts
- Progressive disclosure (simple → complex)

❌ **Low Quality:**
- No examples, or examples that don't run
- Only "what" documented, no "why"
- No troubleshooting
- Assumes too much knowledge
- Disorganized structure

### Example: High Quality Section

```markdown
## Rate Limiting

To prevent abuse, all API endpoints are rate limited.

### How It Works

Each API key gets 1000 requests per hour. This counter resets at the top of each hour (e.g., 2:00pm, 3:00pm).

### Why Rate Limiting?

We implement rate limiting to:
- Prevent abuse and DoS attacks
- Ensure fair resource allocation
- Maintain service stability

See [ADR-003](./adr/003-rate-limiting.md) for the full decision rationale.

### Checking Your Limit

Response headers show your status:

```http
X-RateLimit-Limit: 1000
X-RateLimit-Remaining: 742
X-RateLimit-Reset: 1641654000
```

### Example: Handling Rate Limits

```javascript
async function makeRequest() {
  const response = await fetch('/api/users', {
    headers: { 'Authorization': `Bearer ${token}` }
  });
  
  if (response.status === 429) {
    const resetTime = response.headers.get('X-RateLimit-Reset');
    const waitMs = (resetTime * 1000) - Date.now();
    console.log(`Rate limited. Waiting ${waitMs}ms`);
    await sleep(waitMs);
    return makeRequest(); // Retry
  }
  
  return response.json();
}
```

### Troubleshooting

**Problem:** Getting 429 errors frequently

**Causes:**
- Making requests in tight loops
- Multiple servers using same key
- Burst traffic patterns

**Solutions:**
- Implement exponential backoff
- Use separate API keys per server
- Batch requests where possible
- Cache responses
```

---

## 4. Consistency Quality

**Definition:** Is documentation uniform in style, terminology, and structure?

### Scoring Criteria

| Score | Consistency | Description |
|-------|-------------|-------------|
| 90-100 | Very consistent | Uniform throughout |
| 80-89 | Mostly consistent | Minor inconsistencies |
| 70-79 | Somewhat inconsistent | Noticeable variance |
| 60-69 | Inconsistent | Feels disjointed |
| <60 | Very inconsistent | Chaotic, confusing |

### Consistency Factors

#### Terminology
- Same terms used for same concepts
- No synonyms causing confusion
- Capitalization consistent
- Abbreviations defined once, used consistently

#### Tone
- Formal vs. casual consistent
- Second person ("you") vs. third person
- Active vs. passive voice

#### Structure
- Sections follow similar patterns
- Headers use consistent hierarchy
- Code blocks formatted uniformly
- Lists formatted the same way

#### Formatting
- Consistent markdown style
- Code syntax highlighting
- Link formatting
- Emphasis (bold/italic) patterns

### Quality Criteria

✅ **High Quality:**
- Style guide followed throughout
- Terminology defined in glossary
- Consistent section structure
- Uniform code formatting
- Same tone throughout

❌ **Low Quality:**
- "User" vs "customer" vs "client" used interchangeably
- Mix of casual and formal tone
- Inconsistent header levels
- Different code formatting styles
- Random capitalization

### Example: Inconsistent vs. Consistent

**Inconsistent:**
```markdown
## Getting Started

Install the package:
`npm install myapp`

## API reference

Use the createUser method:

~~~javascript
createUser(userData)
~~~

## Usage

You can make a new user like this:
```js
makeNewUser({name: "John"})
```
```

**Consistent:**
```markdown
## Getting Started

Install the package:

```bash
npm install myapp
```

## API Reference

### createUser(userData)

Creates a new user.

**Example:**
```javascript
const user = await createUser({ name: "John" });
```

## Usage

### Creating Users

```javascript
const user = await createUser({ name: "John" });
```
```

---

## Additional Quality Indicators

### Examples Quality

**Excellent examples:**
- Actually run without modification
- Cover common use cases
- Show error handling
- Include comments explaining why
- Progress from simple to advanced

**Poor examples:**
- Pseudocode that doesn't run
- Missing setup steps
- No error handling
- No context provided

### Architecture Documentation Quality

**Excellent architecture docs:**
- System diagram showing components
- Data flow diagrams
- Explanation of design decisions
- Trade-offs discussed
- Alternatives considered documented

**Poor architecture docs:**
- No diagrams
- Just lists of technologies
- No explanation of "why"
- Missing important details

### Troubleshooting Quality

**Excellent troubleshooting:**
- Organized by symptom/error
- Common issues documented
- Root causes explained
- Step-by-step solutions
- Prevention tips

**Poor troubleshooting:**
- Just "check the logs"
- No specific errors listed
- Vague solutions
- Missing common issues

### ADR Quality

**Excellent ADRs:**
- Clear context (what was the situation?)
- Specific decision made
- Detailed rationale
- Consequences acknowledged
- Alternatives considered with trade-offs

**Poor ADRs:**
- Just "we chose X"
- No context
- No rationale
- Alternatives not mentioned

---

## Accessibility Quality

Good documentation is accessible:

✅ **Accessible:**
- Headings use proper hierarchy (h1 → h2 → h3)
- Links have descriptive text ("see authentication guide" not "click here")
- Images have alt text
- Code blocks have language labels
- Color not sole means of conveying info

❌ **Not accessible:**
- Broken heading hierarchy
- "Click here" links
- Images without alt text
- Unlabeled code blocks
- Red/green as only diff indicator

---

## Testing Documentation Quality

### Manual Tests

1. **The Newcomer Test**
   - Can someone who's never seen this project get started?
   - Are prerequisites clear?
   - Do the quick start steps work?

2. **The Example Test**
   - Copy examples and run them
   - Do they work without modification?
   - Are all dependencies mentioned?

3. **The Search Test**
   - Pick a common task
   - Can you find the answer in docs?
   - Is it easy to find?

4. **The Link Test**
   - Do all internal links work?
   - Do external links resolve?
   - No broken references?

5. **The Completeness Test**
   - Pick a public API element
   - Is it fully documented?
   - Are edge cases covered?

### Automated Tests

**Link validation:**
```bash
# Script to check all links
./docs/scripts/validate-links.sh
```

**Example testing:**
```bash
# Run all example code
./docs/scripts/test-examples.sh
```

**Accessibility checking:**
```bash
# Check heading hierarchy, alt text, etc.
./docs/scripts/accessibility-check.sh
```

---

## Quality Improvement Checklist

When improving documentation quality:

**Coverage:**
- [ ] Identify undocumented public APIs
- [ ] Add missing examples
- [ ] Document edge cases
- [ ] Cover error scenarios

**Freshness:**
- [ ] Update examples to match current code
- [ ] Remove references to deleted features
- [ ] Add migration guides for breaking changes
- [ ] Update version numbers

**Quality:**
- [ ] Add "why" to accompany "what"
- [ ] Create working examples
- [ ] Add troubleshooting section
- [ ] Create diagrams for complex concepts

**Consistency:**
- [ ] Standardize terminology
- [ ] Uniform tone throughout
- [ ] Consistent formatting
- [ ] Follow style guide

---

## Reviewing Documentation

### Review Checklist

**Accuracy:**
- [ ] All facts verified against code
- [ ] Examples tested and working
- [ ] Version numbers correct
- [ ] Links resolve

**Completeness:**
- [ ] All features documented
- [ ] Configuration covered
- [ ] Troubleshooting present
- [ ] Examples for main use cases

**Clarity:**
- [ ] Understandable to target audience
- [ ] No jargon without definition
- [ ] Logical flow
- [ ] Visual aids where helpful

**Findability:**
- [ ] Good navigation
- [ ] Clear headings
- [ ] Searchable terms
- [ ] Useful table of contents
