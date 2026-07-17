# macOS feasibility (honest)

Red Alert 2 / Yuri's Revenge is a **Windows** title. There is **no** official native Mac RA2 client, and **no** official RA2 remaster with Steam Workshop like the C&C Remastered Collection.

## What works for many people

| Approach | Notes |
|----------|-------|
| **CrossOver** | Community reports of RA2/YR and CnCNet-style setups; often needs `cnc-ddraw` (or equivalent) for acceptable framerate. |
| **Wine / wine-crossover builds** | Same idea; expect manual `ddraw` overrides and config tweaks (`RA2MD.ini` resolution, etc.). |
| **Cloud / remote Windows box** | Least friction if you only need to play, not iterate on INIs locally. |

## What this project commits to on Mac

- Document Wine/CrossOver as a **supported-but-friction** path.
- Keep install scripts usable against a Wine prefix game directory.
- **Not** promise one-click native Mac gameplay.
- **Not** pivot the public product back to OpenRA RA1 just for Mac convenience.

## Optional future Mac sandbox

[OpenRA/ra2](https://github.com/OpenRA/ra2) can run natively via OpenRA on macOS, but it is a **partial recreation**, not authentic YR multiplayer/mod ecosystem. If we ever add an OpenRA/ra2 experiment, it will be clearly labeled as a sandbox—not the Douyin “红警2增强” headline.
