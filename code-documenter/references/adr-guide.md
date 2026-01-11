# Architecture Decision Records (ADR) Guide

How to identify, write, and organize Architecture Decision Records.

## What is an ADR?

An Architecture Decision Record documents a significant architectural or design decision, capturing:
- **What** was decided
- **Why** it was decided
- **What alternatives** were considered
- **What consequences** (trade-offs) were accepted

ADRs answer the question: **"Why did we build it this way?"**

## When to Create an ADR

### Clear Signals

**Create an ADR when:**
- ✅ Choosing a framework or major library
- ✅ Selecting a database or data store
- ✅ Deciding on authentication/authorization approach
- ✅ Adopting a significant architectural pattern
- ✅ Making a decision that's hard to reverse
- ✅ Choosing between multiple viable approaches
- ✅ Accepting a significant trade-off

**Examples:**
- "Why Express instead of Fastify?"
- "Why PostgreSQL instead of MongoDB?"
- "Why JWT tokens instead of sessions?"
- "Why microservices instead of monolith?"
- "Why GraphQL instead of REST?"

### Don't Create an ADR For

**Not worth documenting:**
- ❌ Obvious, industry-standard choices
- ❌ Trivial decisions easily reversed
- ❌ Personal coding preferences
- ❌ Temporary workarounds
- ❌ Decisions with only one viable option

**Examples of what NOT to document:**
- "Why JavaScript for a Node.js project?" (obvious)
- "Why we use const instead of var?" (coding style, not architecture)
- "Why we use npm instead of yarn?" (preference, easily reversible)

## ADR Structure

### Standard Template

```markdown
# ADR [number]: [Short title]

**Status:** [Proposed | Accepted | Deprecated | Superseded]  
**Date:** YYYY-MM-DD  
**Deciders:** [Who made this decision]  
**Technical Story:** [Issue/PR/ticket reference, if any]

## Context

[What is the situation forcing this decision?]
[What is the current state?]
[What problems are we trying to solve?]

## Decision

[What did we decide to do?]
[Be specific and clear.]

## Rationale

[Why did we choose this option?]
[What makes this the best choice given our context?]
[What benefits does this provide?]

## Consequences

### Positive

[What improves?]
[What becomes possible?]
[What gets easier?]

### Negative

[What trade-offs are we accepting?]
[What becomes harder?]
[What are we giving up?]

### Neutral

[Other changes that aren't clearly positive or negative]

## Alternatives Considered

### Alternative 1: [Name]

**Description:** [What is this alternative?]

**Pros:**
- [Benefit 1]
- [Benefit 2]

**Cons:**
- [Drawback 1]
- [Drawback 2]

**Why not chosen:** [Specific reason]

### Alternative 2: [Name]

[Repeat structure]

## References

[Links to documentation, discussions, benchmarks, etc.]
```

---

## Real Examples

### Example 1: Database Choice

```markdown
# ADR 001: Use PostgreSQL for Primary Database

**Status:** Accepted  
**Date:** 2025-01-05  
**Deciders:** Engineering team  
**Technical Story:** Issue #23

## Context

We need to choose a database for our multi-tenant SaaS application. The system needs to:
- Store structured user data and relationships
- Support complex queries across tenant data
- Handle transactions for billing operations
- Scale to thousands of tenants
- Provide strong consistency for financial data

## Decision

We will use PostgreSQL 14+ as our primary database.

## Rationale

PostgreSQL provides:
1. **ACID transactions:** Critical for billing and payment operations
2. **Rich query capabilities:** Complex JOINs and aggregations for analytics
3. **Row-level security:** Native multi-tenancy support
4. **JSON support:** Flexible schema for tenant-specific data
5. **Mature ecosystem:** Well-understood, excellent tooling
6. **Battle-tested:** Proven at scale in similar applications

## Consequences

### Positive
- Strong consistency guarantees for financial data
- Rich querying eliminates need for separate analytics database
- Native multi-tenancy features simplify tenant isolation
- Extensive PostgreSQL expertise in team

### Negative
- Higher operational complexity than managed NoSQL
- Scaling horizontally requires careful sharding strategy
- Must manage schema migrations across tenants
- Connection pooling required for high concurrency

### Neutral
- Need to set up replication for high availability
- Backup strategy required (but we'd need this anyway)

## Alternatives Considered

### Alternative 1: MongoDB

**Pros:**
- Easy horizontal scaling
- Flexible schema per tenant
- Simpler sharding

**Cons:**
- Weaker consistency model risky for financial data
- More complex transactions
- Team less familiar with MongoDB

**Why not chosen:** Financial data requires strong consistency. MongoDB's eventual consistency model adds complexity and risk we're unwilling to accept.

### Alternative 2: MySQL

**Pros:**
- Similar benefits to PostgreSQL
- Slightly simpler operations
- Large community

**Cons:**
- Inferior JSON support
- No row-level security
- Less powerful query optimizer

**Why not chosen:** PostgreSQL's row-level security and JSON support are valuable for multi-tenancy. Small operational simplicity gain doesn't outweigh these features.

## References

- [PostgreSQL Multi-tenancy Guide](https://example.com/pg-multitenancy)
- [Benchmark: Postgres vs MySQL vs MongoDB](https://example.com/benchmark)
- Team discussion thread: [Slack link]
```

