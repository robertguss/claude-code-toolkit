#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<USAGE
Usage: atomic_commit.sh -m "Commit message" <paths...>
USAGE
}

message=""
paths=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    -m|--message)
      message="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --)
      shift
      break
      ;;
    *)
      paths+=("$1")
      shift
      ;;
  esac
done

if [[ -z "$message" || ${#paths[@]} -eq 0 ]]; then
  echo "Missing commit message or paths." >&2
  usage
  exit 1
fi

for path in "${paths[@]}"; do
  if [[ ! -e "$path" ]]; then
    echo "Path not found: $path" >&2
    exit 1
  fi
done

git add -- "${paths[@]}"

if ! git diff --cached --name-only | grep -q .; then
  echo "No staged changes for provided paths." >&2
  exit 1
fi

git commit -m "$message" -- "${paths[@]}"
