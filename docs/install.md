# Install guide (RA2 / Yuri's Revenge)

Goal: go from a legal YR folder to Enhanced AI v0 + QoL overlays in a few minutes.

## Prerequisites

1. Legal **Red Alert 2** + **Yuri's Revenge** install (`gamemd.exe` present).
2. [Ares](https://launchpad.net/ares/+download) (includes **Syringe**).
3. [Phobos](https://github.com/Phobos-developers/Phobos/releases) matching your Ares generation (**required** for AI v0 script actions `10000+`).
4. Optional: [CnCNet](https://cncnet.org/) YR client.

This repository does **not** ship those downloads.

## Engine extensions (game folder)

In the directory that contains `gamemd.exe`:

1. Extract Ares (including `Syringe.exe`) per upstream docs.
2. Drop Phobos DLLs beside them; Syringe loads Phobos when present.
3. Confirm stock YR still launches via `Syringe.exe gamemd.exe` (or CnCNet) **before** adding this mod.

## Install RA2 Enhanced overlays

### Windows (PowerShell)

```powershell
git clone https://github.com/Renhuai123/ra2-enhanced.git
cd ra2-enhanced
.\scripts\install-mod.ps1 -GameDir "D:\Games\YR" -WireIncludes
```

### macOS / Linux shell (Wine / CrossOver prefix)

```bash
git clone https://github.com/Renhuai123/ra2-enhanced.git
cd ra2-enhanced

# Optional: search common locations
./scripts/detect-game.sh

./scripts/install-mod.sh --game-dir "/path/to/YR" --wire-includes
./scripts/validate-mod.sh --game-dir "/path/to/YR"
```

`--wire-includes` appends `#include` lines to `rulesmd.ini` / `aimd.ini` / `uimd.ini` and creates `.bak` backups once.

### Manual activation (if you skip wire)

Append:

```ini
; rulesmd.ini
#include Mods/ra2-enhanced/includes/rulesmd.includes.ini

; aimd.ini
#include Mods/ra2-enhanced/includes/aimd.includes.ini

; uimd.ini
#include Mods/ra2-enhanced/includes/uimd.includes.ini
```

Merge `[Phobos]` keys from `Mods/ra2-enhanced/qol/ra2md-phobos.ini` into `RA2MD.INI`.

## What you get

| Overlay | Effect |
|---------|--------|
| AI v0 | Militia / harass / eco-raid / AA-response teams + triggers |
| Difficulty tiers | Extra pressure on Hard AI; Easy mostly stock |
| QoL | Extended tooltips, harvester counter, power delta, placement preview |

## Verify

- Game launches through Syringe / CnCNet without missing-DLL errors
- `./scripts/validate-mod.sh --game-dir …` passes
- Skirmish: Hard AI fields harass / AA teams (see `mod/ra2-enhanced/ai/README.md`)
- No `.mix` / binary files came from this repo

## Status honesty

See [STATUS.md](../STATUS.md). Configs can be complete while **in-game proof** is still pending on a machine without YR.
