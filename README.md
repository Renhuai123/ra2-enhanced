# RA2 Enhanced（红色警戒2 增强 Mod）

> **一句话**：面向老玩家的 **红色警戒2 / 尤里的复仇** 开源增强 Mod——更强电脑 AI、更清晰体验；**不是**商业独立红警，也**不是** OpenRA 红警1。

抖音上大家要找的是 **红警2**。本仓库就是这个方向的公开工程：  
**<https://github.com/Renhuai123/ra2-enhanced>**

技术选型说明（为何不用 OpenRA 官方 `ra`）：[docs/research-brief.md](docs/research-brief.md)  
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
| **仓库内容** | INI 规则 / AI 骨架 / QoL 说明 / 安装脚本 / 文档 |
| **许可证** | [GPL-3.0](LICENSE) + [NOTICE](NOTICE) |
| **主平台** | Windows（原生） |
| **Mac** | 非原生；可通过 Wine / CrossOver 运行，见 [docs/mac-notes.md](docs/mac-notes.md) |

---

## 和 OpenRA「红警」的区别（请先看）

| | OpenRA 官方 `ra` | 本项目 |
|--|------------------|--------|
| 游戏世代 | **红色警戒 1** | **红色警戒 2**（+ 尤里） |
| 引擎 | OpenRA（跨平台原生） | 原版 Westwood 引擎 + Ares/Phobos |
| 是否满足「红警2」需求 | ❌ | ✅ |

旧仓库 [openra-ra-enhanced](https://github.com/Renhuai123/openra-ra-enhanced) 是误走 RA1 路径的历史实验，请勿再当作红警2 产品宣传。

---

## 当前已交付（0.1 骨架）

1. **研究结论与选型文档** — `docs/research-brief.md`
2. **真实 RA2/YR Mod 骨架** — `mod/ra2-enhanced/`（`rulesmd` / `aimd` / QoL 覆盖层 stubs）
3. **安装脚本** — Windows PowerShell + 通用 shell（支持指向自有游戏目录）
4. **中文宣传口径** — `docs/ANNOUNCEMENT.md`（IP 归属、仅 Mod、开源、AI+体验）

下一里程碑见 [ROADMAP.md](ROADMAP.md)：在真实 YR 安装上落地第一版 Enhanced AI 难度与可开关 QoL。

---

## 你需要自备什么

1. 合法取得的 **Red Alert 2 + Yuri's Revenge** 游戏文件（含 `gamemd.exe` 所在目录）
2. 上游扩展（自行下载，勿从网盘乱下）：
   - [Ares](https://launchpad.net/ares)（含 Syringe）
   - [Phobos](https://github.com/Phobos-developers/Phobos/releases)
   - 可选：[CnCNet YR Client](https://cncnet.org/) / 兼容的 XNA 客户端模组底座
3. Windows 环境（推荐），或 Mac 上的 CrossOver/Wine（见 Mac 说明）

---

## 快速开始（Windows）

```powershell
git clone https://github.com/Renhuai123/ra2-enhanced.git
cd ra2-enhanced

# 将 YOUR_YR_DIR 换成你的尤里的复仇目录（含 gamemd.exe）
.\scripts\install-mod.ps1 -GameDir "D:\Games\YR"
```

脚本只会复制/链接 **本仓库的 INI 覆盖层**，不会下载游戏或 DLL。  
Ares/Phobos 请按 [docs/install.md](docs/install.md) 放到同一游戏目录后，用 Syringe / CnCNet 启动。

---

## macOS（简要）

没有官方原生 RA2。可行路径通常是：

1. 用 **CrossOver** 或 **Wine** 安装 Windows 版 RA2/YR  
2. 按 Windows 同样方式放入 Ares/Phobos 与本 Mod  
3. 常见需要 `cnc-ddraw` 一类兼容层才能流畅

详情与预期摩擦：[docs/mac-notes.md](docs/mac-notes.md)

---

## 仓库结构

```text
ra2-enhanced/
├── README.md
├── docs/
│   ├── research-brief.md     # 选型：为何是 RA2 + Ares/Phobos
│   ├── ANNOUNCEMENT.md       # 抖音/社区可转发公告
│   ├── install.md
│   └── mac-notes.md
├── mod/ra2-enhanced/         # Mod 覆盖层（无二进制）
│   ├── expandmd.ini
│   ├── rules/
│   ├── ai/
│   └── qol/
└── scripts/
    ├── install-mod.ps1
    └── install-mod.sh
```

---

## 路线图（摘要）

| 阶段 | 主题 |
|------|------|
| ✅ 纠偏 + 骨架 | 明确红警2；Ares/Phobos 工具链；文档与安装脚本 |
| 下一里程碑 | Enhanced AI v0：可感知的遭遇战压力（扩张/防空/多线骚扰），固定地图对照测试 |
| 随后 | QoL：Phobos 提示/热键/指示器默认集；可选难度档 |
| 研究轨 | 是否另开 OpenRA/ra2 实验轨（仅 Mac 沙盒，不进主宣传） |

---

## 许可证

**GNU GPL v3** — 见 [LICENSE](LICENSE)。法律与 IP 边界见 [NOTICE](NOTICE)。

## 致谢

- Westwood / EA — 原作（IP 归 EA）
- [Ares](https://launchpad.net/ares) / [Phobos](https://github.com/Phobos-developers/Phobos) / [Syringe](https://github.com/Ares-Developers/Syringe) 社区
- [CnCNet](https://cncnet.org/) 与广大 RA2/YR 模组作者
- 误用 OpenRA RA1 路径的纠正：感谢玩家指出需求是 **红警2**
