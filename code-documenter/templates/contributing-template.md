# Contributing Guide

Thank you for your interest in contributing!

## Quick Start

1. Fork the repository
2. Clone your fork: `git clone [url]`
3. Create a branch: `git checkout -b feature/your-feature`
4. Make changes
5. Run tests: `[test command]`
6. Commit: `git commit -m "Description"`
7. Push: `git push origin feature/your-feature`
8. Create Pull Request

## Development Setup

### Prerequisites

- [Tool 1, e.g., Node.js 18+]
- [Tool 2, e.g., PostgreSQL 14+]
- [Tool 3, if any]

### Installation

1. **Clone the repository:**
   ```bash
   git clone [url]
   cd [project-name]
   ```

2. **Install dependencies:**
   ```bash
   [package manager install command]
   ```

3. **Set up environment:**
   ```bash
   cp .env.example .env
   # Edit .env with your settings
   ```

4. **Initialize database:**
   ```bash
   [database setup commands]
   ```

5. **Verify setup:**
   ```bash
   [verification command]
   ```

## Development Workflow

### Creating a Branch

Branch naming convention:
- `feature/feature-name` - New features
- `fix/bug-description` - Bug fixes
- `docs/what-changed` - Documentation
- `refactor/what-changed` - Code refactoring
- `test/what-added` - Test additions

```bash
git checkout -b feature/add-user-auth
```

### Making Changes

1. **Write code** following our style guide
2. **Add tests** for new functionality
3. **Update documentation** if needed
4. **Run linter:** `[lint command]`
5. **Run tests:** `[test command]`

### Running the Project Locally

```bash
[development server command]
```

Access at: `[local URL]`

### Testing

#### Run all tests:
```bash
[command to run all tests]
```

#### Run specific tests:
```bash
[command for specific tests]
```

#### Test coverage:
```bash
[coverage command]
```

Target: >80% coverage for new code

### Code Style

We use [linter/formatter name]:

**Format code:**
```bash
[format command]
```

**Lint code:**
```bash
[lint command]
```

**Fix auto-fixable issues:**
```bash
[auto-fix command]
```

### Commit Messages

Follow [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): subject

body (optional)

footer (optional)
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting, missing semi-colons, etc.
- `refactor`: Code change that neither fixes a bug nor adds a feature
- `test`: Adding missing tests
- `chore`: Updating build tasks, package manager configs, etc.

**Examples:**
```
feat(auth): add JWT token refresh

fix(api): handle null values in user endpoint

docs(readme): update installation instructions
```

## Pull Request Process

### Before Submitting

- [ ] Code follows style guide
- [ ] Tests pass locally
- [ ] New tests added for new features
- [ ] Documentation updated
- [ ] No linter errors
- [ ] Commit messages follow convention
- [ ] Branch is up to date with main

### Submitting

1. **Push your branch:**
   ```bash
   git push origin feature/your-feature
   ```

2. **Create Pull Request** on GitHub

3. **Fill out PR template** completely

4. **Link related issues:** "Closes #123"

5. **Request review** from maintainers

### PR Template

```markdown
## Description

[Describe what this PR does]

## Type of Change

- [ ] Bug fix (non-breaking change)
- [ ] New feature (non-breaking change)
- [ ] Breaking change
- [ ] Documentation update

## How Has This Been Tested?

[Describe the tests you ran]

## Checklist

- [ ] My code follows the style guidelines
- [ ] I have performed a self-review
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix/feature works
- [ ] New and existing unit tests pass locally

## Screenshots (if applicable)

[Add screenshots]

## Related Issues

Closes #[issue number]
```

### Review Process

1. **Automated checks run** (tests, linting)
2. **Maintainer reviews** code
3. **Feedback addressed** if needed
4. **Approved and merged** when ready

**Review time:** Usually within [timeframe]

## What to Contribute

### Good First Issues

Look for issues labeled `good first issue`:
- Small, well-defined
- Good for newcomers
- Clear acceptance criteria

### Feature Requests

Have an idea? Great!

1. **Check existing issues** to avoid duplicates
2. **Open an issue** describing the feature
3. **Discuss with maintainers** before implementing
4. **Get approval** before starting work

### Bug Reports

Found a bug?

1. **Search existing issues** first
2. **Create new issue** with:
   - Clear description
   - Steps to reproduce
   - Expected vs actual behavior
   - Environment details
   - Screenshots if applicable

### Documentation

Improving docs is always welcome:
- Fix typos
- Clarify explanations
- Add examples
- Translate to other languages

## Code Review Guidelines

When reviewing others' PRs:
- Be respectful and constructive
- Focus on the code, not the person
- Suggest improvements, don't demand
- Explain your reasoning
- Approve when it's good enough (not perfect)

## Release Process

[If applicable - how releases work]

1. Version bump in package.json
2. Update CHANGELOG.md
3. Create release tag
4. Automated deployment

## Community

- **Discord/Slack:** [Link]
- **Discussions:** [Link]
- **Twitter:** [Link]

## Code of Conduct

We follow the [Contributor Covenant Code of Conduct](link). Please read and follow it.

## License

By contributing, you agree that your contributions will be licensed under [License Name].

## Getting Help

Stuck? Have questions?

- **Check documentation:** [Link]
- **Ask in discussions:** [Link]
- **Join Discord/Slack:** [Link]
- **Tag maintainers:** @[username]

## Recognition

Contributors are recognized in:
- CONTRIBUTORS.md file
- GitHub contributors page
- Release notes (for significant contributions)

Thank you for contributing! 🎉
