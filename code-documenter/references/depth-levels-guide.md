# Documentation Depth Levels

Guide to choosing between **Standard** and **Deep** documentation depth.

## Overview

The skill offers two documentation depth levels:

| Level | Word Count | Coverage | Use When |
|-------|-----------|----------|----------|
| **Standard** | 4,000-7,000 | Public surface + essentials | Most projects, balanced coverage |
| **Deep** | 8,000-12,000 | Public + internals + advanced | Complex projects, teaching-focused |

## Standard Depth

### What's Included

✅ **Core Documentation:**
- README with quick start
- Installation guide
- API/CLI/Component reference
- Basic architecture overview
- Common use cases with examples
- Troubleshooting for frequent issues
- Contributing guide (for open source)

✅ **Coverage:**
- All public APIs documented
- Key configuration options
- Main user flows
- Common error scenarios

✅ **Examples:**
- 1-2 examples per major feature
- Basic usage patterns
- Common configurations

**NOT included:**
- Internal implementation details
- Advanced edge cases
- Performance tuning deep dives
- Extensive architectural rationale

### Ideal For

- **Most web APIs:** Document endpoints, not internal middleware details
- **CLIs with <20 commands:** Full command reference, standard examples
- **Libraries with focused API:** Document public surface well
- **Internal tools:** Enough for team to use effectively
- **MVP/Early stage:** Sufficient for initial users

### Example: Standard REST API Docs

```
README.md (~800 words)
├─ Quick start
├─ What is this?
└─ Links to full docs

/docs/developers/
├─ api.md (~2,500 words)
│  ├─ Authentication
│  ├─ Endpoints (grouped by resource)
│  ├─ Request/response examples
│  └─ Error codes
├─ architecture.md (~1,200 words)
│  ├─ High-level system diagram
│  ├─ Database schema overview
│  └─ Key technologies
├─ deployment.md (~800 words)
│  ├─ Docker deployment
│  ├─ Environment variables
│  └─ Basic troubleshooting
├─ contributing.md (~500 words)
└─ examples/ (5-7 working examples)

Total: ~6,000 words
```

---

## Deep Depth

### What's Included

✅ **Everything from Standard, plus:**
- Internal architecture deep dive
- Design pattern explanations
- Performance considerations
- Advanced use cases
- Extensive troubleshooting
- Multiple ADRs (Architecture Decision Records)
- Migration guides
- Testing strategies
- Security considerations

✅ **Coverage:**
- Public APIs fully documented
- Internal implementation patterns explained
- Edge cases and gotchas
- Performance characteristics
- Advanced configuration

✅ **Examples:**
- 3-5 examples per major feature
- Progressive examples (basic → advanced)
- Real-world scenarios
- Anti-pattern warnings

**Includes:**
- Why decisions were made (ADRs)
- How things work internally
- When to use advanced features
- Performance tuning guides

### Ideal For

- **Complex systems:** Microservices, distributed systems
- **Teaching/learning resources:** Need to explain "why" deeply
- **Framework/library:** Users need to understand internals to extend
- **Enterprise software:** Teams need deep knowledge
- **Open source with contributors:** Help people contribute effectively

### Example: Deep REST API Docs

```
README.md (~1,000 words)
├─ Comprehensive quick start
├─ What/why/who
└─ Full navigation

/docs/developers/
├─ api.md (~3,500 words)
│  ├─ Authentication (with flow diagrams)
│  ├─ All endpoints with details
│  ├─ Request/response examples
│  ├─ Error codes with recovery
│  └─ Rate limiting internals
├─ architecture.md (~2,500 words)
│  ├─ System architecture (detailed diagrams)
│  ├─ Request lifecycle
│  ├─ Database design with ERD
│  ├─ Caching strategy
│  └─ Service dependencies
├─ deployment.md (~1,500 words)
│  ├─ Multiple deployment options
│  ├─ Configuration deep dive
│  ├─ Monitoring and logging
│  ├─ Performance tuning
│  └─ Comprehensive troubleshooting
├─ contributing.md (~800 words)
│  ├─ Development setup
│  ├─ Code organization
│  ├─ Testing approach
│  └─ PR workflow
├─ security.md (~1,000 words)
│  ├─ Threat model
│  ├─ Authentication details
│  ├─ Authorization patterns
│  └─ Security best practices
├─ performance.md (~900 words)
│  ├─ Benchmarks
│  ├─ Optimization techniques
│  ├─ Caching strategies
│  └─ Scaling considerations
├─ adr/ (6-10 decision records)
│  ├─ 001-framework-choice.md
│  ├─ 002-database-selection.md
│  ├─ 003-authentication-approach.md
│  └─ ...
└─ examples/ (12-15 working examples)
   ├─ basic/
   ├─ intermediate/
   └─ advanced/

Total: ~11,000 words
```

