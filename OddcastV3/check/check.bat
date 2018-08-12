@echo off

:check_audio
call C:\Radio-Stream\Tools\curl.exe -o radio-oddcast http://localhost:8000
find /i "myRadio" < radio-oddcast > onlineRadio
del radio-oddcast

call C:\Radio-Stream\Tools\notEmpty.cmd onlineRadio

If %errorlevel% EQU 0 (
    del onlineRadio
	echo "Correct oddcast"
    @start "" /D"C:\Radio-Stream\Ngrok\check" "check.vbs"
    exit
) Else (
    del onlineRadio
	echo "restart oddcast"
    taskkill /F /IM OddcastV3Standalone.exe
   	@start "" /D"C:\Radio-Stream\OddcastV3" "start.vbs"
	@timeout 10 >nul
	GOTO check_audio
)