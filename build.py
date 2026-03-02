#!/usr/bin/env python3
"""
Packages skill folders into .skill files for Claude.ai upload, or product ZIPs
for Gumroad distribution.

Usage:
    python build.py <skill-name>           # Package a single skill
    python build.py --all                  # Package all skills
    python build.py --list                 # List available skills
    python build.py --product <name>       # Package one product
    python build.py --all-products         # Package all products
    python build.py --list-products        # List available products
"""

import argparse
import shutil
import sys
import tempfile
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


def get_product_configs(repo_root: Path) -> list[Path]:
    """Find all product YAML config files in the products/ directory."""
    products_dir = repo_root / "products"
    if not products_dir.exists():
        return []
    return sorted(products_dir.glob("*.yaml"))


def load_product_config(config_path: Path) -> dict:
    """Load and return a product config from a YAML file."""
    return yaml.safe_load(config_path.read_text(encoding="utf-8"))


def validate_product(config_path: Path, repo_root: Path) -> tuple[bool, list[str]]:
    """
    Validate a product config and all its referenced skills.
    Returns (is_valid, list_of_errors).
    """
    errors = []
    try:
        config = load_product_config(config_path)
    except yaml.YAMLError as e:
        return False, [f"Invalid YAML: {e}"]

    if "name" not in config:
        errors.append("Missing 'name' field")

    if "skills" not in config or not config["skills"]:
        errors.append("Missing or empty 'skills' list")
        return False, errors

    for skill_path_str in config["skills"]:
        skill_dir = repo_root / skill_path_str
        if not skill_dir.exists():
            errors.append(f"Skill directory not found: {skill_path_str}")
            continue
        is_valid, skill_errors = validate_skill(skill_dir)
        if not is_valid:
            for err in skill_errors:
                errors.append(f"{skill_path_str}: {err}")

    return len(errors) == 0, errors


def package_product(config_path: Path, repo_root: Path, output_dir: Path) -> Path:
    """
    Package a product into a ZIP file.
    Returns the path to the created .zip file.
    """
    config = load_product_config(config_path)
    product_name = config["name"]
    output_dir.mkdir(parents=True, exist_ok=True)
    output_file = output_dir / f"{product_name}.zip"

    readme_path = config_path.parent / f"{product_name}-README.md"

    with tempfile.TemporaryDirectory() as tmp_dir:
        staging = Path(tmp_dir) / product_name

        # Copy each skill directory into staging root
        for skill_path_str in config["skills"]:
            skill_dir = repo_root / skill_path_str
            dest = staging / skill_dir.name
            shutil.copytree(skill_dir, dest)

        # Copy product README to staging root
        if readme_path.exists():
            shutil.copy2(readme_path, staging / "README.md")

        # Zip staging directory
        with zipfile.ZipFile(output_file, "w", zipfile.ZIP_DEFLATED) as zf:
            for file_path in staging.rglob("*"):
                if not file_path.is_file():
                    continue
                if any(part.startswith(".") for part in file_path.parts):
                    continue
                if file_path.name in ("__pycache__", ".DS_Store", "Thumbs.db"):
                    continue
                archive_path = file_path.relative_to(staging)
                zf.write(file_path, archive_path)
                print(f"  Added: {archive_path}")

    return output_file


def main():
    parser = argparse.ArgumentParser(
        description="Package skills for Claude.ai or products for Gumroad",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
    python build.py brainstorm            # Package the brainstorm skill
    python build.py --all                 # Package all skills
    python build.py --list                # List available skills
    python build.py --product brainstorm  # Package the brainstorm product
    python build.py --all-products        # Package all products
    python build.py --list-products       # List available products
        """,
    )
    parser.add_argument("skill", nargs="?", help="Name of skill to package")
    parser.add_argument("--all", action="store_true", help="Package all skills")
    parser.add_argument("--list", action="store_true", help="List available skills")
    parser.add_argument("--product", metavar="NAME", help="Package a single product")
    parser.add_argument(
        "--all-products", action="store_true", help="Package all products"
    )
    parser.add_argument(
        "--list-products", action="store_true", help="List available products"
    )
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
    product_configs = get_product_configs(repo_root)

    # List products mode
    if args.list_products:
        print("Available products:")
        for config_path in product_configs:
            is_valid, errors = validate_product(config_path, repo_root)
            status = "✓" if is_valid else "✗"
            config = load_product_config(config_path)
            skill_count = len(config.get("skills", []))
            print(
                f"  {status} {config.get('name', config_path.stem)} ({skill_count} skill{'s' if skill_count != 1 else ''})"
            )
            if errors:
                for error in errors:
                    print(f"      └─ {error}")
        return 0

    # List skills mode
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

    # Package products
    if args.all_products or args.product:
        if args.all_products:
            to_package_products = product_configs
        else:
            matches = [
                p
                for p in product_configs
                if load_product_config(p).get("name") == args.product
            ]
            if not matches:
                print(f"Error: Product '{args.product}' not found")
                available = [
                    load_product_config(p).get("name", p.stem) for p in product_configs
                ]
                print(f"Available products: {', '.join(available)}")
                return 1
            to_package_products = matches

        success_count = 0
        for config_path in to_package_products:
            config = load_product_config(config_path)
            product_name = config.get("name", config_path.stem)
            print(f"\n📦 Packaging product: {product_name}")

            is_valid, errors = validate_product(config_path, repo_root)
            if not is_valid:
                print("❌ Validation failed:")
                for error in errors:
                    print(f"   └─ {error}")
                continue

            print("✓ Validation passed")

            try:
                output_file = package_product(config_path, repo_root, output_dir)
                print(f"✅ Created: {output_file}")
                success_count += 1
            except Exception as e:
                print(f"❌ Packaging failed: {e}")

        print(f"\n{'─' * 40}")
        print(f"Packaged {success_count}/{len(to_package_products)} products")
        if success_count > 0:
            print(f"Output directory: {output_dir}")
        return 0 if success_count == len(to_package_products) else 1

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
