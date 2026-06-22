; ============================================
; Hacker Terminal 安装脚本 (NSIS)
; 版本：v2.1
; ============================================

; 安装程序基本信息
Name "Hacker Terminal"
OutFile "HackerTerminal-Setup.exe"
InstallDir "$PROGRAMFILES\Hacker Terminal"
InstallDirRegKey HKLM "Software\HackerTerminal" "InstallPath"
RequestExecutionLevel admin

; 界面设置
!define MUI_ABORTWARNING
!define MUI_ICON "..\resources\icon.ico"
!define MUI_UNICON "..\resources\icon.ico"

; 欢迎页面
!insertmacro MUI_PAGE_WELCOME

; 许可协议页面
!insertmacro MUI_PAGE_LICENSE "..\docs\LICENSE.txt"

; 组件选择页面
!insertmacro MUI_PAGE_COMPONENTS

; 安装目录选择页面
!insertmacro MUI_PAGE_DIRECTORY

; 安装进度页面
!insertmacro MUI_PAGE_INSTFILES

; 完成页面
!define MUI_FINISHPAGE_RUN "$INSTDIR\hacker.exe"
!define MUI_FINISHPAGE_RUN_TEXT "启动 Hacker Terminal"
!insertmacro MUI_PAGE_FINISH

; 卸载页面
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; 语言
!insertmacro MUI_LANGUAGE "SimpChinese"
!insertmacro MUI_LANGUAGE "English"

; ============================================
; 安装区段
; ============================================

Section "主程序" SecMain
  SectionIn RO
  
  SetOutPath "$INSTDIR"
  
  ; 主程序
  File "..\files\hacker.exe"
  
  ; 配置文件目录
  CreateDirectory "$INSTDIR\config"
  
  ; 创建开始菜单快捷方式
  CreateDirectory "$SMPROGRAMS\Hacker Terminal"
  CreateShortcut "$SMPROGRAMS\Hacker Terminal\Hacker Terminal.lnk" "$INSTDIR\hacker.exe"
  CreateShortcut "$SMPROGRAMS\Hacker Terminal\卸载.lnk" "$INSTDIR\uninstall.exe"
  
  ; 创建桌面快捷方式
  CreateShortcut "$DESKTOP\Hacker Terminal.lnk" "$INSTDIR\hacker.exe"
  
  ; 写入注册表
  WriteRegStr HKLM "Software\HackerTerminal" "InstallPath" "$INSTDIR"
  WriteRegStr HKLM "Software\HackerTerminal" "Version" "2.1"
  
  ; 注册卸载程序
  WriteUninstaller "$INSTDIR\uninstall.exe"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\HackerTerminal" "DisplayName" "Hacker Terminal"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\HackerTerminal" "UninstallString" "$INSTDIR\uninstall.exe"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\HackerTerminal" "DisplayVersion" "2.1"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\HackerTerminal" "Publisher" "爱折腾实验室"
  
SectionEnd

Section "官方插件" SecPlugins
  SetOutPath "$INSTDIR\plugins\official"
  File /r "..\files\plugins\official\*.*"
SectionEnd

Section "内置技能" SecSkills
  SetOutPath "$INSTDIR\skills"
  File /r "..\files\skills\*.*"
SectionEnd

Section "用户插件模板" SecUserPlugins
  SetOutPath "$INSTDIR\plugins\user"
  File /r "..\files\plugins\user\*.*"
SectionEnd

Section "文档" SecDocs
  SetOutPath "$INSTDIR\docs"
  File "..\files\README.md"
  File "..\files\docs\*.*"
SectionEnd

; ============================================
; 区段描述
; ============================================

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  !insertmacro MUI_DESCRIPTION_TEXT ${SecMain} "Hacker Terminal 主程序，核心功能"
  !insertmacro MUI_DESCRIPTION_TEXT ${SecPlugins} "官方认证插件，扩展终端能力"
  !insertmacro MUI_DESCRIPTION_TEXT ${SecSkills} "内置技能文档，AI 可读取使用"
  !insertmacro MUI_DESCRIPTION_TEXT ${SecUserPlugins} "用户插件开发模板"
  !insertmacro MUI_DESCRIPTION_TEXT ${SecDocs} "使用说明和开发文档"
!insertmacro MUI_FUNCTION_DESCRIPTION_END

; ============================================
; 卸载区段
; ============================================

Section "Uninstall"
  
  ; 删除快捷方式
  Delete "$SMPROGRAMS\Hacker Terminal\Hacker Terminal.lnk"
  Delete "$SMPROGRAMS\Hacker Terminal\卸载.lnk"
  RMDir "$SMPROGRAMS\Hacker Terminal"
  Delete "$DESKTOP\Hacker Terminal.lnk"
  
  ; 删除程序文件
  Delete "$INSTDIR\hacker.exe"
  Delete "$INSTDIR\uninstall.exe"
  RMDir /r "$INSTDIR\plugins"
  RMDir /r "$INSTDIR\skills"
  RMDir /r "$INSTDIR\docs"
  RMDir /r "$INSTDIR\config"
  
  ; 删除注册表
  DeleteRegKey HKLM "Software\HackerTerminal"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\HackerTerminal"
  
  ; 删除安装目录（如果为空）
  RMDir "$INSTDIR"
  
SectionEnd

; ============================================
; 函数
; ============================================

Function .onInit
  ; 检测是否已安装
  ReadRegStr $0 HKLM "Software\HackerTerminal" "InstallPath"
  IfFileExists "$0\hacker.exe" 0 +2
    MessageBox MB_YESNOCANCEL "检测到已安装 Hacker Terminal，是否覆盖安装？$\n$\n是：覆盖安装（保留配置）$\n否：选择其他目录$\n取消：退出安装" IDYES +2 IDNO +3 IDCANCEL cancel
    Goto done
    StrCpy $INSTDIR $0
    Goto done
  cancel:
    Abort
  done:
FunctionEnd

Function un.onUninstSuccess
  MessageBox MB_ICONINFORMATION|MB_OK "Hacker Terminal 已成功卸载。"
FunctionEnd
