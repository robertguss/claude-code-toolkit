# Compaction Hook

A Claude Code hook that improves context compaction quality by injecting preservation priorities when compaction occurs.

## The Problem

When Claude Code's context window fills up, it automatically compacts (summarizes) the conversation to make room. The built-in `/compact` command does the same thing manually. But the default compaction often loses important context:

- Decisions get summarized without their reasoning
- Code changes lose the "why" behind them
- User-provided constraints disappear
- The thread of what you were doing gets muddied

You end up with a compacted context that has the facts but lost the understanding.

## The Solution

This hook injects a **compaction strategy** into the compaction process, telling Claude what to prioritize preserving:

- Decisions with their rationale
- Code changes with intent
- User-provided context and constraints
- Current task state and progress
- Open questions that need resolution

And what to compress aggressively:

- Exploration that led nowhere
- Verbose tool output
- Intermediate reasoning (keep conclusions)
- Superseded information

## How It Works

Claude Code has a **hooks system** that runs shell commands at specific events. The `PreCompact` hook fires right before any compaction (manual or automatic).

```
Context fills up
       ↓
PreCompact hook fires
       ↓
Hook script runs, outputs strategy to stdout
       ↓
Strategy is injected as additional context
       ↓
Compaction occurs with strategy in mind
       ↓
Better quality preserved context
```

The hook script simply `cat`s the strategy file. The output becomes part of the context that Claude uses when deciding what to preserve.

## Installation

### Step 1: Copy the files

```bash
# Copy the hook script
cp pre-compact.sh ~/.claude/hooks/pre-compact.sh

# Make it executable
chmod +x ~/.claude/hooks/pre-compact.sh

# Copy the strategy file
cp compaction-strategy.md ~/.claude/compaction-strategy.md
```

### Step 2: Configure the hook

Add the `PreCompact` hook to your `~/.claude/settings.json`:

```json
{
  "hooks": {
    "PreCompact": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "$HOME/.claude/hooks/pre-compact.sh"
          }
        ]
      }
    ]
  }
}
```

If you already have other hooks configured, add the `PreCompact` section alongside them:

```json
{
  "hooks": {
    "PostToolUse": [
      // ... your existing hooks ...
    ],
    "PreCompact": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "$HOME/.claude/hooks/pre-compact.sh"
          }
        ]
      }
    ]
  }
}
```

### Step 3: Verify installation

```bash
# Check the hook script exists and is executable
ls -la ~/.claude/hooks/pre-compact.sh

# Check the strategy file exists
ls -la ~/.claude/compaction-strategy.md

# Test the hook script runs correctly
~/.claude/hooks/pre-compact.sh
# Should output the strategy content
```

## Customizing the Strategy

The `compaction-strategy.md` file is yours to customize. Edit `~/.claude/compaction-strategy.md` to match your priorities.

### Adding project-specific context

If you work on specific types of projects, add relevant preservation priorities:

```markdown
## Domain-Specific Preservation

- **API contracts** — Endpoint signatures, request/response shapes
- **Database schema decisions** — Table structures, migration choices
- **Architecture patterns** — Why we chose X over Y
```

### Adjusting compression aggressiveness

If you find too much is being lost, move items from "Compress or Drop" to "Always Preserve":

```markdown
## Always Preserve

... 7. **Error stack traces** — Full traces, not just error messages 8. **Alternative approaches considered** — Keep the reasoning for rejected options
```

### Changing the output format

The format section guides how compacted context is structured. Adjust it to match how you like to receive information:

```markdown
## Output Format

Structure as narrative paragraphs with clear section headers.
Lead with current state, then decisions, then code changes.
End with explicit next steps.
```

## Relationship to /handoff Skill

This hook and the `/handoff` skill are complementary:

| Compaction Hook                  | /handoff Skill                  |
| -------------------------------- | ------------------------------- |
| Automatic                        | Manual                          |
| Fires on any compaction          | Invoked explicitly              |
| Improves in-session continuity   | Creates cross-session documents |
| Influences what Claude preserves | Creates explicit handoff files  |
| No user interaction              | Asks what to capture            |

**Use both:**

- The hook silently improves compaction quality during your session
- The `/handoff` skill creates explicit documents when ending a session or switching contexts

## Troubleshooting

### Hook doesn't seem to be running

1. Check the script is executable: `ls -la ~/.claude/hooks/pre-compact.sh`
2. Verify the settings.json syntax is valid JSON
3. Check for typos in the hook path (use `$HOME` not `~`)

### Compaction quality hasn't improved

The hook injects the strategy, but I can't guarantee how Claude Code's internal compaction process uses it. The strategy becomes additional context, which should influence preservation, but the exact mechanism isn't documented.

If quality hasn't improved:

1. Try making the strategy more explicit/directive
2. Use the `/handoff` skill for critical context you can't afford to lose
3. Manually run `/compact` earlier in sessions to have more control

### Strategy file not found errors

The hook silently continues if the strategy file doesn't exist (it just outputs nothing). Verify the file is at exactly `~/.claude/compaction-strategy.md`.

## How hooks work (technical details)

Claude Code hooks are configured in `settings.json` under the `hooks` key. Each hook type has an array of matchers and commands:

```json
{
  "hooks": {
    "HookEventName": [
      {
        "matcher": "pattern", // String pattern to match (empty = match all)
        "hooks": [
          {
            "type": "command",
            "command": "shell command to run"
          }
        ]
      }
    ]
  }
}
```

For `PreCompact`:

- The `matcher` is typically empty (matches all compaction events)
- The hook's stdout is injected as `additionalContext`
- Exit code 0 means success; non-zero could block compaction

Available hook events:

- `PreToolUse` / `PostToolUse` - Before/after tool execution
- `UserPromptSubmit` - When user sends a message
- `SessionStart` / `SessionEnd` - Session lifecycle
- `Stop` / `SubagentStop` - When agents complete
- `PreCompact` - Before context compaction
- `Notification` - When notifications are sent
- `PermissionRequest` - When permissions are requested

## Files

```
compaction-hook/
├── README.md                 # This documentation
├── pre-compact.sh            # Hook script (copy to ~/.claude/hooks/)
└── compaction-strategy.md    # Strategy file (copy to ~/.claude/)
```

## License

MIT - Use freely, modify as needed, share with others.
