# Project Types Guide

This guide helps the skill adapt documentation structure and content to different project types.

## Project Type Identification

The skill identifies project type through:
- File structure patterns
- Package.json / requirements.txt / Cargo.toml presence
- Framework detection
- Folder naming conventions

## Documentation Patterns by Project Type

### REST API / Web Service

**Key characteristics:**
- Endpoints are the primary interface
- Request/response patterns matter
- Authentication/authorization critical
- Error handling needs emphasis

**Documentation structure:**
```
/docs
├── api.md (or per-resource files)
│   ├── Authentication
│   ├── Endpoints (grouped by resource)
│   ├── Request/response examples
│   ├── Error codes
│   └── Rate limiting
├── architecture.md
│   ├── System design
│   ├── Database schema
│   └── Service dependencies
├── deployment.md
└── troubleshooting.md
```

**What to emphasize:**
- Every endpoint documented with method, path, parameters, response
- Request/response examples in multiple formats
- Authentication flow with examples
- Error codes with meaning and resolution
- Rate limiting and quotas

**Common ADRs:**
- Why this framework (Express/FastAPI/etc)?
- Why this database?
- Why this authentication approach?
- API versioning strategy

---

### Command-Line Tool (CLI)

**Key characteristics:**
- Commands and subcommands are the interface
- Flags and options are critical
- Installation and PATH setup matter
- Help text should match docs

**Documentation structure:**
```
/docs
├── installation.md
│   ├── Prerequisites
│   ├── Installation methods
│   └── Verification
├── commands.md (or per-command files)
│   ├── Global options
│   ├── Command reference
│   └── Examples
├── configuration.md
│   ├── Config file format
│   └── Environment variables
└── troubleshooting.md
```

**What to emphasize:**
- Installation for multiple platforms
- Every command with all flags/options
- Abundant examples showing common workflows
- Configuration options
- Shell integration (completions, aliases)

**Common ADRs:**
- Why this CLI framework?
- Why this config format (YAML/JSON/TOML)?
- Plugin architecture decisions

---

### JavaScript/TypeScript Library

**Key characteristics:**
- API surface is functions/classes/types
- Installation from npm/yarn
- Import patterns matter
- TypeScript types are documentation

**Documentation structure:**
```
/docs
├── getting-started.md
│   ├── Installation
│   ├── Basic usage
│   └── Core concepts
├── api-reference.md
│   ├── Functions
│   ├── Classes
│   └── Types
├── guides/
│   ├── common-patterns.md
│   ├── advanced-usage.md
│   └── migration-guides.md
└── examples/
```

**What to emphasize:**
- Installation command and import patterns
- Function signatures with parameter descriptions
- Return values and types
- Common use cases with examples
- Browser vs Node differences (if applicable)

**Common ADRs:**
- Why these peer dependencies?
- Why this module format (ESM/CommonJS)?
- Tree-shaking considerations

---

### Web Application (React/Vue/etc)

**Key characteristics:**
- UI is the interface
- Component hierarchy matters
- State management needs explanation
- Deployment varies widely

**Documentation structure:**
```
/docs
├── users/ (if public-facing)
│   ├── getting-started.md
│   ├── features.md
│   └── troubleshooting.md
├── developers/
│   ├── architecture.md
│   ├── components.md
│   ├── state-management.md
│   ├── styling.md
│   ├── deployment.md
│   └── contributing.md
```

**What to emphasize:**
- Architecture overview (data flow, state, routing)
- Component organization and patterns
- Environment variables and configuration
- Build and deployment process
- Development setup

**Common ADRs:**
- Why this framework?
- Why this state management approach?
- Why this styling solution?
- Routing architecture

---

### Python Package

**Key characteristics:**
- Installable via pip
- Modules and classes are API
- Python version support matters
- Virtual environments standard

**Documentation structure:**
```
/docs
├── installation.md
│   ├── Requirements
│   ├── pip install
│   └── Virtual environments
├── quickstart.md
├── api/
│   ├── module-name.md (per module)
│   └── classes.md
├── guides/
└── examples/
```

