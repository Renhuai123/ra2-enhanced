# Research brief: why RA2 ≠ OpenRA `ra`, and chosen stack (2026)

## Problem

Chinese community demand (e.g. Douyin “红警2”) refers to **Command & Conquer: Red Alert 2** (often with **Yuri's Revenge**), not Red Alert 1.

The previous public repo [`openra-ra-enhanced`](https://github.com/Renhuai123/openra-ra-enhanced) was built on **OpenRA stock `ra`**, which is a **Red Alert 1** remake path. That product name and messaging were incorrect for RA2 demand.

## Option matrix

| Path | What it is | RA2 authenticity | Mac | AI / QoL leverage | Verdict |
|------|------------|------------------|-----|-------------------|---------|
| **OpenRA stock `ra`** | Official OpenRA RA1 mod | ❌ RA1, not RA2 | ✅ Native | High inside OpenRA | Wrong game |
| **[OpenRA/ra2](https://github.com/OpenRA/ra2)** | Community RA2 *recreation* on OpenRA | Partial / WIP (not full fidelity; engine catch-up ongoing) | ✅ Native OpenRA | OpenRA bots + YAML | Good for Mac experiments; weak as “real 红警2” product |
| **Vanilla RA2/YR + [Ares](https://launchpad.net/ares) + [Phobos](https://github.com/Phobos-developers/Phobos) (+ optional CnCNet)** | Classic Westwood engine with community extensions | ✅ Authentic RA2/YR | ⚠️ Windows primary; Mac via Wine/CrossOver | Mature INI + Phobos AI scripting / QoL hooks | **Best primary path** |
| Mental Omega–style mega-mod fork | Full content overhaul | ✅ (different balance/content) | Same as YR stack | High but huge scope | Too large; not our MVP |
| Official remaster / Steam Workshop | N/A for RA2 | — | — | — | **No official RA2 remaster** like the C&C Remastered Collection |

### Notes on OpenRA/ra2

- Actively maintained community project, **not** an official OpenRA release game beside TD/RA/D2K.
- Still catching up to engine releases; incomplete Gen2 behaviors remain a known theme historically.
- Excellent for cross-platform experiments, but marketing it as “红警2增强” will disappoint players who expect original RA2/YR feel, maps, and multiplayer ecosystem.

### Notes on Ares + Phobos + CnCNet

- **De facto** RA2/YR modding pipeline in 2025–2026 (Mental Omega–class mods, CnCNet YR client packages).
- Phobos adds extensive QoL and AI scripting surfaces (`aimd.ini` actions, tooltips, indicators, etc.) while accompanying Ares rather than replacing it.
- Requires a **legal player-owned** RA2 + YR install. This repo ships **rules/docs only**.

## Decision (this project)

**Primary stack: Red Alert 2 + Yuri's Revenge + Ares + Phobos (+ optional CnCNet client).**

Reasons:

1. Matches user demand for **红色警戒2**, not RA1.
2. Implementable open-source deliverable: INI AI/QoL overlays without redistributing game binaries.
3. Strongest existing tooling for “smarter computer + better UX” on real RA2.
4. Mac is harder than OpenRA, but **honest documentation + Wine/CrossOver** is preferable to shipping the wrong game.

**Secondary / future (explicitly optional):** evaluate OpenRA/ra2 only as a Mac-native sandbox once primary YR overlays are useful—never as the marketing headline.

## Mac feasibility (honest)

| Platform | Expectation |
|----------|-------------|
| **Windows** | Primary target. Native `gamemd.exe` + Syringe/Ares/Phobos (+ CnCNet). |
| **macOS** | No first-class native RA2. Playable for many via **CrossOver / Wine** + `cnc-ddraw`-style fixes; setup friction is real. |
| **Linux** | Similar to Mac: Wine / Proton-style setups; community-dependent. |

This project still documents Mac paths and keeps install scripts path-agnostic where possible. We do **not** claim “one-click native Mac RA2.”

## Legal / distribution boundaries

- IP belongs to **EA**. This is a **mod**, not an independent commercial RA2 product.
- No game binaries, `.mix` packs, or redistributed engine-extension installers in-repo.
- Users download Ares/Phobos/CnCNet from upstream; users supply their own RA2/YR.

## Historical note

[`openra-ra-enhanced`](https://github.com/Renhuai123/openra-ra-enhanced) remains as an **archived RA1/OpenRA experiment** with a README redirect here. Do not use it for RA2 promo.
