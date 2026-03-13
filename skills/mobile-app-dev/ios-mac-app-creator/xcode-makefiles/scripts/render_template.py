#!/usr/bin/env python3
import argparse
import os
import shutil
from pathlib import Path


def parse_vars(items):
    mapping = {}
    for item in items:
        if "=" not in item:
            raise ValueError(f"Invalid --var entry: {item}")
        key, value = item.split("=", 1)
        if not key:
            raise ValueError(f"Empty key in --var entry: {item}")
        mapping[key] = value
    return mapping


def render_text(content, mapping):
    for key, value in mapping.items():
        content = content.replace(f"__{key}__", value)
    return content


def copy_tree(src_dir, dst_dir, mapping):
    src_path = Path(src_dir)
    dst_path = Path(dst_dir)
    if not src_path.exists():
        raise FileNotFoundError(f"Template directory not found: {src_path}")

    for root, dirs, files in os.walk(src_path):
        rel_root = Path(root).relative_to(src_path)
        target_root = dst_path / rel_root
        target_root.mkdir(parents=True, exist_ok=True)

        for name in files:
            src_file = Path(root) / name
            dst_file = target_root / name
            try:
                content = src_file.read_text(encoding="utf-8")
            except UnicodeDecodeError:
                shutil.copy2(src_file, dst_file)
                continue

            rendered = render_text(content, mapping)
            dst_file.write_text(rendered, encoding="utf-8")
            shutil.copystat(src_file, dst_file)



def main():
    parser = argparse.ArgumentParser(description="Render a template directory with placeholders.")
    parser.add_argument("--src", required=True, help="Template source directory")
    parser.add_argument("--dst", required=True, help="Destination directory")
    parser.add_argument("--var", action="append", default=[], help="Template variable KEY=VALUE")
    args = parser.parse_args()

    mapping = parse_vars(args.var)
    copy_tree(args.src, args.dst, mapping)


if __name__ == "__main__":
    main()
