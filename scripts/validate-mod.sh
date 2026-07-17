#!/usr/bin/env bash
# Validate mod package structure (and optionally a game-dir install).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
GAME_DIR=""
SRC="${ROOT}/mod/ra2-enhanced"

usage() {
  cat <<'EOF'
Usage: ./scripts/validate-mod.sh [--game-dir /path/to/YR]

Checks required overlay files exist and contain Enhanced AI v0 markers.
With --game-dir, also verifies Mods/ra2-enhanced is installed and
warns if #include wire-up is missing from rulesmd/aimd/uimd.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --game-dir) GAME_DIR="${2:-}"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown arg: $1" >&2; usage >&2; exit 1 ;;
  esac
done

required=(
  "$SRC/expandmd.ini"
  "$SRC/rules/rulesmd-overlay.ini"
  "$SRC/ai/aimd-overlay.ini"
  "$SRC/ai/aitriggers-overlay.ini"
  "$SRC/qol/qol-phobos.ini"
  "$SRC/qol/uimd-overlay.ini"
  "$SRC/qol/ra2md-phobos.ini"
  "$SRC/includes/rulesmd.includes.ini"
  "$SRC/includes/aimd.includes.ini"
  "$SRC/includes/uimd.includes.ini"
)

fail=0
for f in "${required[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "MISSING: $f" >&2
    fail=1
  fi
done

grep -q 'RA2E_Team_AlliedHarass' "$SRC/ai/aimd-overlay.ini" || { echo "FAIL: aimd missing Allied harass team" >&2; fail=1; }
grep -q '\[AITriggerTypes\]' "$SRC/ai/aitriggers-overlay.ini" || { echo "FAIL: aitriggers missing section" >&2; fail=1; }
grep -q '\[AITargetTypes\]' "$SRC/rules/rulesmd-overlay.ini" || { echo "FAIL: rules missing AITargetTypes" >&2; fail=1; }
grep -q 'ExtendedToolTips=true' "$SRC/qol/uimd-overlay.ini" || { echo "FAIL: QoL tooltips not enabled" >&2; fail=1; }

if [[ $fail -ne 0 ]]; then
  echo "validate-mod: FAILED (package)" >&2
  exit 1
fi
echo "OK: mod package structure (Enhanced AI v0 + QoL)"

if [[ -z "$GAME_DIR" ]]; then
  exit 0
fi

if [[ ! -d "$GAME_DIR" ]]; then
  echo "Game dir missing: $GAME_DIR" >&2
  exit 1
fi

DST="${GAME_DIR}/Mods/ra2-enhanced"
if [[ ! -d "$DST" ]]; then
  echo "WARN: mod not installed at $DST (run install-mod.sh)" >&2
  fail=1
fi

if [[ ! -f "${GAME_DIR}/gamemd.exe" ]]; then
  echo "WARN: gamemd.exe not in game dir" >&2
fi

for ini in rulesmd.ini aimd.ini uimd.ini; do
  path="${GAME_DIR}/${ini}"
  if [[ -f "$path" ]]; then
    if grep -q 'Mods/ra2-enhanced/includes' "$path"; then
      echo "OK: ${ini} has ra2-enhanced include"
    else
      echo "WARN: ${ini} has no ra2-enhanced #include yet (use --wire-includes)"
    fi
  else
    echo "WARN: ${ini} not present in game dir (CnCNet layouts may differ)"
  fi
done

# Engine extensions presence (informational)
for dll in Ares.dll Phobos.dll; do
  if [[ -f "${GAME_DIR}/${dll}" ]] || ls "${GAME_DIR}"/${dll%.dll}*.dll >/dev/null 2>&1; then
    echo "OK: found ${dll} (or variant)"
  else
    echo "WARN: ${dll} not found — install Ares/Phobos from upstream"
  fi
done

if [[ $fail -ne 0 ]]; then
  echo "validate-mod: FAILED (game dir)" >&2
  exit 1
fi
echo "validate-mod: OK"
