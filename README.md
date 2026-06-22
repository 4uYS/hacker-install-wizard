# Hacker Install Wizard


[中文](README.md) | [English](README.en.md)

Hacker Terminal 安装向导制作工具 —— 一键生成专业安装包

---

## 📦 仓库说明

本仓库是 [Hacker Terminal](https://github.com/4uYS/hacker-terminal-native) 的安装包制作工具，包含：

- ✅ NSIS 安装脚本模板
- ✅ 一键打包主程序+插件+技能
- ✅ 静默安装支持
- ✅ 卸载清理工具
- ✅ 多架构安装包制作
- ✅ 安装向导自定义界面

---

## 📂 目录结构

```
hacker-install-wizard/
├── scripts/              # 安装脚本
│   ├── installer.nsi     # NSIS 主安装脚本
│   ├── silent.nsi        # 静默安装配置
│   └── portable.nsi      # 便携版打包脚本
├── tools/                # 工具脚本
│   ├── build-installer.bat   # 一键打包脚本
│   ├── prepare-files.bat     # 准备安装文件
│   └── sign-installer.bat    # 安装包签名工具
├── uninstall/            # 卸载工具
│   ├── uninstall.bat     # 卸载脚本
│   └── clean-all.bat     # 完全清理工具
├── docs/                 # 文档
│   ├── BUILD_GUIDE.md    # 构建指南
│   └── CUSTOMIZE.md      # 自定义指南
└── README.md
```

---

## 🚀 快速开始

### 前置要求

1. 安装 [NSIS](https://nsis.sourceforge.io/)（Nullsoft Scriptable Install System）
2. 准备好 Hacker Terminal 编译产物
3. （可选）代码签名证书

### 一键打包

```bash
cd tools
build-installer.bat
```

### 手动打包

1. 将主程序、插件、技能复制到 `files/` 目录
2. 运行 NSIS 编译脚本
3. 输出安装包到 `output/` 目录

---

## 📋 安装包功能

### 安装向导
- ✅ 欢迎界面
- ✅ 许可协议
- ✅ 安装目录选择
- ✅ 组件选择（主程序/插件/技能）
- ✅ 快捷方式创建
- ✅ 开始菜单条目
- ✅ 文件关联
- ✅ 环境变量配置
- ✅ 安装进度显示
- ✅ 完成界面

### 卸载功能
- ✅ 完全卸载程序文件
- ✅ 清理配置文件（可选）
- ✅ 移除快捷方式
- ✅ 清理注册表
- ✅ 移除环境变量
- ✅ 卸载反馈

### 高级功能
- ✅ 静默安装（`/S` 参数）
- ✅ 指定安装目录（`/D=路径`）
- ✅ 修复安装
- ✅ 升级安装（保留配置）
- ✅ 多语言支持
- ✅ 安装包数字签名

---

## 🔧 工具说明

### build-installer.bat
一键打包脚本，自动完成：
1. 准备安装文件
2. 编译 NSIS 脚本
3. 输出安装包
4. 显示打包结果

### prepare-files.bat
准备安装文件，自动：
1. 复制主程序
2. 复制官方插件
3. 复制内置技能
4. 复制文档和资源
5. 生成版本信息

### clean-all.bat
完全清理工具，卸载时可选：
1. 删除所有程序文件
2. 删除配置文件
3. 删除用户数据
4. 清理注册表
5. 移除环境变量

---

## 📝 自定义安装包

### 修改安装界面
编辑 `scripts/installer.nsi` 中的：
- 安装程序名称
- 安装程序图标
- 欢迎界面文字
- 许可协议文本
- 完成界面链接

### 添加组件
在 NSIS 脚本中添加新的 Section：
```nsis
Section "我的组件" SecMyComponent
  SetOutPath "$INSTDIR\my-component"
  File "files\my-component\*.*"
SectionEnd
```

### 添加快捷方式
```nsis
CreateShortcut "$DESKTOP\Hacker Terminal.lnk" "$INSTDIR\hacker.exe"
```

详细说明请查看 [docs/CUSTOMIZE.md](docs/CUSTOMIZE.md)

---

## 📦 输出文件

| 文件 | 说明 |
|------|------|
| `HackerTerminal-Setup.exe` | 完整安装包 |
| `HackerTerminal-Portable.zip` | 便携版 |
| `HackerTerminal-Setup-x64.exe` | 64位安装包 |
| `HackerTerminal-Setup-x86.exe` | 32位安装包 |

---

## ⚙️ 静默安装参数

```bash
# 静默安装
HackerTerminal-Setup.exe /S

# 指定安装目录
HackerTerminal-Setup.exe /S /D=C:\HackerTerminal

# 静默卸载
uninstall.exe /S
```

---

## 📄 许可证

MIT License

---

**Hacker Install Wizard** · 爱折腾AI实验室（AI Agent Lab, AAL）
