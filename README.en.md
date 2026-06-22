# Hacker Install Wizard

Installation wizard creation tool for Hacker Terminal — one-click generate professional installers

[中文](README.md) | English

---

## 📦 About

This repository is the installer creation tool for [Hacker Terminal](https://github.com/4uYS/hacker-terminal-native), including:

- ✅ NSIS installation script templates
- ✅ One-click packaging of main program + plugins + skills
- ✅ Silent installation support
- ✅ Uninstall cleanup tool
- ✅ Multi-architecture installer creation
- ✅ Custom installer wizard interface

---

## 📂 Directory Structure

```
hacker-install-wizard/
├── scripts/              # Installation scripts
│   ├── installer.nsi     # NSIS main installation script
│   ├── silent.nsi        # Silent installation config
│   └── portable.nsi      # Portable version packaging script
├── tools/                # Tool scripts
│   ├── build-installer.bat   # One-click packaging script
│   ├── prepare-files.bat     # Prepare installation files
│   └── sign-installer.bat    # Installer signing tool
├── uninstall/            # Uninstall tools
│   ├── uninstall.bat     # Uninstall script
│   └── clean-all.bat     # Complete cleanup tool
├── docs/                 # Documentation
│   ├── BUILD_GUIDE.md    # Build guide
│   └── CUSTOMIZE.md      # Customization guide
└── README.md
```

---

## 🚀 Quick Start

### Prerequisites

1. Install [NSIS](https://nsis.sourceforge.io/) (Nullsoft Scriptable Install System)
2. Prepare Hacker Terminal compilation output
3. (Optional) Code signing certificate

### One-click Packaging

```bash
cd tools
build-installer.bat
```

### Manual Packaging

1. Copy main program, plugins, skills to `files/` directory
2. Run NSIS compilation script
3. Output installer to `output/` directory

---

## 📋 Installer Features

### Installation Wizard
- ✅ Welcome screen
- ✅ License agreement
- ✅ Installation directory selection
- ✅ Component selection (main program/plugins/skills)
- ✅ Shortcut creation
- ✅ Start menu entries
- ✅ File association
- ✅ Environment variable configuration
- ✅ Installation progress display
- ✅ Completion screen

### Uninstall Features
- ✅ Complete program removal
- ✅ Plugin and skill cleanup
- ✅ Configuration file cleanup
- ✅ Registry cleanup
- ✅ Shortcut removal
- ✅ Environment variable restoration

---

## 🎯 Installation Types

### Standard Installation
- Full feature installation
- Start menu shortcuts
- Desktop shortcuts
- Environment variable configuration

### Silent Installation
- No user interaction required
- Suitable for batch deployment
- Command line parameter control

### Portable Version
- No installation required
- Run directly from USB drive
- All data stored in program directory

---

## 🛠️ Customization

### Custom Branding
- Modify installer title and icon
- Custom welcome and completion screens
- Add company information and links

### Custom Components
- Add/remove installation components
- Custom component descriptions
- Component dependency management

### Custom Scripts
- Pre-installation scripts
- Post-installation scripts
- Uninstall scripts

---

## 📚 Documentation

- [Build Guide](docs/BUILD_GUIDE.md) - How to build installers
- [Customization Guide](docs/CUSTOMIZE.md) - How to customize installers

---

## 🤝 Contributing

Welcome to contribute code, report issues, or suggest improvements!

### How to Contribute

1. **Submit Issues**: Report bugs, suggest new features
2. **Submit Pull Requests**: Fix bugs, implement new features
3. **Improve Docs**: Improve documentation, add examples
4. **Share Ideas**: Share your installer customization ideas

---

## 📄 License

MIT License

---

## 👥 About

**AI Agent Lab (AAL) / 爱折腾AI实验室**

We are a group of developers who love technology and enjoy tinkering, dedicated to creating interesting and practical tools and projects with AI technology.

- 🌐 Explore cutting-edge technology
- 🛠️ Build practical tools
- 📚 Share technical experience

---

**Made with ❤️ by AI Agent Lab (AAL) / 爱折腾AI实验室**
