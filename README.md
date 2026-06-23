# Hacker Install Wizard

> Hacker Terminal 安装向导制作工具 —— 一键生成专业安装包

<div align="center">

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows-blue.svg)]()
[![Tool: NSIS](https://img.shields.io/badge/Tool-NSIS-green.svg)]()
[![Version: v1.0](https://img.shields.io/badge/Version-v1.0-orange.svg)]()

[中文](README.md) | [English](README.en.md)

</div>

---

## 📖 项目简介

Hacker Install Wizard 是 [Hacker Terminal](https://github.com/4uYS/hacker-terminal-native) 的官方安装包制作工具，基于 NSIS (Nullsoft Scriptable Install System) 构建。只需一条命令，即可生成专业的 Windows 安装包，支持完整安装、便携版、静默安装等多种模式。

### 为什么使用安装向导？

- 🚀 **一键打包**：一条命令生成完整安装包
- ✨ **专业界面**：美观的安装向导界面
- 🎨 **高度可定制**：界面、组件、功能均可自定义
- 📦 **多种模式**：完整安装、便携版、静默安装
- 🔧 **卸载干净**：完整卸载，不留残留
- 🪪 **签名支持**：支持数字签名，提升信任度

---

## ✨ 特性

### 核心特性

| 特性 | 说明 |
|------|------|
| **NSIS 脚本** | 基于 NSIS 的专业安装脚本 |
| **一键打包** | 自动准备文件、编译、输出 |
| **组件选择** | 可选安装主程序/插件/技能 |
| **静默安装** | 支持命令行静默安装 |
| **便携版** | 生成绿色便携版 ZIP |
| **多架构** | 支持 x86/x64 双架构 |
| **卸载清理** | 完整卸载，清理注册表 |
| **自定义界面** | 可定制安装界面和文案 |

### 安装包功能

| 功能 | 说明 | 状态 |
|------|------|------|
| 欢迎界面 | 安装向导欢迎页 | ✅ |
| 许可协议 | 软件许可协议展示 | ✅ |
| 目录选择 | 自定义安装目录 | ✅ |
| 组件选择 | 可选安装组件 | ✅ |
| 快捷方式 | 桌面/开始菜单快捷方式 | ✅ |
| 文件关联 | 关联文件类型 | ✅ |
| 环境变量 | 配置系统环境变量 | ✅ |
| 进度显示 | 安装进度条显示 | ✅ |
| 完成界面 | 安装完成提示页 | ✅ |
| 修复安装 | 修复已安装的程序 | ✅ |
| 升级安装 | 保留配置的升级安装 | ✅ |
| 多语言 | 多语言安装界面 | ⏳ |
| 数字签名 | 安装包代码签名 | 可选 |

---

## 📂 目录结构

```
hacker-install-wizard/
├── scripts/              # 安装脚本目录
│   ├── installer.nsi     # NSIS 主安装脚本（完整版）
│   ├── silent.nsi        # 静默安装配置
│   ├── portable.nsi      # 便携版打包脚本
│   ├── sections.nsh      # 组件定义头文件
│   ├── functions.nsh     # 自定义函数头文件
│   └── locales/          # 多语言文件
│       ├── english.nlf
│       └── simpchinese.nlf
├── tools/                # 工具脚本
│   ├── build-installer.bat    # 一键打包脚本（主入口）
│   ├── prepare-files.bat      # 准备安装文件
│   ├── sign-installer.bat     # 安装包签名工具
│   ├── build-portable.bat     # 生成便携版
│   └── build-all.bat          # 批量打包所有版本
├── uninstall/            # 卸载工具
│   ├── uninstall.bat     # 卸载脚本
│   └── clean-all.bat     # 完全清理工具
├── files/                # 安装源文件目录（运行时生成）
│   ├── bin/              # 主程序
│   ├── plugins/          # 插件
│   ├── skills/           # 技能
│   └── docs/             # 文档
├── output/               # 输出目录（运行时生成）
│   ├── HackerTerminal-Setup.exe
│   ├── HackerTerminal-Portable.zip
│   └── ...
├── assets/               # 资源文件
│   ├── installer.ico     # 安装程序图标
│   ├── uninstall.ico     # 卸载程序图标
│   ├── wizard.bmp        # 安装向导位图
│   └── license.txt       # 许可协议文本
├── docs/                 # 文档
│   ├── BUILD_GUIDE.md    # 构建指南
│   ├── CUSTOMIZE.md      # 自定义指南
│   └── SILENT_INSTALL.md # 静默安装指南
├── README.md             # 中文说明文档
└── README.en.md          # 英文说明文档
```

---

## 🚀 快速开始

### 前置要求

1. **安装 NSIS** - 下载并安装 [NSIS](https://nsis.sourceforge.io/) (Nullsoft Scriptable Install System)
2. **准备编译产物** - 编译好的 Hacker Terminal 主程序
3. **（可选）代码签名证书** - 用于对安装包进行数字签名

### 一键打包

```cmd
cd tools
build-installer.bat
```

脚本会自动完成：
1. 准备安装文件（复制主程序、插件、技能等）
2. 编译 NSIS 安装脚本
3. 输出安装包到 `output/` 目录
4. 显示打包结果和文件大小

### 手动打包

1. 将主程序、插件、技能复制到 `files/` 目录
2. 运行 NSIS 编译 `scripts/installer.nsi`
3. 输出安装包到 `output/` 目录

### 生成便携版

```cmd
cd tools
build-portable.bat
```

生成绿色便携版 ZIP 包，无需安装即可使用。

### 批量打包

```cmd
cd tools
build-all.bat
```

一次性打包所有版本：
- 完整安装版 (x64)
- 完整安装版 (x86)
- 便携版 (ZIP)

---

## 📋 安装包功能详解

### 安装向导

安装向导包含以下页面：

| 页面 | 说明 |
|------|------|
| **欢迎页** | 软件介绍和欢迎信息 |
| **许可协议** | 展示 MIT 许可协议，需同意才能继续 |
| **目录选择** | 选择安装目录，默认 `C:\Program Files\Hacker Terminal` |
| **组件选择** | 可选安装：主程序、官方插件、官方技能、文档 |
| **开始菜单** | 选择开始菜单文件夹名称 |
| **附加任务** | 创建桌面快捷方式、添加到环境变量等 |
| **安装进度** | 显示安装进度和当前操作 |
| **完成页** | 安装完成提示，可选择立即运行 |

### 卸载功能

卸载程序会清理：

| 项目 | 说明 |
|------|------|
| 程序文件 | 删除所有安装的程序文件 |
| 快捷方式 | 删除桌面和开始菜单快捷方式 |
| 注册表 | 清理注册表项 |
| 环境变量 | 移除添加的环境变量 |
| 文件关联 | 取消文件关联 |
| 配置文件 | 可选删除用户配置文件 |

### 高级功能

| 功能 | 说明 |
|------|------|
| **静默安装** | 支持 `/S` 参数进行无界面安装 |
| **指定目录** | 支持 `/D=路径` 指定安装目录 |
| **修复安装** | 修复损坏的安装 |
| **升级安装** | 保留用户配置的版本升级 |
| **多语言** | 支持多语言安装界面 |
| **数字签名** | 支持对安装包进行代码签名 |

---

## 🔧 工具脚本说明

### build-installer.bat - 一键打包

**用法：**
```cmd
build-installer.bat [选项]
```

**功能：**
1. 准备安装文件
2. 编译 NSIS 脚本
3. 输出安装包
4. 显示打包结果

**选项：**
- `/x64` - 生成 64 位版本（默认）
- `/x86` - 生成 32 位版本
- `/sign` - 对安装包进行签名
- `/portable` - 同时生成便携版

### prepare-files.bat - 准备文件

**用法：**
```cmd
prepare-files.bat [源目录]
```

**功能：**
1. 复制主程序到 `files/bin/`
2. 复制官方插件到 `files/plugins/`
3. 复制内置技能到 `files/skills/`
4. 复制文档和资源
5. 生成版本信息文件

### build-portable.bat - 便携版打包

**用法：**
```cmd
build-portable.bat
```

**功能：**
1. 准备便携版文件
2. 创建目录结构
3. 打包为 ZIP 文件
4. 输出到 `output/` 目录

### sign-installer.bat - 安装包签名

**用法：**
```cmd
sign-installer.bat <安装包路径>
```

**功能：**
1. 使用代码签名证书签名
2. 添加时间戳
3. 验证签名结果

### clean-all.bat - 完全清理

**用法：**
```cmd
clean-all.bat
```

**功能（卸载时可选）：**
1. 删除所有程序文件
2. 删除配置文件
3. 删除用户数据
4. 清理注册表
5. 移除环境变量

---

## 📝 自定义安装包

### 修改安装界面

编辑 `scripts/installer.nsi` 中的以下内容：

```nsis
; 安装程序名称
Name "Hacker Terminal"

; 安装程序图标
Icon "assets\installer.ico"

; 欢迎界面文字
; 在 .onInit 函数中修改

; 许可协议文本
LicenseData "assets\license.txt"

; 完成界面链接
; 在完成页面函数中修改
```

### 添加新组件

在 NSIS 脚本中添加新的 Section：

```nsis
Section "我的组件" SecMyComponent
  SectionIn RO  ; RO = 必选，可选 = 去掉
  SetOutPath "$INSTDIR\my-component"
  File "files\my-component\*.*"
  
  ; 创建快捷方式
  CreateShortCut "$SMPROGRAMS\My Component.lnk" "$INSTDIR\my-component\app.exe"
SectionEnd
```

### 添加快捷方式

```nsis
; 桌面快捷方式
CreateShortCut "$DESKTOP\Hacker Terminal.lnk" "$INSTDIR\hacker.exe"

; 开始菜单快捷方式
CreateShortCut "$SMPROGRAMS\Hacker Terminal.lnk" "$INSTDIR\hacker.exe"

; 卸载快捷方式
CreateShortCut "$SMPROGRAMS\Uninstall.lnk" "$INSTDIR\uninstall.exe"
```

### 添加环境变量

```nsis
; 添加到 PATH
Push "PATH"
Push "$INSTDIR\bin"
Call AddToPath
```

### 自定义完成页面

```nsis
Function FinishPage
  ; 添加"立即运行"复选框
  ; 添加"查看文档"复选框
  ; 添加"访问官网"链接
FunctionEnd
```

### 详细指南

请参考以下文档：
- [构建指南](docs/BUILD_GUIDE.md) - 详细的构建步骤
- [自定义指南](docs/CUSTOMIZE.md) - 安装包自定义教程
- [静默安装指南](docs/SILENT_INSTALL.md) - 静默安装参数说明

---

## 📦 输出文件

| 文件名 | 说明 | 大小预估 |
|--------|------|---------|
| `HackerTerminal-Setup.exe` | 完整安装包（64位） | ~5-10 MB |
| `HackerTerminal-Setup-x86.exe` | 完整安装包（32位） | ~5-10 MB |
| `HackerTerminal-Portable.zip` | 便携版 ZIP | ~5-10 MB |
| `HackerTerminal-Setup-signed.exe` | 签名版安装包 | ~5-10 MB |

---

## ⚙️ 静默安装参数

### 基本用法

```cmd
:: 静默安装（默认目录）
HackerTerminal-Setup.exe /S

:: 指定安装目录
HackerTerminal-Setup.exe /S /D=C:\HackerTerminal

:: 静默卸载
uninstall.exe /S
```

### 常用参数

| 参数 | 说明 |
|------|------|
| `/S` | 静默模式，无界面安装/卸载 |
| `/D=路径` | 指定安装目录（必须是最后一个参数） |
| `/NCRC` | 跳过 CRC 校验 |
| `/NOCANCEL` | 禁止取消安装 |
| `/NOREBOOT` | 禁止重启提示 |

### 组件选择（高级）

通过配置文件或命令行参数选择安装组件：

```cmd
:: 只安装主程序和插件
HackerTerminal-Setup.exe /S /components=main,plugins
```

---

## 🎯 路线图

### 已完成 ✅

- ✅ NSIS 基础安装脚本
- ✅ 一键打包工具
- ✅ 便携版生成
- ✅ 组件选择安装
- ✅ 完整卸载功能
- ✅ 静默安装支持
- ✅ 环境变量配置

### 开发中 ⏳

- ⏳ 多语言支持
- ⏳ 安装包自动签名
- ⏳ 增量更新支持
- ⏳ 安装界面美化

### 未来计划 🔮

- [ ] 自动更新功能
- [ ] 安装包在线分发
- [ ] 自定义主题支持
- [ ] 安装统计功能
- [ ] 微软商店发布支持

---

## ❓ 常见问题

### Q: NSIS 是什么？为什么用它？

A: NSIS (Nullsoft Scriptable Install System) 是一个开源的 Windows 安装程序制作工具，体积小、功能强、脚本灵活，非常适合制作专业的安装包。

### Q: 必须安装 NSIS 才能使用吗？

A: 是的。制作安装包需要 NSIS 编译器。但用户使用安装包时不需要安装任何东西。

### Q: 支持哪些 Windows 版本？

A: 支持 Windows 7 及以上版本，包括 Windows 7/8/10/11。

### Q: 安装包可以签名吗？

A: 可以。我们提供了签名工具脚本，你只需要准备好代码签名证书即可。

### Q: 如何添加自己的文件到安装包？

A: 将文件放到 `files/` 目录对应的子目录中，然后在 NSIS 脚本中添加对应的 Section 和 File 指令。

### Q: 静默安装时可以选择组件吗？

A: 可以。通过命令行参数或配置文件可以指定要安装的组件。

---

## 🤝 贡献

欢迎参与 Hacker Install Wizard 的改进！

### 贡献方式

1. **完善脚本** - 改进 NSIS 脚本，添加新功能
2. **优化工具** - 改进打包工具脚本
3. **翻译贡献** - 添加更多语言支持
4. **文档改进** - 完善文档，添加示例
5. **反馈问题** - 提交 Bug 报告或功能建议

### 贡献指南

1. Fork 本仓库
2. 创建你的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交你的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

---

## 📚 文档资源

| 文档 | 说明 | 适合人群 |
|------|------|---------|
| [BUILD_GUIDE.md](docs/BUILD_GUIDE.md) | 构建指南 | 打包发布人员 |
| [CUSTOMIZE.md](docs/CUSTOMIZE.md) | 自定义指南 | 需要定制安装包的开发者 |
| [SILENT_INSTALL.md](docs/SILENT_INSTALL.md) | 静默安装指南 | 批量部署、自动化运维 |
| README.md | 项目说明 | 所有用户 |

---

## 📄 许可证

MIT License

---

## 🔗 相关项目

- [Hacker Terminal](https://github.com/4uYS/hacker-terminal-native) - 终端 AI 助手主程序
- [Hacker Plugin Market](https://github.com/4uYS/hacker-plugin-market) - 插件市场
- [Hacker Skill Lib](https://github.com/4uYS/hacker-skill-lib) - 技能资源库
- [HyperMark](https://github.com/4uYS/HyperMark) - 增强版 Markdown 标记语言

---

<div align="center">

**Made with ❤️ by 爱折腾的实验室**

*专注于创造有趣且实用的技术项目*

</div>
