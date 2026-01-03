# Contributing

Guidelines for contributing to the Claude Skills repository.

---

## Ways to Contribute

### Report Issues

Found a bug or have a suggestion?

1. Check existing issues first
2. Open a new issue with:
   - Clear description
   - Steps to reproduce (if bug)
   - Expected vs. actual behavior
   - Skill name and version

### Improve Existing Skills

- Fix bugs or issues
- Improve clarity of instructions
- Add missing reference documentation
- Enhance templates

### Create New Skills

- Propose new skills via issue first
- Follow the skill structure guidelines
- Include comprehensive testing

---

## Development Setup

### Clone the Repository

```bash
git clone https://github.com/robertguss/claude-skills.git
cd claude-skills
```

### Install Dependencies

```bash
pip install pyyaml
```

### Verify Setup

```bash
python build.py --list
```

---

## Skill Development Guidelines

### Structure

Follow the standard skill structure:

```
my-skill/
├── SKILL.md              # Required
├── references/           # Optional
│   └── *.md
└── assets/               # Optional
    └── templates/
        └── *.md
```

### SKILL.md Requirements

1. **Frontmatter** with name and description (min 20 chars)
2. **Clear workflow** with defined inputs/outputs
3. **Reference pointers** if using bundled resources
4. **Concise content** — challenge every paragraph

### Quality Standards

| Aspect | Requirement |
|--------|-------------|
| **Focused** | One job, done well |
| **Concise** | Only essential information |
| **Structured** | Clear workflow with inputs/outputs |
| **Progressive** | Core in SKILL.md, details in references |
| **Tested** | Validated with real usage |

---

## Pull Request Process

### 1. Create a Branch

```bash
git checkout -b feature/my-improvement
```

### 2. Make Changes

- Follow existing patterns
- Update relevant documentation
- Test thoroughly

### 3. Validate

```bash
python build.py --list
# Ensure your changes show ✓ valid

python build.py <skill-name>
# Ensure packaging succeeds
```

### 4. Commit

Write clear commit messages:

```
Add voice calibration reference to ghost-writer

- Added references/voice-calibration.md with techniques
- Updated SKILL.md to point to new reference
- Tested with sample voice DNA documents
```

### 5. Open Pull Request

Include:
- What changed and why
- Testing performed
- Any breaking changes

---

## Documentation Guidelines

### When Documenting Skills

- Focus on **how to use**, not how it works internally
- Include **realistic examples**
- Explain **when to use** each feature
- Document **inputs and outputs** clearly

### Style

- Use active voice
- Be concise
- Prefer examples over explanations
- Use tables for structured information

---

## Testing

### Test with Claude Code

Before submitting, test your changes:

```markdown
# CLAUDE.md

When testing, read and follow /path/to/modified/SKILL.md.
```

### Test Scenarios

- Happy path (normal usage)
- Edge cases
- Error conditions
- Multi-session continuity (if applicable)

### Test Packaging

```bash
python build.py <skill-name>
unzip -l dist/<skill-name>.skill
```

Verify the package contains expected files.

---

## Code of Conduct

### Be Respectful

- Constructive feedback only
- Assume good intent
- Welcome newcomers

### Quality Focus

- Prioritize user experience
- Maintain existing standards
- Document thoroughly

---

## Getting Help

- **Issues**: For bugs and feature requests
- **Discussions**: For questions and ideas
- **Documentation**: Start with the [Developer Guide](index.md)

---

## License

Contributions are subject to the repository's license terms. See LICENSE for details.

---

## Related

- [Skill Anatomy](skill-anatomy.md) — Understand skill structure
- [Writing SKILL.md](writing-skill-md.md) — Best practices for instructions
- [Building & Packaging](building-and-packaging.md) — Package skills for distribution
