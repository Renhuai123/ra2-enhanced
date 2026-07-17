#!/usr/bin/env bash
# Fail if tracked-looking binary / asset patterns exist under the repo (excluding .git).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

patterns='.*\.(exe|dll|mix|bag|idx|csf|shp|vxl|hva|wav|aud|bik|mp3|wmv|pak|pdb)$'
if find . -path ./.git -prune -o -type f -iregex "$patterns" -print | grep -q .; then
  echo "ERROR: forbidden binary/asset files present:" >&2
  find . -path ./.git -prune -o -type f -iregex "$patterns" -print >&2
  exit 1
fi
echo "OK: no forbidden game binaries/assets found."
