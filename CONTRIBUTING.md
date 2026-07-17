# Contributing

Thanks for helping improve **RA2 Enhanced** (红色警戒2 增强 Mod).

## Rules

1. **No game binaries or copyrighted assets** — never commit `.exe`, `.dll`, `.mix`, `.shp`, `.vxl`, `.csf`, music, videos, etc.
2. **No redistributing Ares / Phobos / Syringe / CnCNet packages** — document versions and download URLs instead.
3. Prefer small, reviewable PRs: one AI change or one QoL change per PR when possible.
4. Document player-facing behavior in `docs/` when you change AI or QoL defaults.

## Local workflow

1. Own a legal RA2 + Yuri's Revenge install (Windows native, or Wine/CrossOver on Mac).
2. Install Ares + Phobos per [docs/install.md](docs/install.md).
3. Copy or symlink `mod/ra2-enhanced/` overlays into your game / mod folder.
4. Test skirmish vs stock AI before opening a PR.

## AI changes

- Prefer `mod/ra2-enhanced/ai/` overlays and comments explaining intent.
- Avoid “cheat” economy multipliers unless clearly labeled as an optional hard-mode profile.
- Note which Phobos script actions / tags you rely on.

## License

Contributions are accepted under **GPL-3.0** (see [LICENSE](LICENSE)), subject to [NOTICE](NOTICE).
