@echo off
setlocal

REM Get the full path to bundle_app.exe in this folder
set "APP=%~dp0BundleFiles.exe"

if not exist "%APP%" (
    echo BundleFiles.exe not found in %~dp0
    echo Make sure BundleFiles.exe is in the same folder as this script.
    pause
    exit /b 1
)

echo Installing context menu entries using:
echo   %APP%
echo.

REM === FILES: Bundle into new folder ===
reg add "HKCU\Software\Classes\*\shell\BundleNew" /ve /d "Bundle into new folder" /f
reg add "HKCU\Software\Classes\*\shell\BundleNew\command" /ve /d "\"%APP%\" bundle-new \"%%1\"" /f

REM === FILES: Send to last bundle ===
reg add "HKCU\Software\Classes\*\shell\BundleSend" /ve /d "Send to last bundle" /f
reg add "HKCU\Software\Classes\*\shell\BundleSend\command" /ve /d "\"%APP%\" bundle-send \"%%1\"" /f

REM === FOLDERS: Bundle into new folder ===
reg add "HKCU\Software\Classes\Directory\shell\BundleNew" /ve /d "Bundle folder into new bundle" /f
reg add "HKCU\Software\Classes\Directory\shell\BundleNew\command" /ve /d "\"%APP%\" bundle-new \"%%1\"" /f

REM === FOLDERS: Send to last bundle ===
reg add "HKCU\Software\Classes\Directory\shell\BundleSend" /ve /d "Send folder to last bundle" /f
reg add "HKCU\Software\Classes\Directory\shell\BundleSend\command" /ve /d "\"%APP%\" bundle-send \"%%1\"" /f

echo.
echo Done. You may need to close and reopen File Explorer.
pause
endlocal
