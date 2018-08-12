@echo off
:check_audio
call C:\Radio-Stream\Tools\curl.exe -o radio-icecast http://localhost:8000

if exist radio-icecast (
	del radio-icecast
	echo "Correct icecast"
	@start "" /D"C:\Radio-Stream\OddcastV3\check" "check.vbs"
	exit
) else (
	echo "Do not icecast"
	@start "" /D"C:\Radio-Stream\Icecast" "start.vbs"
	@timeout 10 >nul
	GOTO check_audio
)