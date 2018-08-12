set objshell = createobject("wscript.shell")
objshell.run "ngrok.exe start --all -config C:\Radio-Stream\Ngrok\ngrok.yml",vbhide