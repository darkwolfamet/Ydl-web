@echo off
:: Ydl Web Setup Script
:: --------------------

:: Step 1: Check for Python
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python is not installed. Please install Python 3.x before running this script.
    pause
    exit /b
)

:: Step 2: Install FFmpeg
echo Checking for FFmpeg...
ffmpeg -version >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo FFmpeg is already installed.
) ELSE (
    echo FFmpeg not found. Installing...
    :: Try Chocolatey first
    choco -v >nul 2>&1
    IF %ERRORLEVEL% EQU 0 (
        echo Installing FFmpeg via Chocolatey...
        choco install ffmpeg -y
    ) ELSE (
        echo Chocolatey not found. Trying winget...
        winget -v >nul 2>&1
        IF %ERRORLEVEL% EQU 0 (
            echo Installing FFmpeg via winget...
            winget install --id=Gyan.FFmpeg -e --source winget
        ) ELSE (
            echo Neither Chocolatey nor winget found. Please install FFmpeg manually from https://ffmpeg.org/download.html
            pause
            exit /b
        )
    )
)

:: Step 3: Install Python dependencies
echo Installing Python dependencies...
pip install --upgrade pip
pip install -r requirements.txt

echo Setup completed! You can now run:
echo streamlit run main.py
pause
