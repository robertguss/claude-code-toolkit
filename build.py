#!/usr/bin/env python3
"""
Packages skill folders into .skill files for Claude.ai upload.

Usage:
    python build.py <skill-name>     # Package a single skill
    python build.py --all            # Package all skills
    python build.py --list           # List available skills
"""

import argparse
import sys
import zipfile
from pathlib import Path

import yaml


def get_repo_root() -> Path:
    """Get the repository root (where this script lives)."""
    return Path(__file__).parent.resolve()


def get_skill_dirs(repo_root: Path) -> list[Path]:
    """Find all valid skill directories (folders containing SKILL.md)."""
    skills = []
    skills_dir = repo_root / "skills"
    if not skills_dir.exists():
        return skills
    for item in skills_dir.iterdir():
        if item.is_dir() and (item / "SKILL.md").exists():
            skills.append(item)
    return sorted(skills)


def validate_skill(skill_dir: Path) -> tuple[bool, list[str]]:
    """
    Validate a skill directory.
    Returns (is_valid, list_of_errors).
    """
    errors = []
    skill_md = skill_dir / "SKILL.md"

    if not skill_md.exists():
        errors.append("Missing SKILL.md")
        return False, errors

    # Parse and validate frontmatter
    content = skill_md.read_text(encoding="utf-8")

    if not content.startswith("---"):
        errors.append("SKILL.md must start with YAML frontmatter (---)")
        return False, errors

    try:
        # Extract frontmatter
        parts = content.split("---", 2)
        if len(parts) < 3:
            errors.append("Invalid frontmatter format")
            return False, errors

        frontmatter = yaml.safe_load(parts[1])

        if not frontmatter:
            errors.append("Empty frontmatter")
            return False, errors

        if "name" not in frontmatter:
            errors.append("Missing 'name' in frontmatter")

        if "description" not in frontmatter:
            errors.append("Missing 'description' in frontmatter")
        elif len(frontmatter.get("description", "")) < 20:
            errors.append("Description too short (min 20 chars)")

    except yaml.YAMLError as e:
        errors.append(f"Invalid YAML frontmatter: {e}")

    return len(errors) == 0, errors


def package_skill(skill_dir: Path, output_dir: Path) -> Path:
    """
    Package a skill directory into a .skill file.
    Returns the path to the created .skill file.
    """
    skill_name = skill_dir.name
    output_dir.mkdir(parents=True, exist_ok=True)
    output_file = output_dir / f"{skill_name}.skill"

    with zipfile.ZipFile(output_file, "w", zipfile.ZIP_DEFLATED) as zf:
        for file_path in skill_dir.rglob("*"):
            if file_path.is_file():
                # Skip hidden files and common unwanted files
                if any(part.startswith(".") for part in file_path.parts):
                    continue
                if file_path.name in ("__pycache__", ".DS_Store", "Thumbs.db"):
                    continue

                # Archive path includes the skill folder name
                archive_path = Path(skill_name) / file_path.relative_to(skill_dir)
                zf.write(file_path, archive_path)
                print(f"  Added: {archive_path}")

    return output_file


def main():
    parser = argparse.ArgumentParser(
        description="Package skills for Claude.ai",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    python build.py brainstorm       # Package the brainstorm skill
    python build.py --all            # Package all skills
    python build.py --list           # List available skills
        """,
    )
    parser.add_argument("skill", nargs="?", help="Name of skill to package")
    parser.add_argument("--all", action="store_true", help="Package all skills")
    parser.add_argument("--list", action="store_true", help="List available skills")
    parser.add_argument(
        "--output",
        "-o",
        type=Path,
        default=None,
        help="Output directory (default: ./dist)",
    )

    args = parser.parse_args()

    repo_root = get_repo_root()
    output_dir = args.output or (repo_root / "dist")
    skill_dirs = get_skill_dirs(repo_root)

    # List mode
    if args.list:
        print("Available skills:")
        for skill_dir in skill_dirs:
            is_valid, errors = validate_skill(skill_dir)
            status = "✓" if is_valid else "✗"
            print(f"  {status} {skill_dir.name}")
            if errors:
                for error in errors:
                    print(f"      └─ {error}")
        return 0

    # Determine which skills to package
    if args.all:
        to_package = skill_dirs
    elif args.skill:
        skill_path = repo_root / "skills" / args.skill
        if not skill_path.exists():
            print(f"Error: Skill '{args.skill}' not found")
            print(f"Available skills: {', '.join(s.name for s in skill_dirs)}")
            return 1
        to_package = [skill_path]
    else:
        parser.print_help()
        return 1

    # Package skills
    success_count = 0
    for skill_dir in to_package:
        print(f"\n📦 Packaging: {skill_dir.name}")

        # Validate first
        is_valid, errors = validate_skill(skill_dir)
        if not is_valid:
            print("❌ Validation failed:")
            for error in errors:
                print(f"   └─ {error}")
            continue

        print("✓ Validation passed")

        # Package
        try:
            output_file = package_skill(skill_dir, output_dir)
            print(f"✅ Created: {output_file}")
            success_count += 1
        except Exception as e:
            print(f"❌ Packaging failed: {e}")

    # Summary
    print(f"\n{'─' * 40}")
    print(f"Packaged {success_count}/{len(to_package)} skills")
    if success_count > 0:
        print(f"Output directory: {output_dir}")

    return 0 if success_count == len(to_package) else 1


if __name__ == "__main__":
    sys.exit(main())
