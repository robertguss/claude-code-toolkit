#!/bin/bash
# Auto-format files after edits: Python (ruff format + check), Go (goimports), and others (prettier)
# Note: TypeScript type checking is done in the Stop hook (change-summary.sh) to avoid interrupting edits

# Load mise (if available) for Node.js and other tools
if command -v mise &> /dev/null; then
  eval "$(mise activate bash)"
fi

# Also add mise shims directory directly
export PATH="$HOME/.local/share/mise/shims:$PATH"

# Add common paths as fallback
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"

# Add Go bin directory for goimports
export PATH="$HOME/go/bin:$PATH"

# Read JSON input from stdin
input=$(cat)

# Extract file path from JSON (works for Write, Edit, MultiEdit tools)
file_path=$(echo "$input" | python3 -c "import sys, json; data = json.load(sys.stdin); print(data.get('tool_input', {}).get('file_path', ''))")

# Check if it's a Python file
if [[ "$file_path" == *.py ]]; then
  # Run ruff format on the file
  ruff format "$file_path" 2>&1
  format_exit=$?

  if [ $format_exit -eq 0 ]; then
    echo "Formatted Python file: $file_path"
  else
    echo "Warning: ruff format failed for $file_path" >&2
  fi

  # Run ruff check with auto-fix for linting issues
  # Note: --unfixable F401 prevents auto-removing unused imports, allowing agents to add imports before usage
  ruff check --fix --unfixable F401 "$file_path" 2>&1
  check_exit=$?

  if [ $check_exit -eq 0 ]; then
    echo "Linted Python file: $file_path"
  else
    echo "Warning: ruff check found issues in $file_path" >&2
  fi

  # Exit with format exit code (linting warnings shouldn't block)
  exit $format_exit
fi

# Check if it's a Go file
if [[ "$file_path" == *.go ]]; then
  # Run goimports on the file (formats + manages imports)
  if command -v goimports &> /dev/null; then
    goimports -w "$file_path" 2>&1
    exit_code=$?

    if [ $exit_code -eq 0 ]; then
      echo "Formatted Go file with goimports: $file_path"
    else
      echo "Warning: goimports failed for $file_path" >&2
    fi

    exit $exit_code
  else
    echo "Warning: goimports not found, skipping Go formatting" >&2
  fi
fi

# For all other files, try prettier (it supports JS, TS, JSON, CSS, HTML, MD, YAML, etc.)
if [[ -f "$file_path" ]]; then
  # Check if prettier is available globally
  if command -v prettier &> /dev/null; then
    # Run prettier on the file - it will auto-detect supported file types
    prettier --write "$file_path" 2>&1
    exit_code=$?
    
    if [ $exit_code -eq 0 ]; then
      echo "Formatted file with prettier: $file_path"
    fi
  fi
fi

# Exit successfully regardless - we don't want to block Claude for formatting issues
exit 0

