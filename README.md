# RA2 Enhanced（红色警戒2 增强 Mod）

> **一句话**：面向老玩家的 **红色警戒2 / 尤里的复仇** 开源增强 Mod——更强电脑 AI、更清晰体验；**不是**商业独立红警，也**不是** OpenRA 红警1。

抖音上大家要找的是 **红警2**。本仓库就是这个方向的公开工程：  
**<https://github.com/Renhuai123/ra2-enhanced>**

**全部完成了吗？→ [STATUS.md](STATUS.md)（诚实答案：还没有）**

技术选型说明：[docs/research-brief.md](docs/research-brief.md)  
对外公告文案：[docs/ANNOUNCEMENT.md](docs/ANNOUNCEMENT.md)

---

> **重要声明**  
> - 红色警戒 IP 属于 **EA**。我们只做 **Mod / 规则与文档**，不做独立商业 RA2 产品。  
> - 本仓库 **不包含、也不分发** RA2/YR 游戏二进制、`.mix` 资源包，以及 Ares/Phobos/CnCNet 安装包。  
> - 你必须自备合法 **红警2 + 尤里的复仇**，并自行从上游获取引擎扩展。

| | |
|---|---|
| **目标游戏** | Red Alert 2 + Yuri's Revenge |
| **工具链** | Ares + Phobos（Syringe）· 可选 CnCNet Client |
| **仓库内容** | INI 规则 / Enhanced AI v0 / QoL / 安装脚本 / 文档 |
| **许可证** | [GPL-3.0](LICENSE) + [NOTICE](NOTICE) |
| **主平台** | Windows（原生） |
| **Mac** | 非原生；可通过 Wine / CrossOver 运行，见 [docs/mac-notes.md](docs/mac-notes.md) |

---

## 状态一览（Done / In progress / Not started）

| 状态 | 内容 |
|------|------|
| ✅ Done | 选型文档、Mod 包结构、**Enhanced AI v0 INI**、Phobos QoL、安装/检测/校验脚本、`STATUS.md` |
| 🚧 In progress | 真机遭遇战 A/B（扩张 / 防空 / 骚扰）——需合法 YR 安装 |
| ⬜ Not started | 完整后期编制、CSF 语言包、联机认证、作弊型难度档 |

详情：[STATUS.md](STATUS.md) · [ROADMAP.md](ROADMAP.md)

---

## 和 OpenRA「红警」的区别（请先看）

| | OpenRA 官方 `ra` | 本项目 |
|--|------------------|--------|
| 游戏世代 | **红色警戒 1** | **红色警戒 2**（+ 尤里） |
| 引擎 | OpenRA（跨平台原生） | 原版 Westwood 引擎 + Ares/Phobos |
| 是否满足「红警2」需求 | ❌ | ✅ |

旧仓库 [openra-ra-enhanced](https://github.com/Renhuai123/openra-ra-enhanced) 是误走 RA1 路径的历史实验，请勿再当作红警2 产品宣传。

---

## 当前已交付（0.2 — Enhanced AI v0 配置）

1. **研究结论与选型文档** — `docs/research-brief.md`
2. **可合并的 AI v0 覆盖层** — `mod/ra2-enhanced/ai/`（三阵营 TeamTypes + AITriggerTypes + 难度档）
3. **Phobos QoL** — 扩展提示、矿车计数、电力差、建造预览
4. **一键 include 链** — `mod/ra2-enhanced/includes/`
5. **安装脚本** — Windows PowerShell + shell（`--wire-includes` / 检测 / 校验）

> AI v0 是 **真实 INI 配置**（不是空 stub），但 **尚未在本机 YR 上实机验证**（见 STATUS 中的 blocker）。

---

## 你需要自备什么

1. 合法取得的 **Red Alert 2 + Yuri's Revenge**（含 `gamemd.exe`）
2. 上游扩展（自行下载）：
   - [Ares](https://launchpad.net/ares)（含 Syringe）
   - [Phobos](https://github.com/Phobos-developers/Phobos/releases)（AI v0 脚本依赖）
   - 可选：[CnCNet YR Client](https://cncnet.org/)
3. Windows（推荐），或 Mac 上的 CrossOver/Wine

---

## 快速开始（约几分钟）

### Windows

```powershell
git clone https://github.com/Renhuai123/ra2-enhanced.git
cd ra2-enhanced
.\scripts\install-mod.ps1 -GameDir "D:\Games\YR" -WireIncludes
```

### Shell / Wine

```bash
git clone https://github.com/Renhuai123/ra2-enhanced.git
cd ra2-enhanced
./scripts/detect-game.sh          # 若本机已有 YR
./scripts/install-mod.sh --game-dir "$GAME_DIR" --wire-includes
./scripts/validate-mod.sh --game-dir "$GAME_DIR"
```

然后把 `Mods/ra2-enhanced/qol/ra2md-phobos.ini` 里的 `[Phobos]` 键合并进 `RA2MD.INI`，用 Syringe / CnCNet 启动。  
完整说明：[docs/install.md](docs/install.md)

---

## 仓库结构

```text
ra2-enhanced/
├── STATUS.md                 # 完成度诚实答案
├── README.md
├── docs/
├── mod/ra2-enhanced/         # Mod 覆盖层（无二进制）
│   ├── includes/             # 一行 #include 激活
│   ├── rules/
│   ├── ai/                   # Enhanced AI v0
│   └── qol/
└── scripts/
    ├── install-mod.ps1
    ├── install-mod.sh
    ├── detect-game.sh
    └── validate-mod.sh
```

---

## 许可证

**GNU GPL v3** — 见 [LICENSE](LICENSE)。法律与 IP 边界见 [NOTICE](NOTICE)。

## 致谢

- Westwood / EA — 原作（IP 归 EA）
- [Ares](https://launchpad.net/ares) / [Phobos](https://github.com/Phobos-developers/Phobos) / [Syringe](https://github.com/Ares-Developers/Syringe) 社区
- [CnCNet](https://cncnet.org/) 与广大 RA2/YR 模组作者
