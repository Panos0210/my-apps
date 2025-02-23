@echo off
start "" powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-BitsTransfer -Source https://github.com/BtbN/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-win64-gpl.zip; Expand-Archive -Path '.\ffmpeg-master-latest-win64-gpl.zip'; cp .\ffmpeg-master-latest-win64-gpl\ffmpeg-master-latest-win64-gpl\bin\ffmpeg.exe '.\'; del -r ffmpeg-master-latest-win64-gpl; del ffmpeg-master-latest-win64-gpl.zip; Start-BitsTransfer -Source https://github.com/Panos0210/my-apps/raw/refs/heads/main/Dependancies/N_m3u8DL-RE.exe; Start-BitsTransfer -Source https://github.com/Panos0210/my-apps/raw/refs/heads/main/Dependancies/mp4decrypt.exe"


setlocal enabledelayedexpansion
set "PYTHON_DIR="

for /d %%U in ("C:\Users\*") do (
    for /d %%P in ("%%U\AppData\Local\Programs\Python\Python*") do (
        if exist "%%P\Scripts\gamdl.exe" (
            echo gamdl.exe found in: %%P\Scripts
            set "PYTHON_DIR=%%P"
        )
    )
)

if not defined PYTHON_DIR (
    for /d %%U in ("C:\Users\*") do (
        for /d %%P in ("%%U\AppData\Local\Programs\Python\Python*") do (
            echo gamdl.exe NOT found in any Python installation.
            echo Installing gamdl...
            "%%P\python.exe" -m pip install gamdl
            set "PYTHON_DIR=%%P"
            echo.
            echo gamdl installed successfully!
            goto :run_script
        )
    )
) else (
    goto :run_script
)

echo No Python installation found.
pause
exit /b

:run_script
set "GAMDL_EXE=%PYTHON_DIR%\Scripts\gamdl.exe"

set /p url="Enter URL: "
set /p codec="Do you want to see the available codecs and decide which one you want or should it downlaod whichever it has available? (awnser: y=yes n=no): "
if /I "%codec%"=="y" (
    "%GAMDL_EXE%" --codec-song ask "%url%"
) else if /I "%codec%"=="n" (
    "%GAMDL_EXE%" "%url%"
)
"%GAMDL_EXE%" --codec-song ask "%url%"
del ffmpeg.exe
del mp4decrypt.exe
del N_m3u8DL-RE.exe
pause
