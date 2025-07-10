@echo off

pushd "%~dp0"

for /f "tokens=1,2 delims==" %%a in (config.ini) do (
	set "%%a=%%b"
)

Tools\nircmd\nircmd exec hide Tools\vlc\vlc --intf dummy --dummy-quiet --random --loop --extraintf rc --rc-host localhost:12345 "..\ROMs\music"
Tools\nircmd\nircmd execmd "echo volume %MUSIC_VOLUME% | Tools\nmap\ncat localhost 12345"