# Documentation Map

Navigation guide for all documentation.

## For New Users

Start your journey here:

```
1. README.md
   ↓
2. Getting Started Guide
   ↓
3. Your First [Task/Project]
   ↓
4. Core Concepts
```

### Quick Path: "I Want to Use This Now"

1. [README](../README.md) - What is this?
2. [Installation](./installation.md) - Get it running
3. [Quick Start](./quick-start.md) - First steps
4. [Examples](./examples/) - See it in action

### Learning Path: "I Want to Understand This"

1. [What & Why](./introduction.md) - Purpose and philosophy
2. [Core Concepts](./concepts.md) - Key ideas
3. [Architecture](./architecture.md) - How it's built
4. [Guides](./guides/) - Detailed tutorials

---

## For Developers

### Getting Started as a Developer

```
1. README → Overview
   ↓
2. Contributing Guide → Setup
   ↓
3. Architecture Docs → Understanding
   ↓
4. API Reference → Building
```

### Development Path

1. [Contributing Guide](./contributing.md) - Set up development environment
2. [Architecture Overview](./architecture.md) - Understand the system
3. [Code Organization](./code-organization.md) - Navigate the codebase
4. [Testing Guide](./testing.md) - Write and run tests
5. [ADRs](./adr/) - Understand key decisions

### Reference Materials

**API/Components:**
- [API Reference](./api.md) - All endpoints/functions
- [Component Reference](./components.md) - UI components
- [CLI Reference](./commands.md) - Command-line interface

**Architecture:**
- [System Architecture](./architecture.md) - High-level design
- [Database Schema](./database.md) - Data model
- [ADRs](./adr/) - Architecture decisions

**Development:**
- [Development Guide](./development.md) - Local development
- [Testing Strategy](./testing.md) - How we test
- [Deployment](./deployment.md) - Deploy and operate

---

## By Topic

### Installation & Setup

- [Installation Guide](./installation.md) - Get it installed
- [Configuration](./configuration.md) - Configure it
- [Environment Setup](./environment.md) - Set up your environment

### Usage & Features

- [Quick Start](./quick-start.md) - Get started quickly
- [Basic Usage](./usage.md) - Common tasks
- [Features Overview](./features.md) - What it can do
- [Examples](./examples/) - Working code examples

### Advanced Topics

- [Advanced Usage](./advanced.md) - Complex scenarios
- [Performance Tuning](./performance.md) - Optimize it
- [Security](./security.md) - Secure your deployment
- [Scaling](./scaling.md) - Handle growth

### Operations

- [Deployment](./deployment.md) - Deploy to production
- [Monitoring](./monitoring.md) - Monitor health
- [Backup & Recovery](./backup.md) - Protect your data
- [Troubleshooting](./troubleshooting.md) - Fix problems

### Contributing

- [Contributing Guide](./contributing.md) - How to contribute
- [Code of Conduct](./code-of-conduct.md) - Community standards
- [Development Setup](./development.md) - Set up for development

---

## By User Type

### End Users

