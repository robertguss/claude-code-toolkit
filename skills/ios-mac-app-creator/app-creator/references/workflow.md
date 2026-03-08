# App Creator workflow

1. Run doctor to verify Xcode, XcodeGen, and CLI tools.
2. Choose mode:
   - `new`: scaffold app + install selected subskills
   - `adopt`: install selected subskills into existing project
3. Default selected subskills:
   - `xcode-makefiles`
   - `simple-tasks`
4. Apply git onboarding policy:
   - `--git-init auto|never`
   - `--git-commit prompt|always|never`
5. Print next commands (`make diagnose/build/test`, `scripts/task.sh summary --last-24h`).

Defaults
- Project mode: `new`
- Platform: `ios`
- UI: `swiftui`
- iOS deployment target: `18.0`
- macOS deployment target: `15.4`
- iOS simulator: `auto`
- Subskill installs: both enabled
- Git init: `auto`
- Baseline commit: `prompt`

Required dependency
- XcodeGen is required by default for new scaffolding: `brew install xcodegen`

Optional onboarding
- Run `skills/app-creator/scripts/init.sh` for interactive prompts.
- Use `--no-prompt` with explicit flags for non-interactive flows.

Adopt mode constraints
- Existing-project mode is non-destructive and does not regenerate app sources.
- In adopt mode, provide `--platform` when installing `xcode-makefiles`.

Tooling behavior
- App creator delegates build and task tooling to subskills.
- This skill no longer owns makefile/task implementation details directly.
- Auto-commit is skipped for pre-existing dirty repos to avoid sweeping unrelated edits.
