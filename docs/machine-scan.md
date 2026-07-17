# Maintainer machine scan (macOS)

Date: 2026-07-17  
Host: local Mac used for `ra2-enhanced` development

## Result

**Yuri's Revenge / RA2 game files: NOT FOUND**

| Location checked | Result |
|------------------|--------|
| `~/Games` | missing |
| Steam `steamapps/common` | missing |
| CrossOver Bottles | missing |
| `~/.wine` / wineprefixes | missing |
| Spotlight `gamemd.exe`, `ra2md.exe`, `rulesmd.ini` | no hits |
| `/Applications` | OpenRA Red Alert may exist — **RA1**, irrelevant |

## Implication

- Cannot wire or launch-validate overlays against a real `gamemd.exe` on this Mac
- Mod package + install path are implemented; in-game proof waits on a legal YR tree

## When a game dir appears

```bash
./scripts/detect-game.sh
./scripts/install-mod.sh --game-dir "/path/to/YR" --wire-includes
./scripts/validate-mod.sh --game-dir "/path/to/YR"
```
