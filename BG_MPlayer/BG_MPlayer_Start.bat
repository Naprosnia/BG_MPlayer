@echo off

setlocal EnableDelayedExpansion

pushd "%~dp0"

Tools\nircmd\nircmd killprocess vlc.exe
Tools\nircmd\nircmd killprocess fmedia.exe
Tools\nircmd\nircmd killprocess fmedia-gui.exe

for /f "tokens=1,2 delims==" %%a in (config.ini) do (
	set "%%a=%%b"
)

if /I "%MUSIC%"=="false" (
	endlocal
	goto :eof
)

set CALC=Tools\math\calc

set STARTVOL=0

if /I "%PLAYER%"=="vlc" (
	
	set PORT=12345
	
	Tools\nircmd\nircmd exec hide Tools\vlc\vlc --intf dummy --dummy-quiet --extraintf rc --rc-host localhost:!PORT! --recursive --random --loop
	
	timeout /T 2 >nul
	
	Tools\nircmd\nircmd execmd "echo volume 0 | Tools\ncat\ncat localhost !PORT!"
	
	Tools\nircmd\nircmd execmd "echo add ..\ROMs\music | Tools\ncat\ncat localhost !PORT!"
	
	for /f "delims=" %%A in ('%CALC% %MUSIC_VOLUME% * 256 / 100') do set ENDVOL=%%A
	
) else (

	Tools\nircmd\nircmd execmd "Tools\fmedia\fmedia Tools\fmedia\10sec_silence.wav --random --repeat-all --background --globcmd=listen --globcmd.pipe-name=fmedia"
	
	timeout /T 2 >nul
	
	Tools\nircmd\nircmd execmd "Tools\fmedia\fmedia --globcmd=clear --globcmd.pipe-name=fmedia"
	
	Tools\nircmd\nircmd setappvolume fmedia.exe 0
	
	Tools\nircmd\nircmd execmd Tools\fmedia\fmedia --globcmd="play ..\ROMs\music" --globcmd.pipe-name=fmedia
	
	for /f "delims=" %%A in ('%CALC% %MUSIC_VOLUME% * 1 / 100') do set ENDVOL=%%A
	
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

for /f "delims=" %%A in ('%CALC% %FADE_MS% / %INTERVAL%') do set STEPS=%%A

echo WScript.Sleep %INTERVAL% > sleep.vbs

for /L %%i in (1,1,%STEPS%) do (

	for /f "delims=" %%A in ('%CALC% %STARTVOL% + ^(^(%ENDVOL% - %STARTVOL%^) * %%i / %STEPS%^)') do set NEWVOL=%%A
	
	rem echo Step %%i: !NEWVOL!
	
	if /I "%PLAYER%"=="vlc" (
	
		Tools\nircmd\nircmd execmd "echo volume !NEWVOL! | Tools\ncat\ncat localhost %PORT%"
		
	) else (
	
		Tools\nircmd\nircmd setappvolume fmedia.exe !NEWVOL!
		
	)
	
	cscript //NoLogo sleep.vbs
	
)

del sleep.vbs

endlocal