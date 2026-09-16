#!/usr/bin/env python3
"""Wiki lint. Run from anywhere: python3 <wiki>/tools/lint.py

Reads the page types and their folders from the "## Page types" table in
SCHEMA.md and the tag taxonomy from its "## Tag taxonomy" section, so the
script needs no edit when the schema changes.

Checks: broken wikilinks, orphans, index completeness, required frontmatter,
unknown types, tags outside the taxonomy, raw sha256 drift, contested or
low-confidence pages, pages over 200 lines, log size. Exits 1 on broken
links, index gaps, or frontmatter faults; everything else is reported only.
"""
import hashlib
import re
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
REQUIRED = ["title", "created", "updated", "type", "tags", "sources"]
NOT_PAGES = {"index.md", "log.md", "SCHEMA.md", "README.md"}
MAX_LINES = 200
MAX_LOG_ENTRIES = 500


def schema():
    """Return (types, dirs, root_types) from SCHEMA.md's page-types table."""
    text = (ROOT / "SCHEMA.md").read_text()
    sec = text.split("## Page types", 1)[1].split("\n## ", 1)[0]
    types, dirs, root_types = set(), [], set()
    for line in sec.splitlines():
        m = re.match(r"\|\s*`([a-z-]+)`\s*\|\s*([^|]+?)\s*\|", line)
        if not m:
            continue
        t, where = m.group(1), m.group(2)
        types.add(t)
        if "root" in where:
            root_types.add(t)
        else:
            for d in re.findall(r"([A-Za-z0-9_-]+)/", where):
                if d not in dirs:
                    dirs.append(d)
    return types, dirs, root_types


def taxonomy():
    text = (ROOT / "SCHEMA.md").read_text()
    sec = text.split("## Tag taxonomy", 1)[1].split("\n## ", 1)[0]
    return set(re.findall(r"`([a-z-]+)`", sec))


def frontmatter(text):
    m = re.match(r"^---\n(.*?)\n---\n", text, re.S)
    if not m:
        return None
    fm = {}
    for line in m.group(1).splitlines():
        if ":" in line and not line.startswith(" "):
            k, v = line.split(":", 1)
            fm[k.strip()] = v.strip()
    return fm


def main():
    types, dirs, root_types = schema()
    tags_ok = taxonomy()
    pages = {}
    for d in dirs:
        for p in (ROOT / d).rglob("*.md"):
            if p.name.startswith("_") or p.name in NOT_PAGES:
                continue
            pages[p.stem] = p
    if root_types:
        for p in ROOT.glob("*.md"):
            if p.name not in NOT_PAGES:
                pages[p.stem] = p
    issues = defaultdict(list)
    inbound = defaultdict(int)
    index_text = (ROOT / "index.md").read_text()
    for slug, p in pages.items():
        rel = p.relative_to(ROOT)
        text = p.read_text()
        fm = frontmatter(text)
        if fm is None:
            issues["frontmatter"].append(f"{rel}: missing frontmatter")
            continue
        for k in REQUIRED:
            if k not in fm:
                issues["frontmatter"].append(f"{rel}: missing `{k}`")
        if fm.get("type") not in types:
            issues["frontmatter"].append(f"{rel}: unknown type `{fm.get('type')}`")
        for t in re.findall(r"[a-z][a-z-]*", fm.get("tags", "")):
            if t not in tags_ok:
                issues["tags"].append(f"{rel}: tag `{t}` not in taxonomy")
        links = set(re.findall(r"\[\[([^\]|#]+)", text))
        for l in links:
            if l not in pages:
                issues["broken-links"].append(f"{rel} -> [[{l}]]")
            else:
                inbound[l] += 1
        if len(links) < 2:
            issues["few-links"].append(f"{rel}: {len(links)} outbound links")
        if f"[[{slug}" not in index_text:
            issues["index"].append(f"{rel}: not in index.md")
        if fm.get("contested") == "true" or fm.get("confidence") == "low":
            issues["review"].append(f"{rel}: contested/low-confidence")
        n = text.count("\n")
        if n > MAX_LINES:
            issues["size"].append(f"{rel}: {n} lines")
    for slug in pages:
        if inbound[slug] == 0:
            issues["orphans"].append(str(pages[slug].relative_to(ROOT)))
    for l in set(re.findall(r"\[\[([^\]|#]+)", index_text)):
        if l not in pages:
            issues["index"].append(f"index.md -> [[{l}]] does not exist")
    raw = ROOT / "raw"
    if raw.exists():
        for p in raw.rglob("*.md"):
            text = p.read_text()
            fm = frontmatter(text)
            if fm and "sha256" in fm:
                body = text.split("---\n", 2)[2]
                if hashlib.sha256(body.encode()).hexdigest() != fm["sha256"]:
                    issues["raw-drift"].append(str(p.relative_to(ROOT)))
    entries = len(re.findall(r"^## \[", (ROOT / "log.md").read_text(), re.M))
    if entries > MAX_LOG_ENTRIES:
        issues["log"].append(f"log.md has {entries} entries; rotate")

    order = ["broken-links", "index", "frontmatter", "tags", "orphans",
             "raw-drift", "review", "few-links", "size", "log"]
    total = sum(len(v) for v in issues.values())
    print(f"{len(pages)} wiki pages checked, {total} issues")
    for k in order:
        if issues[k]:
            print(f"\n[{k}] ({len(issues[k])})")
            for i in sorted(issues[k]):
                print("  " + i)
    sys.exit(1 if issues["broken-links"] or issues["index"] or issues["frontmatter"] else 0)


if __name__ == "__main__":
    main()
