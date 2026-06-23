# Hacker Install Wizard

> Installation wizard creation tool for Hacker Terminal — one-click generate professional installers

<div align="center">

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows-blue.svg)]()
[![Tool: NSIS](https://img.shields.io/badge/Tool-NSIS-green.svg)]()
[![Version: v1.0](https://img.shields.io/badge/Version-v1.0-orange.svg)]()

[English](README.en.md) | [中文](README.md)

</div>

---

## 📖 Introduction

Hacker Install Wizard is the official installer creation tool for [Hacker Terminal](https://github.com/4uYS/hacker-terminal-native), built on NSIS (Nullsoft Scriptable Install System). With just one command, you can generate professional Windows installers supporting full installation, portable version, silent installation, and more.

### Why Use the Install Wizard?

- 🚀 **One-Click Packaging**: Generate complete installers with one command
- ✨ **Professional UI**: Beautiful installation wizard interface
- 🎨 **Highly Customizable**: Customize interface, components, and features
- 📦 **Multiple Modes**: Full install, portable version, silent install
- 🔧 **Clean Uninstall**: Complete uninstall with no leftovers
- 🪪 **Signing Support**: Support for digital signatures to build trust

---

## ✨ Features

### Core Features

| Feature | Description |
|---------|-------------|
| **NSIS Scripts** | Professional installation scripts based on NSIS |
| **One-Click Build** | Auto-prepare files, compile, and output |
| **Component Selection** | Optional install: main program/plugins/skills |
| **Silent Install** | Support command-line silent installation |
| **Portable Version** | Generate green portable ZIP |
| **Multi-Arch** | Support both x86 and x64 architectures |
| **Uninstall Cleanup** | Complete uninstall, registry cleanup |
| **Custom UI** | Customizable installation interface and text |

### Installer Features

| Feature | Description | Status |
|---------|-------------|--------|
| Welcome Screen | Installation wizard welcome page | ✅ |
| License Agreement | Software license agreement display | ✅ |
| Directory Selection | Custom installation directory | ✅ |
| Component Selection | Optional installation components | ✅ |
| Shortcuts | Desktop/Start menu shortcuts | ✅ |
| File Association | Associate file types | ✅ |
| Environment Variables | Configure system environment variables | ✅ |
| Progress Display | Installation progress bar display | ✅ |
| Completion Screen | Installation completion prompt page | ✅ |
| Repair Install | Repair installed program | ✅ |
| Upgrade Install | Upgrade installation with config preserved | ✅ |
| Multi-Language | Multi-language installation interface | ⏳ |
| Digital Signature | Installer code signing | Optional |

---

## 📂 Directory Structure

```
hacker-install-wizard/
├── scripts/              # Installation scripts directory
│   ├── installer.nsi     # NSIS main installation script (full version)
│   ├── silent.nsi        # Silent installation config
│   ├── portable.nsi      # Portable version packaging script
│   ├── sections.nsh      # Component definition header
│   ├── functions.nsh     # Custom functions header
│   └── locales/          # Multi-language files
│       ├── english.nlf
│       └── simpchinese.nlf
├── tools/                # Tool scripts
│   ├── build-installer.bat    # One-click packaging script (main entry)
│   ├── prepare-files.bat      # Prepare installation files
│   ├── sign-installer.bat     # Installer signing tool
│   ├── build-portable.bat     # Generate portable version
│   └── build-all.bat          # Batch build all versions
├── uninstall/            # Uninstall tools
│   ├── uninstall.bat     # Uninstall script
│   └── clean-all.bat     # Complete cleanup tool
├── files/                # Installation source files (generated at runtime)
│   ├── bin/              # Main program
│   ├── plugins/          # Plugins
│   ├── skills/           # Skills
│   └── docs/             # Documentation
├── output/               # Output directory (generated at runtime)
│   ├── HackerTerminal-Setup.exe
│   ├── HackerTerminal-Portable.zip
│   └── ...
├── assets/               # Asset files
│   ├── installer.ico     # Installer icon
│   ├── uninstall.ico     # Uninstaller icon
│   ├── wizard.bmp        # Installation wizard bitmap
│   └── license.txt       # License agreement text
├── docs/                 # Documentation
│   ├── BUILD_GUIDE.md    # Build guide
│   ├── CUSTOMIZE.md      # Customization guide
│   └── SILENT_INSTALL.md # Silent install guide
├── README.md             # Chinese documentation
└── README.en.md          # English documentation
```

---

## 🚀 Quick Start

### Prerequisites

1. **Install NSIS** - Download and install [NSIS](https://nsis.sourceforge.io/) (Nullsoft Scriptable Install System)
2. **Prepare Build Output** - Compiled Hacker Terminal main program
3. **(Optional) Code Signing Cert** - For digitally signing the installer

### One-Click Packaging

```cmd
cd tools
build-installer.bat
```

The script automatically:
1. Prepares installation files (copies main program, plugins, skills, etc.)
2. Compiles NSIS installation script
3. Outputs installer to `output/` directory
4. Displays build results and file sizes

### Manual Packaging

1. Copy main program, plugins, skills to `files/` directory
2. Run NSIS to compile `scripts/installer.nsi`
3. Output installer to `output/` directory

### Generate Portable Version

```cmd
cd tools
build-portable.bat
```

Generates a green portable ZIP package that can be used without installation.

### Batch Build

```cmd
cd tools
build-all.bat
```

Build all versions at once:
- Full installer (x64)
- Full installer (x86)
- Portable version (ZIP)

---

## 📋 Installer Features Explained

### Installation Wizard

The installation wizard includes these pages:

| Page | Description |
|------|-------------|
| **Welcome** | Software introduction and welcome message |
| **License** | Displays MIT license agreement, must agree to continue |
| **Directory** | Choose installation directory, default `C:\Program Files\Hacker Terminal` |
| **Components** | Optional install: main program, official plugins, official skills, docs |
| **Start Menu** | Choose Start Menu folder name |
| **Additional Tasks** | Create desktop shortcuts, add to PATH, etc. |
| **Progress** | Shows installation progress and current operation |
| **Completion** | Installation complete prompt, option to run immediately |

### Uninstall Features

The uninstaller cleans up:

| Item | Description |
|------|-------------|
| Program Files | Delete all installed program files |
| Shortcuts | Remove desktop and Start menu shortcuts |
| Registry | Clean up registry entries |
| Environment Variables | Remove added environment variables |
| File Associations | Remove file associations |
| Config Files | Optionally delete user configuration files |

### Advanced Features

| Feature | Description |
|---------|-------------|
| **Silent Install** | Support `/S` parameter for headless installation |
| **Custom Directory** | Support `/D=path` to specify install directory |
| **Repair Install** | Repair broken installation |
| **Upgrade Install** | Version upgrade with user config preserved |
| **Multi-Language** | Support multi-language installation interface |
| **Digital Signature** | Support code signing the installer |

---

## 🔧 Tool Scripts Documentation

### build-installer.bat - One-Click Build

**Usage:**
```cmd
build-installer.bat [options]
```

**Features:**
1. Prepare installation files
2. Compile NSIS script
3. Output installer
4. Display build results

**Options:**
- `/x64` - Generate 64-bit version (default)
- `/x86` - Generate 32-bit version
- `/sign` - Sign the installer
- `/portable` - Also generate portable version

### prepare-files.bat - Prepare Files

**Usage:**
```cmd
prepare-files.bat [source_dir]
```

**Features:**
1. Copy main program to `files/bin/`
2. Copy official plugins to `files/plugins/`
3. Copy built-in skills to `files/skills/`
4. Copy docs and resources
5. Generate version info file

### build-portable.bat - Portable Build

**Usage:**
```cmd
build-portable.bat
```

**Features:**
1. Prepare portable version files
2. Create directory structure
3. Package as ZIP file
4. Output to `output/` directory

### sign-installer.bat - Installer Signing

**Usage:**
```cmd
sign-installer.bat <installer_path>
```

**Features:**
1. Sign with code signing certificate
2. Add timestamp
3. Verify signature result

### clean-all.bat - Complete Cleanup

**Usage:**
```cmd
clean-all.bat
```

**Features (optional during uninstall):**
1. Delete all program files
2. Delete config files
3. Delete user data
4. Clean up registry
5. Remove environment variables

---

## 📝 Customizing the Installer

### Modify Installation Interface

Edit the following in `scripts/installer.nsi`:

```nsis
; Installer name
Name "Hacker Terminal"

; Installer icon
Icon "assets\installer.ico"

; Welcome screen text
; Modify in .onInit function

; License agreement text
LicenseData "assets\license.txt"

; Completion screen links
; Modify in finish page function
```

### Add New Components

Add a new Section in the NSIS script:

```nsis
Section "My Component" SecMyComponent
  SectionIn RO  ; RO = required, remove for optional
  SetOutPath "$INSTDIR\my-component"
  File "files\my-component\*.*"
  
  ; Create shortcut
  CreateShortCut "$SMPROGRAMS\My Component.lnk" "$INSTDIR\my-component\app.exe"
SectionEnd
```

### Add Shortcuts

```nsis
; Desktop shortcut
CreateShortCut "$DESKTOP\Hacker Terminal.lnk" "$INSTDIR\hacker.exe"

; Start menu shortcut
CreateShortCut "$SMPROGRAMS\Hacker Terminal.lnk" "$INSTDIR\hacker.exe"

; Uninstall shortcut
CreateShortCut "$SMPROGRAMS\Uninstall.lnk" "$INSTDIR\uninstall.exe"
```

### Add Environment Variables

```nsis
; Add to PATH
Push "PATH"
Push "$INSTDIR\bin"
Call AddToPath
```

### Custom Finish Page

```nsis
Function FinishPage
  ; Add "Run now" checkbox
  ; Add "View docs" checkbox
  ; Add "Visit website" link
FunctionEnd
```

### Detailed Guides

Please refer to:
- [Build Guide](docs/BUILD_GUIDE.md) - Detailed build steps
- [Customization Guide](docs/CUSTOMIZE.md) - Installer customization tutorial
- [Silent Install Guide](docs/SILENT_INSTALL.md) - Silent installation parameters

---

## 📦 Output Files

| Filename | Description | Estimated Size |
|----------|-------------|----------------|
| `HackerTerminal-Setup.exe` | Full installer (64-bit) | ~5-10 MB |
| `HackerTerminal-Setup-x86.exe` | Full installer (32-bit) | ~5-10 MB |
| `HackerTerminal-Portable.zip` | Portable ZIP | ~5-10 MB |
| `HackerTerminal-Setup-signed.exe` | Signed installer | ~5-10 MB |

---

## ⚙️ Silent Installation Parameters

### Basic Usage

```cmd
:: Silent install (default directory)
HackerTerminal-Setup.exe /S

:: Specify installation directory
HackerTerminal-Setup.exe /S /D=C:\HackerTerminal

:: Silent uninstall
uninstall.exe /S
```

### Common Parameters

| Parameter | Description |
|-----------|-------------|
| `/S` | Silent mode, install/uninstall without UI |
| `/D=path` | Specify install directory (must be last parameter) |
| `/NCRC` | Skip CRC check |
| `/NOCANCEL` | Disable cancel during installation |
| `/NOREBOOT` | Disable reboot prompt |

### Component Selection (Advanced)

Select components via config file or command line:

```cmd
:: Install only main program and plugins
HackerTerminal-Setup.exe /S /components=main,plugins
```

---

## 🎯 Roadmap

### Completed ✅

- ✅ NSIS basic installation script
- ✅ One-click build tool
- ✅ Portable version generation
- ✅ Component selection install
- ✅ Complete uninstall functionality
- ✅ Silent installation support
- ✅ Environment variable configuration

### In Development ⏳

- ⏳ Multi-language support
- ⏳ Automatic installer signing
- ⏳ Incremental update support
- ⏳ Installation UI beautification

### Future Plans 🔮

- [ ] Auto-update functionality
- [ ] Online installer distribution
- [ ] Custom theme support
- [ ] Installation statistics
- [ ] Microsoft Store publishing support

---

## ❓ FAQ

### Q: What is NSIS? Why use it?

A: NSIS (Nullsoft Scriptable Install System) is an open-source Windows installer creation tool. It's small, powerful, and script-flexible, making it ideal for creating professional installers.

### Q: Do I need to install NSIS to use this?

A: Yes, to build installers you need the NSIS compiler. But end users don't need anything installed to use the generated installer.

### Q: Which Windows versions are supported?

A: Windows 7 and above, including Windows 7/8/10/11.

### Q: Can the installer be signed?

A: Yes. We provide a signing tool script; you just need to prepare a code signing certificate.

### Q: How do I add my own files to the installer?

A: Place files in the corresponding subdirectory under `files/`, then add the appropriate Section and File directives in the NSIS script.

### Q: Can I choose components during silent install?

A: Yes. You can specify which components to install via command line parameters or config files.

---

## 🤝 Contributing

Welcome to participate in improving Hacker Install Wizard!

### How to Contribute

1. **Improve Scripts** - Enhance NSIS scripts, add new features
2. **Optimize Tools** - Improve build tool scripts
3. **Translation** - Add more language support
4. **Improve Docs** - Enhance documentation, add examples
5. **Report Issues** - Submit bug reports or feature suggestions

### Contribution Guide

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📚 Documentation Resources

| Document | Description | Target Audience |
|----------|-------------|-----------------|
| [BUILD_GUIDE.md](docs/BUILD_GUIDE.md) | Build guide | Release/packaging personnel |
| [CUSTOMIZE.md](docs/CUSTOMIZE.md) | Customization guide | Developers who need custom installers |
| [SILENT_INSTALL.md](docs/SILENT_INSTALL.md) | Silent install guide | Batch deployment, automated ops |
| README.md | Project overview | All users |

---

## 📄 License

MIT License

---

## 🔗 Related Projects

- [Hacker Terminal](https://github.com/4uYS/hacker-terminal-native) - Terminal AI assistant main program
- [Hacker Plugin Market](https://github.com/4uYS/hacker-plugin-market) - Plugin market
- [Hacker Skill Lib](https://github.com/4uYS/hacker-skill-lib) - Skill resource library
- [HyperMark](https://github.com/4uYS/HyperMark) - Enhanced Markdown markup language

---

<div align="center">

**Made with ❤️ by Ai Zhe Teng Lab**

*Focused on creating interesting and practical tech projects*

</div>
