# Changelog

## 0.2.0 — 2026-07-17

### Enhanced AI v0 (config)

- Real `aimd` overlays: Allied / Soviet / Yuri militia, harass, eco-raid, anti-air TaskForces & TeamTypes
- Phobos attack scripts (`10000` / `10002`) targeting economy, power, production, aircraft
- `AITriggerTypes` with Normal/Hard tiers and air-presence AA conditions
- `rulesmd` pacing knobs (`TeamDelays`, `AIHateDelays`, `TotalAITeamCap`) + `AITargetTypes`

### QoL (Phobos)

- `uimd` ExtendedToolTips, harvester counter, power delta
- rules `PlacementPreview` / `ShowDesignatorRange`
- `RA2MD.INI` `[Phobos]` toggle template

### Shipping polish

- One-line `#include` chains under `mod/ra2-enhanced/includes/`
- Install scripts: `--wire-includes` / `-WireIncludes`, next-steps file
- `detect-game.sh`, `validate-mod.sh`, `STATUS.md`, machine scan notes

### Still not done

- In-game A/B validation (no YR install on maintainer Mac at release of 0.2.0)

## 0.1.0 — 2026-07-17

- Initial public pivot to **Red Alert 2 / Yuri's Revenge**.
- Docs: research brief, install, Mac feasibility, Chinese announcement.
- Mod skeleton: `rulesmd` / `aimd` / QoL overlays (stubs).
- Install scripts for Windows and shell/Wine paths.
- No game binaries; no Ares/Phobos redistribution.
