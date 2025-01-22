@echo off
start "" powershell -NoProfile -ExecutionPolicy Bypass -command "Start-BitsTransfer -Source 'https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe'"

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