# Radio-Stream

Tool that will help to transmit the radio over the internet, using ngrok as a tunnel generating a secure link every time you start the computer.

The final generated json file can be processed in your own way to share the link.

### How it works:

Use Icecast server and send the audio using OddcastV3.

![alt text](https://preview.ibb.co/d9sikp/Captura1.png "Icecast 2 and OddcastV3")

Then it generates a secure link to the local server.

![alt text](https://preview.ibb.co/iRzUQp/Captura2.png "Ngrok running")

The final file generated `Config/radio-ngrok.json` contains the link in the `public_url` parameter, you just need to add `radio-stream.mp3` to tune it.

```json
{
   "name":"radio",
   "uri":"/ api / tunnels / radio",
   "public_url":"https://26faa228.ngrok.io",
   "proto":"https",
   "config":{
      "addr":"localhost: 8000",
      "inspect":false
   },
   "metrics":{
      "conns":{
         "count":0,
      },
      "http":{
         "count":0,
      }
   }
}
```

**Example**: `https://26faa228.ngrok.io` adding `/radio-stream.mp3`

![alt text](https://preview.ibb.co/mPEw5p/Captura3.png "Play stream")

### Installation

- It is necessary to add the **ngrok token** in the `Ngrok/ngrok.yml` file.

- Clone the repository in the `C:\` directory leaving as follows:

```batch
C:\Radio-Stream\
```

It is necessary to run `Config/Autorun-Server.reg` to add the task and the autorun script so that when the computer is started, it is automatically configured and hidden.

### More configurations:

![alt text](https://image.ibb.co/ji3dJ9/Captura4.png "Setting Oddcast")

#### Note: 
You can configure `OddcastV3/OddcastV3Standalone.exe` in your own way but it is recommended that you do not edit the name of the radio since the script checks if the server was configured correctly using Stream name *`myRadio`*, if you were to edit this name also edit the file *`OddcastV3/check/check.bat`* on line 5.

```batch
1| @echo off
2|
3| :check_audio
4| call C:\Radio-Stream\Tools\curl.exe -o radio-oddcast http://localhost:8000
5| find /i "myRadio" < radio-oddcast > onlineRadio
6| del radio-oddcast
```
> OddcastV3/check/check.bat

### Features:

* Auto startup.
* Configurable.
* Written completely in batch.
