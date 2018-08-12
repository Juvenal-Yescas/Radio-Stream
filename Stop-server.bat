@echo off
SchTasks /Delete /TN "Radio-Stream" /F
taskkill /F /IM ngrok.exe
taskkill /F /IM OddcastV3Standalone.exe
taskkill /F /IM icecast.exe
taskkill /F /IM timeout.exe
taskkill /F /IM conhost.exe
exit