---

### Example 2: Authentication Approach

```markdown
# ADR 002: JWT Tokens with Refresh Token Rotation

**Status:** Accepted  
**Date:** 2025-01-08  
**Deciders:** Security team, Backend team  

## Context

We need an authentication system for our REST API that will:
- Support web and mobile clients
- Work across multiple API servers (load balanced)
- Enable single sign-out across devices
- Maintain security against token theft
- Scale horizontally without session state

Current state: No authentication implemented yet.

## Decision

We will use JWT access tokens (15-minute expiry) with refresh tokens (30-day expiry) and refresh token rotation.

**Flow:**
1. Login returns both access token and refresh token
2. Access token used for API requests
3. When access token expires, client uses refresh token to get new pair
4. Old refresh token is invalidated (rotation)
5. Refresh tokens stored in database for revocation

## Rationale

This approach provides:
1. **Stateless API servers:** Access tokens contain all needed info, no session lookup
2. **Short-lived access tokens:** Limits damage from stolen tokens
3. **Refresh token rotation:** Detects token theft (reuse of invalidated token)
4. **Single sign-out:** Revoke refresh tokens to force re-login
5. **Mobile-friendly:** Long-lived refresh tokens avoid constant logins

## Consequences

### Positive
- API servers are fully stateless
- Easy horizontal scaling
- Good security vs. usability balance
- Works well for mobile apps

### Negative
- Requires database lookup for refresh operation
- More complex than simple session cookies
- Client must handle token refresh logic
- Refresh token storage adds database load

### Neutral
- Need background job to clean up expired refresh tokens
- Must handle refresh token rotation carefully

## Alternatives Considered

### Alternative 1: Session Cookies

**Pros:**
- Simpler to implement
- Server controls all state
- Easy to revoke sessions

**Cons:**
- Requires session store (Redis)
- CSRF protection needed
- Harder to use from mobile apps
- Doesn't work well with load balancing

**Why not chosen:** Need to support mobile apps first-class, and session cookies are awkward for native mobile. Also want stateless API servers.

### Alternative 2: JWTs without Refresh Tokens

**Pros:**
- Simplest implementation
- Fully stateless

**Cons:**
- Must choose between long-lived tokens (security risk) or short-lived (bad UX)
- No way to revoke tokens before expiry
- Cannot implement single sign-out

**Why not chosen:** No token revocation is a security dealbreaker. We need ability to force logout.

### Alternative 3: OAuth 2.0 with External Provider

**Pros:**
- Don't manage passwords ourselves
- Mature, well-tested
- Users can use existing accounts

**Cons:**
- Adds dependency on third-party
- More complex integration
- Less control over authentication flow

**Why not chosen:** For MVP, want to control entire auth flow. May add social login later as alternative, but need native auth first.

## References

- [JWT Best Practices](https://example.com/jwt-best-practices)
- [Refresh Token Rotation Explained](https://example.com/refresh-rotation)
- [OWASP Auth Cheatsheet](https://owasp.org/cheatsheets/auth)
```

---

## How the Skill Identifies ADR Opportunities

The skill looks for:

### 1. Git History Analysis
- Commits adding major dependencies
- Large refactors or restructuring
- Framework migrations
- Breaking changes

**Example signals:**
```
feat: migrate from REST to GraphQL
feat: add Redis for session storage
refactor: switch from MongoDB to PostgreSQL
```

### 2. Code Pattern Analysis
- Non-standard architectural patterns
- Unusual technology combinations
- Custom solutions instead of libraries

**Example signals:**
- Custom authentication instead of Passport.js
- Manual connection pooling instead of library
- Unusual folder structure

### 3. Technology Choices
- Database selection
- Framework choice
- State management approach
- Deployment strategy

### 4. Configuration Analysis
- Complex configuration files
- Environment-specific settings
- Feature flags

### 5. User Input
The skill asks:
- "I noticed you added Redis. Should we document why?"
- "Your auth approach is custom. Is there an ADR for this decision?"

---

## ADR Numbering and Organization

### File Naming

```
/docs/adr/
├── 001-use-postgresql.md
├── 002-jwt-authentication.md
├── 003-microservices-architecture.md
├── 004-graphql-api.md
└── README.md (index of all ADRs)
```

