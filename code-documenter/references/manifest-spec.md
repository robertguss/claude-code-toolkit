# Documentation Manifest Specification

Technical specification for the `.doc-state.json` file that tracks documentation state.

## Purpose

The manifest enables:
- **Incremental updates:** Know what changed since last documentation
- **Health tracking:** Monitor documentation quality over time
- **Debt management:** Track what needs attention
- **Consistency:** Remember preferences across sessions

## File Location

```
project-root/.doc-state.json
```

This file should be committed to version control.

## Schema

```json
{
  "version": "string",
  "project": {
    "name": "string",
    "type": "string",
    "lastScanned": "ISO 8601 datetime",
    "gitCommit": "string (optional)"
  },
  "preferences": {
    "audiences": ["string"],
    "depthLevel": "string",
    "tone": "string"
  },
  "healthScore": {
    "overall": "number (0-100)",
    "components": {
      "coverage": "number (0-100)",
      "freshness": "number (0-100)",
      "quality": "number (0-100)",
      "consistency": "number (0-100)"
    },
    "trend": ["number"]
  },
  "coverage": {
    "[element-type]": {
      "total": "number",
      "documented": "number",
      "changed": "number"
    }
  },
  "debt": {
    "critical": ["DebtItem"],
    "important": ["DebtItem"],
    "minor": ["DebtItem"]
  },
  "documentationMap": {
    "[file-path]": {
      "lastUpdated": "ISO 8601 datetime",
      "covers": ["string"],
      "wordCount": "number"
    }
  }
}
```

## Field Definitions

### version

**Type:** String  
**Required:** Yes  
**Format:** Semantic version (e.g., "1.0")  
**Description:** Manifest format version. Current version is "1.0"

**Example:**
```json
"version": "1.0"
```

---

### project

**Type:** Object  
**Required:** Yes  
**Description:** Project metadata

#### project.name

**Type:** String  
**Required:** Yes  
**Description:** Project name from package.json, Cargo.toml, or directory name

**Example:**
```json
"name": "express-api"
```

#### project.type

**Type:** String  
**Required:** Yes  
**Allowed values:** `rest-api`, `cli`, `library`, `web-app`, `database`, `monorepo`, `other`  
**Description:** Project type identified during analysis

**Example:**
```json
"type": "rest-api"
```

#### project.lastScanned

**Type:** String (ISO 8601 datetime)  
**Required:** Yes  
**Description:** When the project was last analyzed

**Example:**
```json
"lastScanned": "2025-01-10T14:30:00Z"
```

#### project.gitCommit

**Type:** String  
**Required:** No  
**Description:** Git commit hash at last scan. Used for delta analysis.

**Example:**
```json
"gitCommit": "a3f2b1c9d8e7f6a5b4c3d2e1f0"
```

---

### preferences

**Type:** Object  
**Required:** Yes  
**Description:** User preferences for documentation generation

#### preferences.audiences

**Type:** Array of strings  
**Required:** Yes  
**Allowed values:** `"developers"`, `"users"`  
**Description:** Who needs the documentation

**Example:**
```json
"audiences": ["developers", "users"]
```

#### preferences.depthLevel

**Type:** String  
**Required:** Yes  
**Allowed values:** `"standard"`, `"deep"`  
**Description:** Documentation depth preference

**Example:**
```json
"depthLevel": "standard"
```

#### preferences.tone

**Type:** String  
**Required:** Yes  
**Allowed values:** `"technical"`, `"professional"`, `"conversational"`  
**Description:** Documentation tone/voice

**Example:**
```json
"tone": "professional"
```

---

### healthScore

**Type:** Object  
**Required:** Yes  
**Description:** Documentation health metrics

#### healthScore.overall

**Type:** Number  
**Required:** Yes  
**Range:** 0-100  
**Description:** Weighted average of component scores

**Calculation:**
```
overall = (coverage * 0.40) + (freshness * 0.30) + (quality * 0.20) + (consistency * 0.10)
```

**Example:**
```json
"overall": 92
```

#### healthScore.components

**Type:** Object  
**Required:** Yes  
**Description:** Individual quality dimension scores

