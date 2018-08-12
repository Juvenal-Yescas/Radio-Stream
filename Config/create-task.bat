@echo off

rem this script reviews the transmission every 10 minutes

SchTasks /Delete /TN "Radio-Stream" /F
SchTasks /Create /NP /SC MINUTE /MO 10 /TN "Radio-Stream" /TR "C:\Radio-Stream\start.bat"
exit