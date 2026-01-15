#!/bin/bash
# Stop hook: Check TypeScript errors and display a summary of changes

# Load mise (if available) for Node.js/npx
if command -v mise &> /dev/null; then
  eval "$(mise activate bash)"
fi
export PATH="$HOME/.local/share/mise/shims:$PATH"
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree &> /dev/null; then
  echo "Not in a git repository, skipping change summary"
  exit 0
fi

# Get the git root directory
git_root=$(git rev-parse --show-toplevel 2>/dev/null)
if [[ -z "$git_root" ]]; then
  echo "Could not determine git root"
  exit 0
fi

# Check if there's at least one commit
if ! git rev-parse HEAD &>/dev/null; then
  echo "No commits yet, skipping change summary"
  exit 0
fi

# ═══════════════════════════════════════════════════════════════
# TypeScript Type Checking (blocking - must pass before stopping)
# ═══════════════════════════════════════════════════════════════

# Check if any .ts or .tsx files were modified
ts_files_changed=$(git diff --name-only HEAD 2>/dev/null | grep -E '\.(ts|tsx)$' || true)

if [[ -n "$ts_files_changed" ]]; then
  # Find tsconfig.json starting from git root
  tsconfig_dir=""
  if [[ -f "$git_root/tsconfig.json" ]]; then
    tsconfig_dir="$git_root"
  else
    # Check common locations
    for dir in "$git_root/src" "$git_root/app" "$git_root/packages"; do
      if [[ -f "$dir/tsconfig.json" ]]; then
        tsconfig_dir="$dir"
        break
      fi
    done
  fi

  if [[ -n "$tsconfig_dir" ]]; then
    echo ""
    echo "═══════════════════════════════════════════════════════════════"
    echo "                   TYPESCRIPT TYPE CHECK                        "
    echo "═══════════════════════════════════════════════════════════════"
    echo ""
    echo "Checking types for modified TypeScript files..."
    echo ""

    # Run tsc and capture output
    tsc_output=$(cd "$tsconfig_dir" && npx tsc --noEmit 2>&1)
    tsc_exit=$?

    if [[ $tsc_exit -ne 0 ]]; then
      echo "❌ TypeScript errors found:"
      echo "───────────────────────────────────────────────────────────────"
      echo "$tsc_output"
      echo ""
      echo "═══════════════════════════════════════════════════════════════"
      echo "Please fix the TypeScript errors above before finishing."
      echo "═══════════════════════════════════════════════════════════════"
      exit 1
    else
      echo "✅ No TypeScript errors found"
      echo ""
    fi
  fi
fi

# ═══════════════════════════════════════════════════════════════
# Go Linting (non-blocking - reports errors only)
# ═══════════════════════════════════════════════════════════════

# Check if any .go files were modified
go_files_changed=$(git diff --name-only HEAD 2>/dev/null | grep -E '\.go$' || true)

if [[ -n "$go_files_changed" ]]; then
  # Check if golangci-lint is available
  if command -v golangci-lint &> /dev/null; then
    echo ""
    echo "═══════════════════════════════════════════════════════════════"
    echo "                      GO LINT CHECK                             "
    echo "═══════════════════════════════════════════════════════════════"
    echo ""
    echo "Linting modified Go files..."
    echo ""

    # Run golangci-lint on each modified Go file
    lint_errors=""
    for go_file in $go_files_changed; do
      if [[ -f "$git_root/$go_file" ]]; then
        file_output=$(cd "$git_root" && golangci-lint run "$go_file" 2>&1)
        if [[ -n "$file_output" ]]; then
          lint_errors+="$file_output"$'\n'
        fi
      fi
    done

    if [[ -n "$lint_errors" ]]; then
      echo "⚠️  Go linting issues found:"
      echo "───────────────────────────────────────────────────────────────"
      echo "$lint_errors"
      echo "═══════════════════════════════════════════════════════════════"
      echo ""
    else
      echo "✅ No Go linting issues found"
      echo ""
    fi
  else
    echo ""
    echo "⚠️  golangci-lint not found, skipping Go linting"
    echo "   Install with: go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest"
    echo ""
  fi
fi

# Check if there are any changes (staged or unstaged)
if git diff --quiet && git diff --cached --quiet; then
  echo "No changes to summarize"
  exit 0
fi

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "                    SESSION CHANGE SUMMARY                      "
echo "═══════════════════════════════════════════════════════════════"
echo ""

# Show overall stats
echo "📊 Overall Statistics:"
echo "───────────────────────────────────────────────────────────────"
git diff --stat HEAD 2>/dev/null || git diff --stat
echo ""

# List modified files
echo "📁 Modified Files:"
echo "───────────────────────────────────────────────────────────────"
git diff --name-status HEAD 2>/dev/null || git diff --name-status
echo ""

# Show brief preview of changes per file (first 5 lines of each diff)
echo "🔍 Change Preview (per file):"
echo "───────────────────────────────────────────────────────────────"

# Get list of changed files
changed_files=$(git diff --name-only HEAD 2>/dev/null || git diff --name-only)

for file in $changed_files; do
  if [[ -f "$file" ]]; then
    echo ""
    echo "► $file"
    echo "  ─────────────────────────────────────────────────────────"
    # Show first 8 lines of the diff for this file (excluding diff header lines)
    git diff HEAD -- "$file" 2>/dev/null | grep -E '^\+|^-' | grep -v '^+++\|^---' | head -8 | sed 's/^/  /'

    # Check if there are more changes
    total_changes=$(git diff HEAD -- "$file" 2>/dev/null | grep -E '^\+|^-' | grep -v '^+++\|^---' | wc -l | tr -d ' ')
    if [[ "$total_changes" -gt 8 ]]; then
      remaining=$((total_changes - 8))
      echo "  ... ($remaining more lines)"
    fi
  fi
done

echo ""
echo "═══════════════════════════════════════════════════════════════"
echo ""

# Exit successfully - we don't want to block Claude
exit 0
