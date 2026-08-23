#!/usr/bin/env bash
set -euo pipefail

# Installs this repo's personal global agent config into ~/.claude:
#   global/CLAUDE.md                                       -> ~/.claude/CLAUDE.md
#   skills/.../writing-for-humans/references/tells.md      -> ~/.claude/forbidden.md
#
# Run it once per machine. Symlinks are used where the platform allows them, so
# a `git pull` keeps both files current; otherwise the files are copied and the
# script has to be re-run after a pull.
#
# An existing real file at either destination is backed up beside itself first.

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DEST="$HOME/.claude"
COPIED=0

install_one() {
  src="$1"
  target="$2"

  if [ ! -f "$src" ]; then
    echo "error: missing source $src" >&2
    exit 1
  fi

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    backup="$target.backup.$(date +%Y%m%d%H%M%S)"
    cp "$target" "$backup"
    echo "backed up existing $target -> $backup"
  fi

  rm -f "$target"

  # `ln -s` reports success on MSYS/Git Bash even where Windows refuses a real
  # file symlink, and leaves a copy behind instead. Check what actually landed
  # rather than trusting the exit code.
  if ln -s "$src" "$target" 2>/dev/null && [ -L "$target" ]; then
    echo "linked   $target -> $src"
  else
    rm -f "$target"
    cp "$src" "$target"
    echo "copied   $src -> $target"
    COPIED=1
  fi
}

mkdir -p "$DEST"

install_one "$REPO/global/CLAUDE.md" "$DEST/CLAUDE.md"
install_one "$REPO/skills/productivity/writing-for-humans/references/tells.md" "$DEST/forbidden.md"

echo
if [ "$COPIED" = "1" ]; then
  echo "At least one file was copied, not linked, because this platform would not"
  echo "create a file symlink. Those copies do not follow a \`git pull\`; re-run this"
  echo "script after pulling to refresh them."
  echo
fi
echo "Done. Start a new session for ~/.claude/CLAUDE.md to be picked up."
