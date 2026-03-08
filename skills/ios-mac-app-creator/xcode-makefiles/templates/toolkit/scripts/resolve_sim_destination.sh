#!/usr/bin/env bash
set -euo pipefail

SIM_NAME=""
SIM_UDID=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --sim-name)
      SIM_NAME="$2"
      shift 2
      ;;
    --sim-udid)
      SIM_UDID="$2"
      shift 2
      ;;
    -h|--help)
      echo "Usage: resolve_sim_destination.sh [--sim-name NAME] [--sim-udid UDID]";
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
 done

if [[ -n "$SIM_UDID" ]]; then
  echo "platform=iOS Simulator,id=$SIM_UDID"
  exit 0
fi

SIM_NAME_ENV="$SIM_NAME" SIMCTL_LIST_JSON="${SIMCTL_LIST_JSON:-}" python3 - <<'PY'
import json
import os
import re
import subprocess
import sys
from pathlib import Path

name = (os.environ.get("SIM_NAME_ENV") or "").strip()
name_lower = name.lower()
override = (os.environ.get("SIMCTL_LIST_JSON") or "").strip()

def runtime_version(runtime_key: str):
    match = re.search(r"iOS[- ](\d+)(?:[\.-](\d+))?", runtime_key)
    if not match:
        return (0, 0)
    major = int(match.group(1))
    minor = int(match.group(2) or 0)
    return (major, minor)

variant_rank_map = {
    "pro max": 6,
    "pro": 5,
    "plus": 4,
    "air": 3,
    "": 2,
    "mini": 1,
    "e": 0,
}

def model_rank(device_name: str):
    number = 0
    match = re.search(r"iPhone\s+(\d+)", device_name)
    if match:
        number = int(match.group(1))
    suffix = ""
    lower = device_name.lower()
    if "pro max" in lower:
        suffix = "pro max"
    elif "pro" in lower:
        suffix = "pro"
    elif "plus" in lower:
        suffix = "plus"
    elif "air" in lower:
        suffix = "air"
    elif re.search(r"iphone\s+\d+e\b", lower):
        suffix = "e"
    elif "mini" in lower:
        suffix = "mini"
    return (number, variant_rank_map.get(suffix, 0))

if override:
    if Path(override).exists():
        raw = Path(override).read_text(encoding="utf-8")
    else:
        raw = override
else:
    raw = subprocess.check_output(["xcrun", "simctl", "list", "devices", "-j"], text=True)
data = json.loads(raw)

candidates = []
for runtime_key, devices in data.get("devices", {}).items():
    for device in devices:
        if not device.get("isAvailable"):
            continue
        if "iPhone" not in device.get("name", ""):
            continue
        candidates.append({
            "name": device.get("name", ""),
            "udid": device.get("udid", ""),
            "state": device.get("state", ""),
            "runtime": runtime_key,
            "runtime_version": runtime_version(runtime_key),
        })

if not candidates:
    print("")
    sys.exit(1)

# If a specific sim name was requested, try to honor it.
if name and name_lower != "auto":
    matches = [c for c in candidates if c["name"] == name]
    if matches:
        booted = [c for c in matches if c["state"] == "Booted"]
        chosen = max(booted or matches, key=lambda c: c["runtime_version"])
        print(f"platform=iOS Simulator,id={chosen['udid']}")
        sys.exit(0)

# Prefer a booted iPhone if one exists.
booted = [c for c in candidates if c["state"] == "Booted"]
if booted:
    chosen = max(booted, key=lambda c: (c["runtime_version"], model_rank(c["name"])))
    print(f"platform=iOS Simulator,id={chosen['udid']}")
    sys.exit(0)

# Otherwise choose the latest runtime + best iPhone model.
chosen = max(candidates, key=lambda c: (c["runtime_version"], model_rank(c["name"])))
print(f"platform=iOS Simulator,id={chosen['udid']}")
PY