**Format:** `[number]-[short-title].md`
- Zero-padded numbers (001, 002, etc.)
- Lowercase, hyphen-separated
- Descriptive but concise

### ADR Index

Create an index (`/docs/adr/README.md`):

```markdown
# Architecture Decision Records

## Active Decisions

- [ADR 001: Use PostgreSQL](./001-use-postgresql.md) - 2025-01-05
- [ADR 002: JWT Authentication](./002-jwt-authentication.md) - 2025-01-08
- [ADR 003: Microservices Architecture](./003-microservices-architecture.md) - 2025-01-10

## Superseded Decisions

- [ADR 000: Use MongoDB](./000-use-mongodb.md) - Superseded by ADR 001

## Proposed (Not Yet Decided)

- [ADR 004: GraphQL API](./004-graphql-api.md) - Under discussion
```

---

## ADR Lifecycle

### Status Values

| Status | Meaning |
|--------|---------|
| **Proposed** | Under consideration, not yet decided |
| **Accepted** | Decision made and implemented |
| **Deprecated** | Still in use but we plan to change |
| **Superseded** | Replaced by a newer decision |

### Evolution Example

**Initial decision:**
```markdown
# ADR 001: Use MongoDB

**Status:** Accepted  
**Date:** 2024-06-15
```

**Later deprecated:**
```markdown
# ADR 001: Use MongoDB

**Status:** Deprecated  
**Date:** 2024-06-15  
**Deprecated:** 2025-01-05  
**Superseded by:** ADR 005

## Deprecation Note

This decision was superseded by ADR 005 (Switch to PostgreSQL) due to need for stronger consistency guarantees.
```

**New decision:**
```markdown
# ADR 005: Migrate to PostgreSQL

**Status:** Accepted  
**Date:** 2025-01-05  
**Supersedes:** ADR 001

## Context

After 6 months with MongoDB, we discovered that...
[Explains why original decision didn't work out]
```

---

## ADR Quality Checklist

Good ADRs have:
- [ ] Clear, specific decision stated
- [ ] Context explains situation/problem
- [ ] Rationale explains WHY this choice
- [ ] Consequences honestly assessed (positive AND negative)
- [ ] At least 2 alternatives considered
- [ ] Each alternative has pros/cons listed
- [ ] Clear reason why alternatives weren't chosen
- [ ] References to supporting materials

Poor ADRs are:
- ❌ Just "we chose X" with no context
- ❌ No alternatives mentioned
- ❌ Only positive consequences listed
- ❌ Vague or generic reasoning
- ❌ No specific decision (just philosophy)

---

## Common ADR Topics

### Technology Choices
- Programming language
- Framework
- Database
- Message queue
- Cache layer
- Search engine

### Architecture Patterns
- Monolith vs. microservices
- Event-driven vs. request/response
- Server-side rendering vs. client-side
- Serverless vs. traditional deployment

### Security & Auth
- Authentication approach
- Authorization model
- Secrets management
- Encryption strategy

### Data & State
- Data modeling approach
- State management (frontend)
- Caching strategy
- Session management

### Operations
- Deployment strategy
- Monitoring approach
- Logging system
- Backup strategy

### Development Process
- Branching strategy
- Code review process
- Testing approach
- CI/CD pipeline

---

## Tips for Writing ADRs

### Do:
✅ Write ADRs soon after decision (while fresh)
✅ Be honest about trade-offs
✅ Include enough context for newcomers
✅ Link to supporting materials
✅ Keep it concise (1-2 pages typically)

### Don't:
❌ Write ADRs for every tiny decision
❌ Hide or minimize downsides
❌ Write in overly technical jargon
❌ Make it a design document (keep focused)
❌ Let them get out of sync with reality

---

## ADR Value

**For current team:**
- Capture reasoning before it's forgotten
- Avoid relitigating settled decisions
- Understand trade-offs when issues arise

**For new team members:**
- Quick understanding of "why we build it this way"
- Learn from past decisions
- Avoid suggesting already-rejected alternatives

**For future you:**
- Remember why you made this choice
- Understand what you were optimizing for
- Know what trade-offs were acceptable

---

## When to Update ADRs

**Never change the decision section** - ADRs are historical records.

**Do add:**
- Deprecation notes when decision changes
- "Update YYYY-MM-DD" sections with learnings
- References to newer ADRs

**Example:**
```markdown
# ADR 002: JWT Authentication

**Status:** Accepted  
**Date:** 2025-01-08  

[Original content...]

## Update: 2025-06-15

After 6 months in production, we've learned:
- 15-minute token expiry is too short for mobile, causing poor UX
- Increased to 1-hour based on user feedback
- No security incidents related to longer expiry
```
