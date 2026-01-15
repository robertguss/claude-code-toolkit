# Change Summary Hook

Runs when Claude finishes a task, providing TypeScript type checking and a summary of all changes made during the session.

## What It Does

This `Stop` hook fires when Claude completes its work. It performs two functions:

1. **TypeScript Type Checking (blocking)** — If TypeScript files were modified, runs `tsc --noEmit` and blocks if there are type errors
2. **Change Summary (informational)** — Displays a summary of all files changed during the session

## Behavior

### TypeScript Checking

If any `.ts` or `.tsx` files were modified:

1. Locates `tsconfig.json` (checks git root, then `src/`, `app/`, `packages/`)
2. Runs `npx tsc --noEmit` to check types
3. **Blocks Claude from stopping** if type errors are found
4. Claude must fix the errors before finishing

This ensures you never end a session with broken TypeScript.

### Go Linting

If any `.go` files were modified:

1. Runs `golangci-lint` on modified files
2. Reports issues but **doesn't block** (non-blocking)
3. Shows installation hint if golangci-lint isn't found

### Change Summary

Always displays at the end:

```
═══════════════════════════════════════════════════════════════
                    SESSION CHANGE SUMMARY
═══════════════════════════════════════════════════════════════

📊 Overall Statistics:
───────────────────────────────────────────────────────────────
 3 files changed, 45 insertions(+), 12 deletions(-)

📁 Modified Files:
───────────────────────────────────────────────────────────────
M  src/auth/jwt.ts
A  src/middleware/auth.ts
M  src/routes/index.ts

🔍 Change Preview (per file):
───────────────────────────────────────────────────────────────

► src/auth/jwt.ts
  ─────────────────────────────────────────────────────────────
  +import { sign, verify } from 'jsonwebtoken';
  +
  +export function generateToken(payload: object) {
  ...
```

## Prerequisites

```bash
# For TypeScript checking
npm install -g typescript
# Or have it as a project dependency

# For Go linting (optional)
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
```

## Installation

### Step 1: Copy the hook

```bash
cp change-summary.sh ~/.claude/hooks/change-summary.sh
chmod +x ~/.claude/hooks/change-summary.sh
```

### Step 2: Configure in settings.json

Add to `~/.claude/settings.json`:

```json
{
  "hooks": {
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "$HOME/.claude/hooks/change-summary.sh"
          }
        ]
      }
    ]
  }
}
```

## Why TypeScript Checking is Blocking

The auto-format hook doesn't run TypeScript checking because:

1. Type checking is slow compared to formatting
2. Running it after every edit would interrupt flow
3. Type errors often span multiple files

Instead, type checking runs once at the end. If there are errors, Claude is told to fix them before finishing. This ensures:

- Fast feedback during editing (formatting only)
- No broken TypeScript when the session ends
- Claude takes responsibility for type safety

## Customization

### Make TypeScript non-blocking

Change `exit 1` to `exit 0` in the TypeScript section:

```bash
if [[ $tsc_exit -ne 0 ]]; then
  # ... error output ...
  exit 0  # Changed from exit 1
fi
```

### Add other language checks

Add sections for other languages before the change summary:

```bash
# Example: Python type checking with mypy
python_files_changed=$(git diff --name-only HEAD 2>/dev/null | grep -E '\.py$' || true)
if [[ -n "$python_files_changed" ]]; then
  mypy $python_files_changed
fi
```

### Customize change summary output

Modify the git commands in the summary section to show more or less detail.

## Troubleshooting

### TypeScript errors but I want to stop anyway

Use `/stop` to force stop, or temporarily modify the hook to be non-blocking.

### tsconfig.json not found

The hook checks these locations:

- `$git_root/tsconfig.json`
- `$git_root/src/tsconfig.json`
- `$git_root/app/tsconfig.json`
- `$git_root/packages/tsconfig.json`

Add your location to the script if needed.

### golangci-lint not found

Install it with:

```bash
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
```

Or remove the Go linting section if you don't need it.

## Related Hooks

- **[auto-format](../auto-format/)** — Formats files after each edit (complements this hook by handling formatting during the session)
- **[compaction](../compaction/)** — Improves context preservation when compacting
