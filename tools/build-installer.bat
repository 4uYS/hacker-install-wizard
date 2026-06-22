@echo off
REM ============================================
REM Hacker Terminal 安装包一键打包脚本
REM 用法：build-installer.bat [版本号]
REM ============================================

setlocal

set VERSION=%1
if "%VERSION%"=="" set VERSION=2.1

set SCRIPT_DIR=%~dp0
set ROOT_DIR=%SCRIPT_DIR%..
set FILES_DIR=%ROOT_DIR%\files
set OUTPUT_DIR=%ROOT_DIR%\output
set NSIS_SCRIPT=%ROOT_DIR%\scripts\installer.nsi

echo ============================================
echo   Hacker Terminal 安装包打包工具
echo   版本：%VERSION%
echo ============================================
echo.

REM 检查 NSIS 是否安装
where makensis >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ 未找到 NSIS！
    echo 请先安装 NSIS：https://nsis.sourceforge.io/
    goto :error
)

echo ✅ NSIS 已找到
echo.

REM 检查文件目录
if not exist "%FILES_DIR%" (
    echo ❌ 未找到 files 目录！
    echo 请先将编译好的程序放到 files 目录下
    goto :error
)

if not exist "%FILES_DIR%\hacker.exe" (
    echo ⚠️  警告：未找到 hacker.exe
    echo 请确认主程序已编译完成
    echo.
)

echo ✅ 文件目录已找到
echo.

REM 创建输出目录
if not exist "%OUTPUT_DIR%" (
    mkdir "%OUTPUT_DIR%"
)

echo 正在编译安装脚本...
echo.

REM 编译 NSIS 脚本
cd /d "%ROOT_DIR%\scripts"
makensis /DVERSION=%VERSION% installer.nsi

if %errorlevel% neq 0 (
    echo.
    echo ❌ 编译失败！
    goto :error
)

echo.
echo ✅ 编译成功！
echo.

REM 移动输出文件
if exist "%ROOT_DIR%\scripts\HackerTerminal-Setup.exe" (
    move /y "%ROOT_DIR%\scripts\HackerTerminal-Setup.exe" "%OUTPUT_DIR%\HackerTerminal-Setup-%VERSION%-x64.exe" >nul
)

echo 安装包已生成：
echo.
dir /b "%OUTPUT_DIR%\*.exe" 2>nul
echo.

echo ============================================
echo   打包完成！
echo   输出目录：%OUTPUT_DIR%
echo ============================================

goto :end

:error
echo.
echo ============================================
echo   打包失败！
echo ============================================

:end
endlocal
pause
