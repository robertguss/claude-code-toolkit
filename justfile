# Claude Skills Justfile
# Run `just` to see available commands

# Default command - show help
default:
    @just --list

# Install all dependencies including docs
install:
    uv sync --all-extras

# Install only core dependencies (no docs)
install-core:
    uv sync

# ─────────────────────────────────────────────────────────────
# Documentation
# ─────────────────────────────────────────────────────────────

# Serve documentation locally at http://localhost:8000
docs-serve:
    uv run mkdocs serve

# Build documentation to site/ directory
docs-build:
    uv run mkdocs build

# Deploy documentation to GitHub Pages
docs-deploy:
    uv run mkdocs gh-deploy

# ─────────────────────────────────────────────────────────────
# Skills
# ─────────────────────────────────────────────────────────────

# Package a single skill (e.g., just package brainstorm)
package skill:
    uv run python build.py {{skill}}

# Package all skills
package-all:
    uv run python build.py --all

# List all available skills
list-skills:
    uv run python build.py --list

# ─────────────────────────────────────────────────────────────
# Development
# ─────────────────────────────────────────────────────────────

# Clean build artifacts
clean:
    rm -rf dist/ site/
