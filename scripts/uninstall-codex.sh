#!/usr/bin/env bash
set -euo pipefail

LINK_PATH="$HOME/.agents/skills/pillow"

if [ ! -e "$LINK_PATH" ] && [ ! -L "$LINK_PATH" ]; then
  echo "Pillow skills are not installed at $LINK_PATH"
  exit 0
fi

if [ ! -L "$LINK_PATH" ]; then
  echo "Error: $LINK_PATH exists but is not a symlink." >&2
  echo "Refusing to remove it." >&2
  exit 1
fi

rm "$LINK_PATH"

echo "Removed Pillow skills link:"
echo "  $LINK_PATH"
echo "Restart Codex if it is running."
