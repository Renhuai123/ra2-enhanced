# `ra2-enhanced` mod overlay

Text-only overlay for **Yuri's Revenge** with **Ares + Phobos**.

## Package layout

| Path | Role |
|------|------|
| `expandmd.ini` | Activation / include hints |
| `includes/*.includes.ini` | One-line `#include` chains for rules / ai / ui |
| `rules/rulesmd-overlay.ini` | AI pacing knobs + Phobos `AITargetTypes` |
| `ai/aimd-overlay.ini` | TaskForce / Script / TeamType definitions |
| `ai/aitriggers-overlay.ini` | `AITriggerTypes` (difficulty tiers + AA conditions) |
| `qol/qol-phobos.ini` | rulesmd AudioVisual QoL |
| `qol/uimd-overlay.ini` | Extended tooltips, harvester & power counters |
| `qol/ra2md-phobos.ini` | `RA2MD.INI` `[Phobos]` user-toggle template |
| `language/README.md` | String / CSF notes (no binary `.csf` shipped) |

## Fast activate (after install script)

1. Ensure Ares + Phobos load with `gamemd.exe`
2. Append to active INIs (keep backups):

```ini
; rulesmd.ini
#include Mods/ra2-enhanced/includes/rulesmd.includes.ini

; aimd.ini
#include Mods/ra2-enhanced/includes/aimd.includes.ini

; uimd.ini
#include Mods/ra2-enhanced/includes/uimd.includes.ini
```

3. Merge `[Phobos]` keys from `qol/ra2md-phobos.ini` into `RA2MD.INI`

## Compatibility

- Designed against **YR + Ares 3.x + Phobos 0.3+**
- Phobos script actions `10000+` are required for Enhanced AI v0 attack scripts
- Exact tag availability depends on your Phobos build; see upstream docs
