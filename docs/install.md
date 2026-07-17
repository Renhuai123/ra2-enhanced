# Install guide (RA2 / Yuri's Revenge)

## Prerequisites

1. Legal **Red Alert 2** + **Yuri's Revenge** install (`gamemd.exe` present).
2. [Ares](https://launchpad.net/ares/+download) (includes **Syringe**).
3. [Phobos](https://github.com/Phobos-developers/Phobos/releases) release matching your Ares generation.
4. Optional: [CnCNet](https://cncnet.org/) YR client or a Syringe-compatible XNA client mod base.

This repository does **not** ship those downloads.

## Engine extensions (game folder)

In the directory that contains `gamemd.exe`:

1. Extract Ares files (including `Syringe.exe`) per Ares docs.
2. Drop Phobos DLLs / files beside them; Syringe loads Phobos automatically when present.
3. Launch via `Syringe.exe gamemd.exe` or your CnCNet client (recommended for multiplayer).

Verify stock YR still runs before adding this mod's overlays.

## Install RA2 Enhanced overlays

### Windows (PowerShell)

```powershell
.\scripts\install-mod.ps1 -GameDir "D:\Games\YR"
```

Creates `GameDir\Mods\ra2-enhanced\` (or copies INI overlays — see script output) and prints next steps.

### Shell (Wine / CrossOver prefixes)

```bash
./scripts/install-mod.sh --game-dir "$HOME/Games/YR"
```

## Activation patterns

Mods differ in how they merge INIs. Supported approaches for this skeleton:

1. **Manual merge / `#include`** — point your active `rulesmd.ini` / `aimd.ini` at files under `mod/ra2-enhanced/` (see comments in those files).
2. **CnCNet / XNA client mod folder** — copy `mod/ra2-enhanced/` into the client's mod directory and enable the mod in the client UI.
3. **Direct drop-in for testing** — copy overlay fragments into the game dir **only** if you keep backups of original INIs.

Always keep backups of original `rulesmd.ini` / `aimd.ini` before experimenting.

## Verify

- Game launches through Syringe / CnCNet without missing-DLL errors.
- Skirmish AI section / custom includes load (check Phobos log if enabled).
- No `.mix` / binary files were added from this repo (there should be none).