**Fields:**
- `coverage`: 0-100, represents % of public surface documented
- `freshness`: 0-100, represents how current docs are
- `quality`: 0-100, represents documentation quality
- `consistency`: 0-100, represents uniformity

**Example:**
```json
"components": {
  "coverage": 95,
  "freshness": 98,
  "quality": 88,
  "consistency": 90
}
```

#### healthScore.trend

**Type:** Array of numbers  
**Required:** Yes  
**Description:** Historical overall health scores (last 10)

**Example:**
```json
"trend": [65, 72, 78, 85, 92]
```

---

### coverage

**Type:** Object  
**Required:** Yes  
**Description:** Coverage tracking by element type

**Structure:** Dynamic keys based on project type

**For REST APIs:**
```json
"coverage": {
  "endpoints": {
    "total": 12,
    "documented": 12,
    "changed": 0
  },
  "schemas": {
    "total": 3,
    "documented": 3,
    "changed": 0
  }
}
```

**For CLIs:**
```json
"coverage": {
  "commands": {
    "total": 8,
    "documented": 8,
    "changed": 1
  },
  "options": {
    "total": 24,
    "documented": 22,
    "changed": 2
  }
}
```

**For Libraries:**
```json
"coverage": {
  "functions": {
    "total": 45,
    "documented": 43,
    "changed": 2
  },
  "classes": {
    "total": 12,
    "documented": 12,
    "changed": 0
  }
}
```

**For Web Apps:**
```json
"coverage": {
  "components": {
    "total": 32,
    "documented": 28,
    "changed": 4
  },
  "features": {
    "total": 15,
    "documented": 15,
    "changed": 0
  }
}
```

---

### debt

**Type:** Object  
**Required:** Yes  
**Description:** Documentation debt tracking

#### DebtItem Structure

```typescript
{
  "item": string,          // What needs to be done
  "effort": string,        // "low" | "medium" | "high"
  "status": string,        // "to-fix" | "accepted" | "wont-fix"
  "created": string,       // ISO 8601 datetime
  "notes": string          // Optional context
}
```

#### debt.critical

**Type:** Array of DebtItem  
**Required:** Yes  
**Description:** Critical documentation issues (missing core docs, broken examples)

**Example:**
```json
"critical": [
  {
    "item": "API authentication not documented",
    "effort": "medium",
    "status": "to-fix",
    "created": "2025-01-08T10:00:00Z"
  }
]
```

#### debt.important

**Type:** Array of DebtItem  
**Required:** Yes  
**Description:** Important but not blocking (missing examples, incomplete guides)

**Example:**
```json
"important": [
  {
    "item": "Add deployment troubleshooting section",
    "effort": "low",
    "status": "to-fix",
    "created": "2025-01-09T14:00:00Z"
  }
]
```

#### debt.minor

**Type:** Array of DebtItem  
**Required:** Yes  
**Description:** Nice-to-have improvements

**Example:**
```json
"minor": [
  {
    "item": "Add more advanced examples",
    "effort": "high",
    "status": "accepted",
    "created": "2025-01-05T09:00:00Z",
    "notes": "Acceptable gap for v1"
  }
]
```

---

### documentationMap

**Type:** Object  
**Required:** Yes  
**Description:** Index of all documentation files

**Structure:** Keys are file paths relative to project root

#### DocumentationFile Structure

```typescript
{
  "lastUpdated": string,    // ISO 8601 datetime
  "covers": string[],       // Topics covered
  "wordCount": number       // Approximate word count
}
```

**Example:**
```json
"documentationMap": {
  "README.md": {
    "lastUpdated": "2025-01-10T14:30:00Z",
    "covers": ["overview", "quick-start", "installation"],
    "wordCount": 850
  },
  "docs/developers/api.md": {
    "lastUpdated": "2025-01-10T14:30:00Z",
    "covers": ["endpoints", "authentication", "rate-limiting"],
    "wordCount": 2400
  },
  "docs/users/getting-started.md": {
    "lastUpdated": "2025-01-10T14:30:00Z",
    "covers": ["installation", "first-use", "basic-features"],
    "wordCount": 1200
  }
}
```

---

## Complete Example

