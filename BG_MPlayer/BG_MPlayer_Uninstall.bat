@echo off
setlocal
title BG_MPlayer Uninstaller

echo.
echo This script will delete all files related to BG_MPlayer.
echo It will remove the following:
echo.
echo   ..\ES-DE\scripts\game-end\BG_MPlayer_game-end.bat
echo   ..\ES-DE\scripts\game-start\BG_MPlayer_game-start.bat
echo   ..\ES-DE\scripts\screensaver-end\BG_MPlayer_screensaver-end.bat
echo   ..\ES-DE\scripts\screensaver-start\BG_MPlayer_screensaver-start.bat
echo   ..\ES-DE\scripts\quit\BG_MPlayer_quit.bat
echo   ..\ES-DE\scripts\startup\BG_MPlayer_startup.bat
echo   ..\ROMs\music\demo_music.mp3
echo   ..\BG_MPlayer\  (including this script and all its contents)
echo.

set /p CONFIRM=Are you sure you want to continue and delete all these files? (Y/N): 

if /I not "%CONFIRM%"=="Y" (
    echo.
    echo Uninstallation cancelled.
    goto :eof
)

echo.
echo Deleting BG_MPlayer files...

del /f /q "..\ES-DE\scripts\game-end\BG_MPlayer_game-end.bat"
del /f /q "..\ES-DE\scripts\game-start\BG_MPlayer_game-start.bat"
del /f /q "..\ES-DE\scripts\screensaver-end\BG_MPlayer_screensaver-end.bat"
del /f /q "..\ES-DE\scripts\screensaver-start\BG_MPlayer_screensaver-start.bat"
del /f /q "..\ES-DE\scripts\quit\BG_MPlayer_quit.bat"
del /f /q "..\ES-DE\scripts\startup\BG_MPlayer_startup.bat"
del /f /q "..\ROMs\music\demo_music.mp3"

cd ..

rmdir /s /q "BG_MPlayer"

echo.
echo BG_MPlayer files have been deleted.
pause