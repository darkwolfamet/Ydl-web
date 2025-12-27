@echo off
title Ydl Web Setup
echo ==============================
echo Ydl Web Setup Script
echo ==============================
echo.

:: Check if Python is installed
python --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Python is not installed. Please install Python 3.x first.
    pause
    exit /b
)

:: Install required Python packages
echo Installing required Python packages...
pip install --upgrade pip
pip install -r requirements.txt
echo.

:: Check for FFmpeg installation
where ffmpeg >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo FFmpeg is already installed.
) else (
    echo FFmpeg not found. Installing FFmpeg...
    
    :: Create a temporary folder
    set TEMPFF=ffmpeg_temp
    mkdir %TEMPFF%
    cd %TEMPFF%
    
    :: Download FFmpeg Windows build (static version)
    echo Downloading FFmpeg...
    powershell -Command "Invoke-WebRequest -Uri https://www.gyan.dev/ffmpeg/builds/ffmpeg-release-essentials.zip -OutFile ffmpeg.zip"
    
    echo Extracting FFmpeg...
    powershell -Command "Expand-Archive -Path ffmpeg.zip -DestinationPath ."

    :: Move ffmpeg bin to repo folder
    echo Adding FFmpeg to local path...
    xcopy /Y /E .\ffmpeg-*\bin\* ..\ffmpeg_bin\

    :: Clean up
    cd ..
    rmdir /S /Q %TEMPFF%
    
    echo FFmpeg installed locally in ffmpeg_bin folder.
    echo You may want to add it to your system PATH for global use.
)

echo.
echo ==============================
echo Launching Ydl Web...
echo ==============================
echo.

:: Launch the Streamlit app
streamlit run main.py

pause
