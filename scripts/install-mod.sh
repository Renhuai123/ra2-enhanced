#!/usr/bin/env bash
# Install RA2 Enhanced INI overlays into a YR game directory (Windows path or Wine prefix).
set -euo pipefail

GAME_DIR=""
USE_LINK=0
WIRE_INCLUDES=0

usage() {
  cat <<'EOF'
Usage: ./scripts/install-mod.sh --game-dir /path/to/YR [--link] [--wire-includes]

Copies (or symlinks) mod/ra2-enhanced into <game-dir>/Mods/ra2-enhanced.
Does not download RA2, Ares, Phobos, or CnCNet.

Options:
  --link            Symlink instead of copy (good for iterating INIs)
  --wire-includes   Append #include lines to rulesmd.ini / aimd.ini / uimd.ini
                    (creates .bak once per file if missing). Safe to re-run.
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
    --wire-includes)
      WIRE_INCLUDES=1
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
  # Try paths.local from detect-game.sh
  ROOT_TMP="$(cd "$(dirname "$0")/.." && pwd)"
  if [[ -f "${ROOT_TMP}/paths.local" ]]; then
    # shellcheck disable=SC1090
    source "${ROOT_TMP}/paths.local"
  fi
fi

if [[ -z "${GAME_DIR:-}" ]]; then
  usage >&2
  echo >&2
  echo "Tip: ./scripts/detect-game.sh" >&2
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

wire_one() {
  local ini_name="$1"
  local include_line="$2"
  local target="${GAME_DIR}/${ini_name}"
  if [[ ! -f "$target" ]]; then
    echo "Skip wire: ${ini_name} not found"
    return 0
  fi
  if grep -Fq "$include_line" "$target"; then
    echo "Already wired: ${ini_name}"
    return 0
  fi
  if [[ ! -f "${target}.bak" ]]; then
    cp "$target" "${target}.bak"
    echo "Backup: ${ini_name}.bak"
  fi
  printf '\n; RA2 Enhanced — added by install-mod.sh\n%s\n' "$include_line" >>"$target"
  echo "Wired: ${ini_name} += ${include_line}"
}

if [[ "$WIRE_INCLUDES" -eq 1 ]]; then
  wire_one "rulesmd.ini" "#include Mods/ra2-enhanced/includes/rulesmd.includes.ini"
  wire_one "aimd.ini" "#include Mods/ra2-enhanced/includes/aimd.includes.ini"
  wire_one "uimd.ini" "#include Mods/ra2-enhanced/includes/uimd.includes.ini"
fi

# Write outside the mod tree so --link does not pollute the git repo
STEPS="${GAME_DIR}/Mods/RA2-Enhanced-INSTALL-NEXT-STEPS.txt"
cat >"$STEPS" <<EOF
RA2 Enhanced — next steps
=========================

Installed to: ${DST}

1) Install Ares + Phobos into: ${GAME_DIR}
   - Ares: https://launchpad.net/ares/+download
   - Phobos: https://github.com/Phobos-developers/Phobos/releases
   Launch via Syringe.exe gamemd.exe (or CnCNet).

2) Activate overlays (if you did not pass --wire-includes):
   Append to rulesmd.ini:
     #include Mods/ra2-enhanced/includes/rulesmd.includes.ini
   Append to aimd.ini:
     #include Mods/ra2-enhanced/includes/aimd.includes.ini
   Append to uimd.ini:
     #include Mods/ra2-enhanced/includes/uimd.includes.ini

3) Merge [Phobos] keys from:
     Mods/ra2-enhanced/qol/ra2md-phobos.ini
   into RA2MD.INI next to gamemd.exe.

4) Validate:
     ./scripts/validate-mod.sh --game-dir "${GAME_DIR}"

This script did NOT install game files or engine DLLs.
EOF

cat <<EOF

Next steps:
  1) Install Ares + Phobos into: $GAME_DIR
  2) Activate includes (re-run with --wire-includes, or see $STEPS)
  3) Merge qol/ra2md-phobos.ini into RA2MD.INI
  4) Launch via Syringe or CnCNet
  5) ./scripts/validate-mod.sh --game-dir "$GAME_DIR"

This script did NOT install game files or engine DLLs.
EOF
