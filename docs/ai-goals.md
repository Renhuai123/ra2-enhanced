# AI goals (RA2 / YR)

## Design principles

1. **Feel smarter, not just richer** — avoid unlabeled cheat multipliers as the default “Enhanced” profile.
2. **Readable pressure** — expand economy, keep power, patch anti-air, multi-prong harassment.
3. **Use Phobos where it helps** — script actions / target filters documented upstream; keep stubs commented until tested in-game.
4. **Diff-friendly INIs** — small overlays in `mod/ra2-enhanced/ai/`, not a 10k-line paste of vanilla `aimd.ini`.

## v0 target (next milestone)

On a fixed skirmish map vs stock Brutal/Normal:

- Earlier second ore refinery / consistent miner count
- Fewer prolonged power-outs after tech buildings
- Basic anti-air response when air is scouted
- At least one secondary harassment team (not only deathball)

Success = human testers consistently say “电脑比原版更会打” in blind A/B notes.

## Non-goals (for now)

- Full Mental Omega–scale faction redesign
- ML / external bot process attached to `gamemd` (research track only)
- Shipping compiled AI DLLs in this repo
