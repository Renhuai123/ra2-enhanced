# AI goals (RA2 / YR)

## Design principles

1. **Feel smarter, not just richer** — avoid unlabeled cheat multipliers as the default “Enhanced” profile.
2. **Readable pressure** — expand economy pressure, keep power contests, patch anti-air, multi-prong harassment.
3. **Use Phobos where it helps** — script actions / `AITargetTypes` documented upstream.
4. **Diff-friendly INIs** — small overlays in `mod/ra2-enhanced/ai/`, not a 10k-line paste of vanilla `aimd.ini`.

## v0 delivered (config)

Files:

- `ai/aimd-overlay.ini` — TaskForces / ScriptTypes / TeamTypes (3 sides)
- `ai/aitriggers-overlay.ini` — triggers + difficulty enable bits
- `rules/rulesmd-overlay.ini` — pacing + `AITargetTypes`

Behaviors intended when merged under Phobos:

| Behavior | Mechanism |
|----------|-----------|
| Earlier / steadier attack teams | Lower `TeamDelays` + militia triggers |
| Secondary harassment | Harass TeamTypes → economy quarry scripts |
| Eco / production raids (Hard) | Eco-raid triggers `EnabledInH=1` |
| Anti-air response | Triggers on enemy `ORCA` / `BEAG` / `DISK` ≥ 1 |

Easy AI slot: Enhanced triggers mostly off (`EnabledInE=0`) so stock remains the soft option.

## v0 still pending (playtest)

On a fixed skirmish map vs stock Brutal/Normal:

- [ ] Confirm teams actually spawn (no ID / include mistakes)
- [ ] Confirm AA response when air is scouted
- [ ] Blind notes: “电脑比原版更会打”

Success = human testers consistently agree in A/B notes; then tune weights.

## Non-goals (for now)

- Full Mental Omega–scale faction redesign
- ML / external bot process attached to `gamemd` (research track only)
- Shipping compiled AI DLLs in this repo
- Default `MultiplayerAICM` / virtual purifier income cheats
