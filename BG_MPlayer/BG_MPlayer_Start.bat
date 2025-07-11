@echo off

setlocal EnableDelayedExpansion

pushd "%~dp0"

for /f "tokens=1,2 delims==" %%a in (config.ini) do (
	set "%%a=%%b"
)

if /I "%MUSIC%"=="false" (
	endlocal
	goto :eof
)

Tools\nircmd\nircmd exec hide Tools\vlc\vlc --intf dummy --dummy-quiet --extraintf rc --rc-host localhost:12345 --recursive --random --loop
Tools\nircmd\nircmd execmd "echo volume 0 | Tools\ncat\ncat localhost 12345"
Tools\nircmd\nircmd execmd "echo add ..\ROMs\music | Tools\ncat\ncat localhost 12345"

set PORT=12345

set ENDVOL=%MUSIC_VOLUME%

set STARTVOL=0

if /I "%FADE_TIME%"=="fast" (
	set FADE_MS=1000
) else if /I "%FADE_TIME%"=="normal" (
	set FADE_MS=2500
) else if /I "%FADE_TIME%"=="slow" (
	set FADE_MS=5000
) else (
	set FADE_MS=1000
)

rem time in milliseconds for each step
set /A INTERVAL=100

set /A STEPS=FADE_MS / INTERVAL

echo WScript.Sleep %INTERVAL% > sleep.vbs

for /L %%i in (1,1,%STEPS%) do (
	set /A NEWVOL=STARTVOL + ^(^(ENDVOL - STARTVOL^) * %%i / STEPS^)
	rem echo Step %%i: !NEWVOL!
	Tools\nircmd\nircmd execmd "echo volume !NEWVOL! | Tools\ncat\ncat localhost %PORT%"
	cscript //NoLogo sleep.vbs
)

del sleep.vbs
endlocal