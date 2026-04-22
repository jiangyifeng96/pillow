#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOURCE_DIR="$REPO_ROOT/skills"
DEST_DIR="$HOME/.agents/skills"
LINK_PATH="$DEST_DIR/pillow"

resolve_dir() {
  (
    cd "$1"
    pwd -P
  )
}

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: skills directory not found: $SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$DEST_DIR"

if [ -L "$LINK_PATH" ]; then
  current_target="$(resolve_dir "$LINK_PATH")"
  expected_target="$(resolve_dir "$SOURCE_DIR")"
  if [ "$current_target" = "$expected_target" ]; then
    echo "Pillow skills already installed:"
    echo "  $LINK_PATH -> $SOURCE_DIR"
    echo "Restart Codex if it is already running."
    exit 0
  fi

  echo "Error: $LINK_PATH already points somewhere else." >&2
  echo "Current target: $current_target" >&2
  echo "Expected target: $expected_target" >&2
  echo "Refusing to overwrite it." >&2
  exit 1
fi

if [ -e "$LINK_PATH" ]; then
  echo "Error: $LINK_PATH already exists and is not a symlink." >&2
  echo "Refusing to overwrite it." >&2
  exit 1
fi

ln -s "$SOURCE_DIR" "$LINK_PATH"

echo "Installed Pillow skills:"
echo "  $LINK_PATH -> $SOURCE_DIR"
echo "Restart Codex to load the new skills."