**What to emphasize:**
- Python version requirements
- Installation via pip
- Import patterns
- Class/function documentation
- Type hints as part of API

**Common ADRs:**
- Why these dependencies?
- Why this project structure?
- Python version support decisions

---

### Database / Data Store

**Key characteristics:**
- Schema/data model is primary
- Queries and operations are interface
- Performance characteristics matter
- Migration strategy critical

**Documentation structure:**
```
/docs
├── getting-started.md
├── schema.md
│   ├── Tables/Collections
│   ├── Relationships
│   └── Indexes
├── operations.md
│   ├── CRUD operations
│   ├── Queries
│   └── Transactions
├── performance.md
└── migrations.md
```

**What to emphasize:**
- Data model with diagrams
- Query patterns and examples
- Indexing strategy
- Migration approach
- Backup and restore

**Common ADRs:**
- Why this database technology?
- Schema design decisions
- Normalization choices
- Indexing strategy

---

### Monorepo / Multi-Package

**Key characteristics:**
- Multiple projects in one repo
- Shared dependencies and tooling
- Workspace management
- Package relationships

**Documentation structure:**
```
/docs
├── overview.md
│   ├── Repository structure
│   ├── Package relationships
│   └── Development workflow
├── packages/
│   ├── package-a/
│   ├── package-b/
│   └── shared/
└── contributing.md
```

**What to emphasize:**
- Overall architecture
- How packages relate
- Shared dependencies management
- Development commands
- Publishing workflow

**Common ADRs:**
- Why monorepo approach?
- Why this workspace tool?
- Versioning strategy
- Deployment coordination

---

## Adapting Documentation Structure

### Small Projects (<1000 lines)

Keep it simple:
- Single comprehensive README
- Maybe 1-2 additional docs if needed
- Inline code comments sufficient

### Medium Projects (1000-10000 lines)

Structured documentation:
- README for overview
- /docs with 5-10 focused files
- Examples directory
- Contributing guide

### Large Projects (>10000 lines)

Full documentation suite:
- Comprehensive README
- Structured /docs with subsections
- Documentation map
- Multiple example sets
- ADRs for major decisions

## Framework-Specific Considerations

### Express.js
- Route organization
- Middleware chain
- Error handling middleware
- Request/response lifecycle

### React
- Component patterns
- State management (Context/Redux/Zustand)
- Hook usage
- Rendering optimization

### FastAPI
- Automatic OpenAPI docs
- Pydantic models
- Dependency injection
- Async patterns

### Next.js
- App vs Pages router
- Server vs Client components
- Data fetching patterns
- Deployment options

### Django
- Apps structure
- Models and migrations
- Views and templates
- Admin customization

## Documentation Depth by Project Maturity

### Proof of Concept
- Minimal docs, README sufficient
- Focus on "what is this" and "how to run it"

### Internal Tool
- Installation and usage
- Configuration options
- Common workflows
- Troubleshooting

### Public Open Source
- Comprehensive getting started
- Full API reference
- Contributing guide
- Code of conduct
- License information
- Examples and guides

### Production Service
- All of open source, plus:
- SLA documentation
- Incident response
- Monitoring and alerting
- Disaster recovery

## Special Considerations

### Microservices
Document each service AND the system:
- System architecture overview
- Service boundaries and responsibilities
- Inter-service communication
- Data ownership
- Deployment orchestration

### Serverless
- Function documentation
- Event triggers
- Environment variables
- Cold start considerations
- Cost implications

### Mobile Apps
- Platform-specific setup (iOS/Android)
- Build and deployment
- App Store submission
- Testing on devices

### Browser Extensions
- Installation from store
- Development mode setup
- Permissions explanation
- Browser compatibility

## Integration Points

### CI/CD
Document:
- Build process
- Test execution
- Deployment pipeline
- Environment promotion

### Third-Party Services
Document:
- API keys and configuration
- Rate limits and quotas
- Error handling
- Webhook setup

### Authentication Providers
Document:
- Setup process
- Configuration
- User flows
- Token management
