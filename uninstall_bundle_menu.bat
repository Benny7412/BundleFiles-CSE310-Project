@echo off
setlocal

echo Removing context menu entries...

reg delete "HKCU\Software\Classes\*\shell\BundleNew" /f >nul 2>&1
reg delete "HKCU\Software\Classes\*\shell\BundleSend" /f >nul 2>&1
reg delete "HKCU\Software\Classes\Directory\shell\BundleNew" /f >nul 2>&1
reg delete "HKCU\Software\Classes\Directory\shell\BundleSend" /f >nul 2>&1

echo Finished! 
echo You may need to close and reopen File Explorer.
pause
endlocal
