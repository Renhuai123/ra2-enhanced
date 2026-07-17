#!/usr/bin/env bash
# Install RA2 Enhanced INI overlays into a YR game directory (Windows path or Wine prefix).
set -euo pipefail

GAME_DIR=""
USE_LINK=0

usage() {
  cat <<'EOF'
Usage: ./scripts/install-mod.sh --game-dir /path/to/YR [--link]

Copies (or symlinks) mod/ra2-enhanced into <game-dir>/Mods/ra2-enhanced.
Does not download RA2, Ares, Phobos, or CnCNet.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --game-dir)
      GAME_DIR="${2:-}"
      shift 2
      ;;
    --link)
      USE_LINK=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown arg: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ -z "$GAME_DIR" ]]; then
  usage >&2
  exit 1
fi

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$ROOT/mod/ra2-enhanced"
DST="$GAME_DIR/Mods/ra2-enhanced"

if [[ ! -d "$SRC" ]]; then
  echo "Mod source missing: $SRC" >&2
  exit 1
fi
if [[ ! -d "$GAME_DIR" ]]; then
  echo "Game dir missing: $GAME_DIR" >&2
  exit 1
fi

if [[ ! -f "$GAME_DIR/gamemd.exe" ]]; then
  echo "Warning: gamemd.exe not found in $GAME_DIR (ok for some Wine layouts)." >&2
fi

mkdir -p "$GAME_DIR/Mods"
rm -rf "$DST"

if [[ "$USE_LINK" -eq 1 ]]; then
  ln -sfn "$SRC" "$DST"
  echo "Symlinked: $DST -> $SRC"
else
  mkdir -p "$DST"
  cp -R "$SRC"/. "$DST"/
  echo "Copied overlays to: $DST"
fi

cat <<EOF

Next steps:
  1) Install Ares + Phobos into: $GAME_DIR
  2) Merge/include INIs per docs/install.md
  3) Launch via Syringe or CnCNet

This script did NOT install game files or engine DLLs.
EOF