```json
{
  "version": "1.0",
  "project": {
    "name": "express-api",
    "type": "rest-api",
    "lastScanned": "2025-01-10T14:30:00Z",
    "gitCommit": "a3f2b1c9d8e7f6a5b4c3d2e1f0"
  },
  "preferences": {
    "audiences": ["developers", "users"],
    "depthLevel": "standard",
    "tone": "professional"
  },
  "healthScore": {
    "overall": 92,
    "components": {
      "coverage": 95,
      "freshness": 98,
      "quality": 88,
      "consistency": 90
    },
    "trend": [65, 72, 78, 85, 92]
  },
  "coverage": {
    "endpoints": {
      "total": 12,
      "documented": 12,
      "changed": 0
    },
    "schemas": {
      "total": 3,
      "documented": 3,
      "changed": 0
    },
    "middleware": {
      "total": 6,
      "documented": 5,
      "changed": 1
    }
  },
  "debt": {
    "critical": [],
    "important": [
      {
        "item": "Document webhook validation",
        "effort": "medium",
        "status": "to-fix",
        "created": "2025-01-09T10:00:00Z"
      }
    ],
    "minor": [
      {
        "item": "Add performance optimization guide",
        "effort": "high",
        "status": "accepted",
        "created": "2025-01-05T15:00:00Z",
        "notes": "Defer to v2"
      }
    ]
  },
  "documentationMap": {
    "README.md": {
      "lastUpdated": "2025-01-10T14:30:00Z",
      "covers": ["overview", "quick-start"],
      "wordCount": 850
    },
    "docs/developers/api.md": {
      "lastUpdated": "2025-01-10T14:30:00Z",
      "covers": ["endpoints", "auth"],
      "wordCount": 2400
    },
    "docs/developers/architecture.md": {
      "lastUpdated": "2025-01-10T14:30:00Z",
      "covers": ["system-design", "database"],
      "wordCount": 1800
    },
    "docs/users/getting-started.md": {
      "lastUpdated": "2025-01-10T14:30:00Z",
      "covers": ["installation", "first-use"],
      "wordCount": 1200
    }
  }
}
```

---

## Manifest Evolution

### Version History

**v1.0** (Current)
- Initial manifest format
- Four quality dimensions
- Debt prioritization
- Documentation map

### Future Considerations

Potential additions in future versions:
- Performance metrics (doc load times)
- User feedback integration
- Translation tracking
- Asset references (images, diagrams)

---

## Working with the Manifest

### Initial Creation

On first run, the skill creates a manifest with:
- Empty coverage (will be populated)
- Initial health score of 0
- Empty debt arrays
- Empty documentation map

### Updates

On subsequent runs, the skill:
1. Loads existing manifest
2. Compares current code state vs. manifest
3. Identifies changes (added/modified/removed)
4. Updates coverage data
5. Recalculates health scores
6. Updates trend array
7. Modifies debt items
8. Updates documentation map

### Git Integration

If git is available:
- Manifest stores current commit hash
- Next run compares HEAD to stored commit
- Git diff shows exactly what changed
- Only changed files trigger doc updates

### Manual Edits

If user manually edits documentation:
- Quick Mode preserves manual changes
- Comprehensive Mode can ask to regenerate or preserve
- Manifest tracks last update time per file

---

## Error Handling

### Missing Manifest

If `.doc-state.json` doesn't exist:
- Treat as first-time documentation
- Create fresh manifest
- No delta analysis possible
- Generate all documentation

### Corrupted Manifest

If manifest is invalid JSON:
- Log error
- Ask user: regenerate or fix?
- If regenerate: back up old manifest to `.doc-state.json.bak`
- Create fresh manifest

### Version Mismatch

If manifest version doesn't match current:
- Attempt migration if possible
- Otherwise: regenerate manifest
- Preserve what's possible from old version

---

## Best Practices

### Commit to Version Control

The manifest should be committed because:
- Team members share documentation state
- CI/CD can check doc freshness
- Documentation health visible in repo

### Don't Edit Manually

The manifest is generated and managed by the skill. Manual edits will be overwritten.

### Review Trends

Health score trend shows documentation quality over time:
- Upward trend: good
- Downward trend: debt accumulating
- Flat trend: stable but may need improvement

### Address Critical Debt

Don't let critical debt accumulate:
- Critical items block users
- Fix before adding new features
- Schedule time for doc maintenance
