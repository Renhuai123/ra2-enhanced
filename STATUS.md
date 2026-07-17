# Project status — is it “全部完成了?”

**No.** Scaffolding and Enhanced AI **v0 configs** exist; a finished, playtested RA2/YR product does **not**.

Last updated: 2026-07-17

---

## Done

| Item | Notes |
|------|--------|
| Product pivot to RA2/YR (not OpenRA RA1) | Docs + announcement |
| Legal/IP boundaries | LICENSE, NOTICE — no game binaries |
| Mod package structure | `mod/ra2-enhanced/` with includes |
| **Enhanced AI v0 INI overlays** | TaskForces / Scripts / TeamTypes / AITriggerTypes / difficulty tiers |
| Phobos QoL overlays | Tooltips, harvester counter, power delta, placement preview |
| Install scripts | Windows PS1 + shell; detect + validate helpers |
| Honest roadmap / status | This file + ROADMAP |

## In progress

| Item | Notes |
|------|--------|
| In-game A/B validation of AI v0 | **Blocked** — no YR install on maintainer Mac (see below) |
| Weight / composition tuning | Needs skirmish feedback on fixed maps |
| CnCNet client mod descriptor polish | Works as folder drop-in; client-specific packaging TBD |

## Not started

| Item | Notes |
|------|--------|
| Full faction AI parity / late-game compositions | Beyond v0 militia·harass·AA·eco-raid |
| Custom CSF / language pack | Only README notes |
| Multiplayer desync certification | Needs CnCNet test nights |
| Income-cheat “brutal+” profiles | Intentionally deferred |
| OpenRA/ra2 Mac sandbox track | Research only; not the product |

---

## Blocker on this machine (2026-07-17 scan)

Searched common locations (Steam, CrossOver bottles, Wine prefixes, `/Applications`, Spotlight for `gamemd.exe` / `rulesmd.ini`):

- **No Red Alert 2 / Yuri's Revenge install found**
- OpenRA Red Alert.app may be present — that is **RA1**, not usable for this mod

**Exact unblock steps:** place a legal YR directory (with `gamemd.exe`) on the machine or a Wine/CrossOver prefix, then:

```bash
./scripts/detect-game.sh
./scripts/install-mod.sh --game-dir "$GAME_DIR" --wire-includes
```

---

## What “done” would mean for AI v0

1. Overlays load under Syringe/Ares/Phobos without errors  
2. Blind A/B notes: testers say AI expands / AA / harasses better than stock  
3. Results written into `CHANGELOG.md`

Until then: **configs are real and merge-ready; gameplay proof is pending.**