**Start Here:**
1. [What is this?](../README.md#what-is-this)
2. [Installation](./installation.md)
3. [Getting Started](./getting-started.md)
4. [Features](./features.md)

**When You Need Help:**
- [Troubleshooting](./troubleshooting.md)
- [FAQ](./faq.md)
- [Support](./support.md)

### Developers Using This Project

**Start Here:**
1. [Installation](./installation.md)
2. [API Reference](./api.md) or [CLI Reference](./commands.md)
3. [Examples](./examples/)

**Deep Dive:**
- [Architecture](./architecture.md)
- [Configuration](./configuration.md)
- [Best Practices](./best-practices.md)

### Contributors

**Start Here:**
1. [Contributing Guide](./contributing.md)
2. [Code Organization](./code-organization.md)
3. [Development Guide](./development.md)

**Important Context:**
- [Architecture](./architecture.md)
- [ADRs](./adr/)
- [Testing](./testing.md)

### Operators/DevOps

**Start Here:**
1. [Deployment Guide](./deployment.md)
2. [Configuration Reference](./configuration.md)
3. [Monitoring](./monitoring.md)

**Operations:**
- [Backup & Recovery](./backup.md)
- [Troubleshooting](./troubleshooting.md)
- [Scaling Guide](./scaling.md)

---

## Common Workflows

### "I Need to Do X"

#### Build a [Feature/Integration]

1. [API Reference](./api.md) - Find the endpoints/methods
2. [Authentication](./authentication.md) - Authenticate properly
3. [Examples](./examples/) - See similar implementations
4. [Troubleshooting](./troubleshooting.md) - If you get stuck

#### Deploy to Production

1. [Prerequisites](./deployment.md#prerequisites)
2. [Deployment Guide](./deployment.md)
3. [Configuration](./configuration.md)
4. [Monitoring](./monitoring.md)
5. [Backup Strategy](./backup.md)

#### Contribute Code

1. [Contributing Guide](./contributing.md)
2. [Development Setup](./development.md)
3. [Testing Guide](./testing.md)
4. [Pull Request Process](./contributing.md#pull-request-process)

#### Troubleshoot an Issue

1. [Troubleshooting Guide](./troubleshooting.md) - Common issues
2. [Logs & Debugging](./debugging.md) - How to debug
3. [FAQ](./faq.md) - Frequently asked questions
4. [Get Help](./support.md) - Community support

---

## Documentation Organization

### /docs Structure

```
/docs
├── README.md (you are here)
├── getting-started.md
├── installation.md
├── configuration.md
├── api.md / commands.md
├── architecture.md
├── guides/
│   ├── guide-1.md
│   └── guide-2.md
├── examples/
│   ├── example-1.[ext]
│   └── example-2.[ext]
├── adr/
│   ├── 001-decision.md
│   └── 002-decision.md
├── troubleshooting.md
└── contributing.md
```

### Finding What You Need

**By File Name:**
- `getting-started.md` - First-time setup
- `api.md` / `commands.md` - Reference docs
- `architecture.md` - System design
- `troubleshooting.md` - Problem solving
- `contributing.md` - How to contribute

**By Directory:**
- `/guides/` - Step-by-step tutorials
- `/examples/` - Working code samples
- `/adr/` - Architecture decisions
- `/api/` - Detailed API docs (if split by resource)

---

## External Resources

### Official Links

- **Website:** [Link]
- **GitHub:** [Link]
- **Documentation:** [Link]
- **Blog:** [Link]

### Community

- **Discord/Slack:** [Link]
- **Forum:** [Link]
- **Twitter:** [Link]
- **Stack Overflow:** [Tag]

### Learning Resources

- **Tutorials:** [Link]
- **Video Guides:** [Link]
- **Course:** [Link]
- **Blog Posts:** [Link]

---

## Documentation Versions

This documentation is for **version [X.Y.Z]**.

- [Latest Docs](link)
- [Previous Versions](link)
- [Changelog](./CHANGELOG.md)

---

## Contributing to Documentation

Found a typo? Think something could be clearer?

1. Docs are in `/docs` directory
2. Edit and submit a PR
3. See [Contributing Guide](./contributing.md#documentation)

---

## Quick Reference Card

**Most Common Tasks:**
- Install: `[command]`
- Run: `[command]`
- Test: `[command]`
- Deploy: See [Deployment Guide](./deployment.md)

**Most Common Questions:**
- "How do I...?" → [Quick Start](./quick-start.md)
- "Why isn't X working?" → [Troubleshooting](./troubleshooting.md)
- "How does Y work?" → [Architecture](./architecture.md)
- "Can I contribute?" → [Contributing](./contributing.md)

---

## Search Tips

Can't find what you need?

1. **Use the search** (if docs are searchable)
2. **Check the index** (if available)
3. **Look in related sections** (use this map!)
4. **Ask the community** ([Link])

Still stuck? [Open an issue](link) suggesting where this info should be.