---

## Comparison by Project Type

### REST API

**Standard:**
- Document all endpoints
- Basic architecture
- Standard deployment
- ~5-7 examples

**Deep:**
- All endpoints with internals
- Request lifecycle explained
- Database design details
- Performance tuning
- Security deep dive
- ~12-15 examples

---

### CLI Tool

**Standard:**
- All commands documented
- Installation for main platforms
- Configuration basics
- ~5-8 examples

**Deep:**
- Commands + internal architecture
- Plugin system explained
- Advanced configuration
- Shell integration details
- Cross-platform nuances
- ~12-15 examples

---

### JavaScript Library

**Standard:**
- Public API documented
- Basic usage patterns
- Installation
- ~5-7 examples

**Deep:**
- Public API + internals
- How the library works
- Extension points
- Advanced patterns
- Bundle size optimization
- Tree-shaking guidance
- ~12-18 examples

---

### Web Application

**Standard:**
- User guide
- Developer setup
- Component overview
- Deployment basics
- ~6-8 examples

**Deep:**
- User guide + internals
- State management explained
- Component architecture
- Performance optimization
- Testing strategies
- Multiple deployment scenarios
- ~15-20 examples

---

## Decision Framework

### Choose **Standard** if:

✓ Your project has:
- Straightforward architecture
- Well-defined public API
- Standard patterns
- Documentation mainly for usage

✓ Your users need to:
- Use the product effectively
- Understand what it does
- Get started quickly
- Troubleshoot common issues

✓ Your goal is:
- Get docs shipped quickly
- Cover the essentials well
- Maintain minimal docs

### Choose **Deep** if:

✓ Your project has:
- Complex architecture
- Non-obvious design decisions
- Novel approaches
- Extension points

✓ Your users need to:
- Understand how it works internally
- Extend or modify the system
- Contribute code
- Optimize performance

✓ Your goal is:
- Comprehensive knowledge transfer
- Enable advanced usage
- Support contributors
- Explain complex decisions

---

## Real-World Examples

### Standard Depth Example

**Project:** Simple REST API for task management

**Documentation includes:**
- Quick start (create task via API)
- All 8 endpoints documented
- Basic architecture (Express + Postgres)
- Docker deployment guide
- 6 examples (CRUD operations)

**What's excluded:**
- How middleware chain works
- Why Postgres over MongoDB (not complex)
- Performance optimization (not needed yet)
- Internal validation logic

**Result:** 5,800 words, covers all user needs

---

### Deep Depth Example

**Project:** Multi-tenant SaaS API platform

**Documentation includes:**
- Everything from Standard, plus:
- How tenant isolation works
- Database sharding explained
- ADR on authentication approach
- ADR on multi-tenancy design
- Performance tuning guide
- Security threat model
- Advanced examples (webhooks, batch operations)
- Testing strategy for multi-tenant code

**Result:** 10,500 words, enables advanced usage and contribution

---

## Transitioning Between Depths

### Starting Standard, Going Deep Later

Common path:
1. **Launch:** Start with Standard depth
2. **Users ask questions:** Identify gaps in understanding
3. **Contributors appear:** Need deeper architecture knowledge
4. **Scale challenges:** Performance docs become important
5. **Upgrade:** Run skill in Deep mode, preserves existing docs

### When to Upgrade

Signals it's time for Deep documentation:
- Contributors struggle to understand codebase
- Same architectural questions asked repeatedly
- Performance optimization needed
- Advanced use cases emerging
- Team growing and onboarding slower

---

## Word Count Targets Explained

### Why Word Counts?

Word counts provide concrete boundaries:
- Forces prioritization
- Prevents endless expansion
- Creates consistency across projects

### Word Count Includes

Counted:
- All prose in documentation files
- Code comments within examples
- Table content
- List items

Not counted:
- Code examples themselves
- Mermaid diagram code
- Markdown formatting

### Flexibility

Targets are guides, not hard limits:
- Simple projects may be under target
- Complex projects may exceed slightly
- Quality matters more than hitting exact count

---

## Choosing Wisely

**Start with Standard** unless you're certain you need Deep.

**Reasons:**
- Faster to produce and maintain
- Sufficient for most projects
- You can always go deeper later
- Over-documentation is burden

**Deep is investment:**
- Takes longer to create
- More to maintain
- Only worth it if users need it
- Better to start lean, expand as needed

**When uncertain:** Ask yourself:
- "Will users need to understand internals?"
- "Is this architecture novel or complex?"
- "Do I expect contributors?"

If all "no" → Standard is probably right.
