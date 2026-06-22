@echo off
REM ============================================
REM Hacker Terminal 完全清理工具
REM 警告：此工具会删除所有配置和数据！
REM ============================================

setlocal

echo ============================================
echo   Hacker Terminal 完全清理工具
echo ============================================
echo.
echo ⚠️  警告：此操作将删除以下内容：
echo   - 程序文件
echo   - 配置文件
echo   - 用户数据
echo   - 插件和技能
echo   - 注册表项
echo.
echo 此操作不可撤销！
echo.

set /p CONFIRM="确认要完全清理吗？(输入 YES 确认): "

if /i not "%CONFIRM%"=="YES" (
    echo.
    echo 已取消。
    goto :end
)

echo.
echo 正在清理...
echo.

REM 查找安装目录
set INSTALL_DIR=
for /f "tokens=2*" %%a in ('reg query "HKLM\Software\HackerTerminal" /v InstallPath 2^>nul') do set INSTALL_DIR=%%b

if "%INSTALL_DIR%"=="" (
    echo 未找到安装目录，尝试默认位置...
    set INSTALL_DIR=%PROGRAMFILES%\Hacker Terminal
)

echo 安装目录：%INSTALL_DIR%
echo.

REM 删除程序文件
if exist "%INSTALL_DIR%" (
    echo 删除程序文件...
    rmdir /s /q "%INSTALL_DIR%"
    echo ✅ 程序文件已删除
) else (
    echo ⚠️  程序目录不存在，跳过
)

REM 删除用户数据
set DATA_DIR=%APPDATA%\HackerTerminal
if exist "%DATA_DIR%" (
    echo 删除用户数据...
    rmdir /s /q "%DATA_DIR%"
    echo ✅ 用户数据已删除
) else (
    echo ⚠️  用户数据目录不存在，跳过
)

REM 删除快捷方式
echo 删除快捷方式...
if exist "%PUBLIC%\Desktop\Hacker Terminal.lnk" (
    del "%PUBLIC%\Desktop\Hacker Terminal.lnk"
)
if exist "%USERPROFILE%\Desktop\Hacker Terminal.lnk" (
    del "%USERPROFILE%\Desktop\Hacker Terminal.lnk"
)
if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Hacker Terminal" (
    rmdir /s /q "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Hacker Terminal"
)
echo ✅ 快捷方式已删除

REM 清理注册表
echo 清理注册表...
reg delete "HKLM\Software\HackerTerminal" /f 2>nul
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall\HackerTerminal" /f 2>nul
reg delete "HKCU\Software\HackerTerminal" /f 2>nul
echo ✅ 注册表已清理

REM 清理环境变量（可选，暂不自动清理）

echo.
echo ============================================
echo   清理完成！
echo ============================================
echo.
echo 建议重启电脑以确保所有清理生效。

:end
endlocal
pause
