@echo off

setlocal EnableDelayedExpansion

pushd "%~dp0"

for /f "tokens=1,2 delims==" %%a in (config.ini) do (
	set "%%a=%%b"
)

set PORT=12345

set STARTVOL=%MUSIC_VOLUME%

if /I "%NON_STOP%"=="true" (
	if /I "%FADE_TIME%"=="disabled" (
		Tools\nircmd\nircmd execmd "echo volume %NON_STOP_VOLUME% | Tools\nmap\ncat localhost %PORT%"
		endlocal
		goto :eof
	)
	set ENDVOL=%NON_STOP_VOLUME%
) else (
	set ENDVOL=0
)

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
	Tools\nircmd\nircmd execmd "echo volume !NEWVOL! | Tools\nmap\ncat localhost %PORT%"
	cscript //NoLogo sleep.vbs
)

if /I "%NON_STOP%"=="false" (
	Tools\nircmd\nircmd execmd "echo pause | Tools\nmap\ncat localhost %PORT%"
)

del sleep.vbs
endlocal