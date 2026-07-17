# Enhanced AI v0 overlays

| File | Role |
|------|------|
| `aimd-overlay.ini` | TaskForces / ScriptTypes / TeamTypes (Allied · Soviet · Yuri) |
| `aitriggers-overlay.ini` | `AITriggerTypes` with Normal/Hard tiers + air-response conditions |

## Difficulty tiers

| Slot | What fires |
|------|------------|
| Easy | Stock AI only (our triggers set `EnabledInE=0`) |
| Normal | Militia + harass + AA response |
| Hard | Above + eco-raid teams + extra harass weight |

## Requirements

- Base `aimd.ini` from YR (not shipped here)
- **Phobos** for script actions `10000+` / `10002`
- Merge order: vanilla aimd → `aimd-overlay` → `aitriggers-overlay`

## Playtest checklist (once YR is available)

1. Skirmish, fixed map, Allied vs Soviet Brutal
2. Note second refinery / harasser timing vs stock
3. Send Oras / Beags; confirm AA teams spawn
4. Record notes in repo `CHANGELOG.md`
