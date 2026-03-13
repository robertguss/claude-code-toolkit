---
name: xcode-makefiles
description: Install strict Xcode Makefile tooling for iOS/macOS projects, including build/run/test scripts with AGENT_NAME-based per-agent isolation under build/. Use when a project needs reproducible local CLI builds without full app scaffolding.
---

# Xcode Makefiles

## Overview

Paul Solt
Paul@SuperEasyApps.com
Version: 0.9.8

Install a focused Makefile + scripts toolkit into an existing or newly scaffolded Xcode project.

Canonical conventions:
- `AGENT_NAME` is the only agent env var.
- Per-agent paths live under `build/`:
  - `build/DerivedData/<AGENT_NAME>`
  - `build/logs/<AGENT_NAME>`
  - `build/cache/<AGENT_NAME>`
  - `build/tmp/<AGENT_NAME>`

## Install

```bash
skills/xcode-makefiles/scripts/install.sh \
  --project-dir /path/to/project \
  --app-name WalkTrack \
  --platform ios
```

Common flags:
- `--project-dir PATH` required
- `--mode install|upgrade` default `install`
- `--dry-run` preview changes only

Toolkit flags:
- `--app-name NAME` required
- `--platform ios|macos` required
- `--sim-name NAME` optional, defaults to `auto` for iOS
- `--namespace NAME` optional, installs `Makefile.NAME` and `scripts/NAME/`

Installed scripts include:
- `scripts/atomic_commit.sh`
- `scripts/xcbuild.sh`
- `scripts/resolve_agent_name.sh`
- `scripts/resolve_sim_destination.sh`
- `scripts/diagnose.sh`
- `scripts/run_app_macos.sh`
- `scripts/run_app_ios_sim.sh`
- `scripts/clean.sh`
- `scripts/move_to_trash.sh`

## Targets

Installed Make targets are intentionally minimal:
- `make diagnose`
- `make build`
- `make test`
- `make run`
- `make build-and-run`
- `make build-and-run-background`
- `make clean`
- `make agent-verify`
