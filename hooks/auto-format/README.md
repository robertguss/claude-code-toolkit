# Auto-Format Hook

Automatically formats files after Claude edits them, keeping code consistently styled without manual intervention.

## What It Does

This `PostToolUse` hook fires after every `Edit`, `MultiEdit`, or `Write` tool call. It detects the file type and runs the appropriate formatter:

| File Type       | Formatter | What It Does                            |
| --------------- | --------- | --------------------------------------- |
| Python (`.py`)  | ruff      | Formats code + auto-fixes lint issues   |
| Go (`.go`)      | goimports | Formats code + manages imports          |
| Everything else | prettier  | JS, TS, JSON, CSS, HTML, MD, YAML, etc. |

## Behavior

**Python files:**

1. Runs `ruff format` to format the code
2. Runs `ruff check --fix` to auto-fix linting issues
3. Preserves unused imports (allows Claude to add imports before using them)

**Go files:**

1. Runs `goimports -w` to format and manage imports

**Other files:**

1. Runs `prettier --write` for supported file types
2. Prettier auto-detects supported formats

The hook exits successfully even if formatting fails — it won't block Claude's work.

## Prerequisites

Install the formatters you need:

```bash
# Python
pip install ruff

# Go
go install golang.org/x/tools/cmd/goimports@latest

# JavaScript/TypeScript/etc
npm install -g prettier
```

## Installation

### Step 1: Copy the hook

```bash
cp auto-format.sh ~/.claude/hooks/auto-format.sh
chmod +x ~/.claude/hooks/auto-format.sh
```

### Step 2: Configure in settings.json

Add to `~/.claude/settings.json`:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|MultiEdit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "$HOME/.claude/hooks/auto-format.sh"
          }
        ]
      }
    ]
  }
}
```

## Configuration

The hook uses [mise](https://mise.jdx.dev/) for tool version management if available. It also checks common paths:

- `$HOME/.local/share/mise/shims`
- `/usr/local/bin`
- `/opt/homebrew/bin`
- `$HOME/go/bin`

If your tools are installed elsewhere, add the paths to the script.

## Customization

### Adding more formatters

Edit the script to add support for other file types:

```bash
# Example: Add Rust formatting
if [[ "$file_path" == *.rs ]]; then
  rustfmt "$file_path" 2>&1
  exit $?
fi
```

### Changing formatter options

Modify the formatter commands in the script. For example, to change ruff's line length:

```bash
ruff format --line-length 100 "$file_path" 2>&1
```

### Disabling for specific file types

Add early returns for file types you don't want formatted:

```bash
# Skip formatting for generated files
if [[ "$file_path" == *_generated.* ]]; then
  exit 0
fi
```

## Troubleshooting

### Formatter not found

The hook silently skips if a formatter isn't installed. Check that the formatter is in your PATH:

```bash
which ruff
which goimports
which prettier
```

### Wrong formatter version

If using mise, ensure the correct version is activated. The hook runs `eval "$(mise activate bash)"` to load mise.

### Formatting conflicts with project config

The hook uses default formatter settings. If your project has specific config (`.prettierrc`, `ruff.toml`, etc.), the formatter should pick it up automatically.

## Related Hooks

- **[change-summary](../change-summary/)** — Runs TypeScript type checking at session end (complements this hook by checking types after all edits are done)
