#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

python3 - <<'PYEOF'
import json
import sys
from pathlib import Path


def fail(message: str) -> None:
    print(message, file=sys.stderr)
    raise SystemExit(1)


def parse_frontmatter(path: Path) -> dict[str, str]:
    lines = path.read_text(encoding="utf-8").splitlines()
    if not lines or lines[0] != "---":
        fail(f"INVALID FRONTMATTER: {path} must start with ---")

    try:
        end = lines.index("---", 1)
    except ValueError:
        fail(f"INVALID FRONTMATTER: {path} missing closing ---")

    fields: dict[str, str] = {}
    in_metadata = False

    for line in lines[1:end]:
        if line.startswith("name:"):
            fields["name"] = line.split(":", 1)[1].strip()
            in_metadata = False
        elif line.startswith("description:"):
            fields["description"] = line.split(":", 1)[1].strip().strip('"')
            in_metadata = False
        elif line == "metadata:":
            in_metadata = True
        elif in_metadata and line.startswith("  version:"):
            fields["version"] = line.split(":", 1)[1].strip().strip('"')
        elif line and not line.startswith(" "):
            in_metadata = False

    for key in ("name", "description", "version"):
        if not fields.get(key):
            fail(f"MISSING {key}: {path}")

    return fields


root = Path(".")
skill_files = sorted((root / "skills").glob("*/SKILL.md"))
if not skill_files:
    fail("NO SKILLS FOUND: expected skills/*/SKILL.md")

resolver_path = root / "skills" / "RESOLVER.md"
if not resolver_path.exists():
    fail("MISSING RESOLVER: skills/RESOLVER.md")
resolver_text = resolver_path.read_text(encoding="utf-8")

marketplace_path = root / ".claude-plugin" / "marketplace.json"
if not marketplace_path.exists():
    fail("MISSING MARKETPLACE: .claude-plugin/marketplace.json")
marketplace = json.loads(marketplace_path.read_text(encoding="utf-8"))
plugins = marketplace.get("plugins")
if not isinstance(plugins, list):
    fail("INVALID MARKETPLACE: plugins must be a list")

marketplace_entries: dict[str, dict] = {}
for entry in plugins:
    if not isinstance(entry, dict):
        fail("INVALID MARKETPLACE ENTRY: plugin entry must be an object")
    name = entry.get("name")
    if not name:
        fail("INVALID MARKETPLACE ENTRY: missing name")
    if name in marketplace_entries:
        fail(f"DUPLICATE MARKETPLACE ENTRY: {name}")
    marketplace_entries[name] = entry

skill_names = []
for path in skill_files:
    skill_dir = path.parent.name
    fields = parse_frontmatter(path)
    if fields["name"] != skill_dir:
        fail(f"NAME MISMATCH: {path} frontmatter name={fields['name']} dir={skill_dir}")

    description = fields["description"]
    if not description.lower().startswith(("use", "invoke")):
        fail(f"DESCRIPTION MUST START WITH Use/Invoke: {path}")
    if "not for" not in description.lower():
        fail(f"DESCRIPTION MUST INCLUDE NOT FOR: {path}")

    skill_names.append(skill_dir)
    resolver_token = f"skills/{skill_dir}/SKILL.md"
    if resolver_token not in resolver_text:
        fail(f"RESOLVER GAP: {skill_dir} missing from skills/RESOLVER.md")

    entry = marketplace_entries.get(skill_dir)
    if not entry:
        fail(f"NOT IN MARKETPLACE: {skill_dir}")

    if entry.get("source") != f"./skills/{skill_dir}":
        fail(f"WRONG SOURCE: {skill_dir}")

    if str(entry.get("version")) != fields["version"]:
        fail(f"VERSION MISMATCH: {skill_dir}")

    if entry.get("description", "").strip().strip('"') != description:
        fail(f"DESCRIPTION MISMATCH: {skill_dir}")

for name in sorted(marketplace_entries):
    if name not in skill_names:
        fail(f"MISSING SKILL DIRECTORY: {name}")

print("verify-skills: ok")
PYEOF

