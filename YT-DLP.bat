@echo off
start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-BitsTransfer -Source https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe"
start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-BitsTransfer -Source https://github.com/BtbN/FFmpeg-Builds/releases/latest/download/ffmpeg-master-latest-win64-gpl.zip; Expand-Archive -Path '.\ffmpeg-master-latest-win64-gpl.zip'; cp .\ffmpeg-master-latest-win64-gpl\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe .\; cp .\ffmpeg-master-latest-win64-gpl\ffmpeg-master-latest-win64-gpl\bin\ffplay.exe .\; cp .\ffmpeg-master-latest-win64-gpl\ffmpeg-master-latest-win64-gpl\bin\ffprobe.exe .\; rm -r ffmpeg-master-latest-win64-gpl; rm ffmpeg-master-latest-win64-gpl.zip"

echo Insert YouTube Video URL
set /p input=.%BS% '> '
set url=%input%
echo.
yt-dlp.exe -F %url%
echo.
echo Select a Resolution
set /p input=.%BS% '> '
set res=%input%
yt-dlp -f %res%+bestaudio %url%
pause
rm yt-dlp.exe
rm ffmpeg.exe
rm ffplay.exe
rm ffprobe.exe
rm '
