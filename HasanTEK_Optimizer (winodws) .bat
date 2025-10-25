@echo off
:: Hasan TEK - Cross-Platform System Optimizer (Windows Version)
:: Built by Jihan | Cybersecurity Student @ Asia Pacific University (APU)
:: For portfolio demonstration and personal use

title Hasan TEK - System Optimizer
color 0A
cls

echo ====================================
echo       Welcome to Hasan TEK
echo    Cross-Platform System Optimizer
echo ====================================
echo.

echo Select your system:
echo 1. Windows Optimization
echo 2. Linux Optimization (placeholder - runs on Linux only)
echo 3. Exit
echo.
set /p choice=Choose an option [1-3]: 

if "%choice%"=="1" goto WINDOWS_OPT
if "%choice%"=="2" goto LINUX_INFO
if "%choice%"=="3" exit
goto :EOF

:WINDOWS_OPT
cls
echo [+] Starting Windows Optimization...
echo ===================================
timeout /t 1 /nobreak >nul

echo [1/5] Counting running processes...
for /f %%i in ('tasklist ^| find /c /v ""') do set proc_count=%%i
set /a proc_count=%proc_count%-1
echo     ^> Total processes: %proc_count%
echo.

echo [2/5] Checking Temp folder size...
set "TEMP_PATH=%TEMP%"
if not exist "%TEMP_PATH%\" (
    echo     ^> Temp folder not found.
) else (
    for /f "usebackq tokens=3" %%a in (`dir "%TEMP_PATH%" /s /a /-c 2^>nul ^| find "File(s)"`) do set "TEMP_SIZE=%%a"
    if defined TEMP_SIZE (
        echo     ^> Temp folder size: %TEMP_SIZE%
    ) else (
        echo     ^> Temp folder is empty or inaccessible.
    )
)
echo.

echo [3/5] Cleaning Temp files...
del /q /f "%TEMP_PATH%\*" >nul 2>&1
rd /s /q "%TEMP_PATH%" >nul 2>&1
md "%TEMP_PATH%" >nul 2>&1
echo     ^> Temp files cleaned successfully.
echo.

echo [4/5] Emptying Recycle Bin...
powershell.exe -command "Clear-RecycleBin -Force -ErrorAction SilentlyContinue" >nul 2>&1
echo     ^> Recycle Bin emptied.
echo.

echo [5/5] Optimizing visual effects for performance...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
echo     ^> Visual effects set to 'Best Performance'.
echo.

echo ===================================
echo [✓] Windows Optimization Complete!
echo ===================================
pause
goto :EOF

:LINUX_INFO
cls
echo [!] Linux Optimization Notice
echo ===================================
echo This script is running on Windows.
echo The Linux version (HasanTEK_Optimizer.sh)
echo must be run on a Linux system.
echo.
echo Features include:
echo - Package updates & upgrades
echo - Cache cleaning (apt autoremove/autoclean)
echo - Disk usage summary (df -h)
echo.
echo Visit my GitHub for the full cross-platform tool:
echo https://github.com/your-username/hasan-tek-optimizer
echo.
pause
goto :EOF