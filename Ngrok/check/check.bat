@echo off

:check_audio
call C:\Radio-Stream\Tools\curl.exe -o radio-ngrok.json http://localhost:4040/api/tunnels/radio

if exist radio-ngrok.json (
	echo "ngrok running"
	GOTO continue
) else (
	echo "ngrok not running"
	@start "" /D"C:\Radio-Stream\Ngrok" "start.vbs"
	@timeout 15 >nul
	GOTO check_audio
)

:continue
find /i "dial" < radio-ngrok.json > onlineRadio
call C:\Radio-Stream\Tools\notEmpty.cmd onlineRadio

If %errorlevel% EQU 0 (
	echo "Restart ngrok"
    del onlineRadio
	del radio-ngrok.json
    taskkill /F /IM ngrok.exe
   	@start "" /D"C:\Radio-Stream\Ngrok" "start.vbs"
	@timeout 15 >nul
	GOTO check_audio
) Else (
	echo "Finish start server..."
    del onlineRadio
	move radio-ngrok.json C:\Radio-Stream\Config\
	del radio-ngrok.json
	@start "" /D"C:\Radio-Stream\Config" "done-Server.vbs"
	exit
)