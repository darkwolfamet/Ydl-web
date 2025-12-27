@echo off
:: Ydl Web Setup Script with Virtual Environment

:: Step 1: Check for Python
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python is not installed. Please install Python 3.x before running this script.
    pause
    exit /b
)

:: Step 2: Create virtual environment
echo Creating virtual environment...
python -m venv venv

:: Step 3: Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

:: Step 4: Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip

:: Step 5: Install dependencies
echo Installing Python dependencies...
pip install -r requirements.txt

:: Step 6: Check/install FFmpeg
ffmpeg -version >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    echo FFmpeg is already installed.
) ELSE (
    echo FFmpeg not found. Installing...
    choco -v >nul 2>&1
    IF %ERRORLEVEL% EQU 0 (
        echo Installing FFmpeg via Chocolatey...
        choco install ffmpeg -y
    ) ELSE (
        winget -v >nul 2>&1
        IF %ERRORLEVEL% EQU 0 (
            echo Installing FFmpeg via winget...
            winget install --id=Gyan.FFmpeg -e --source winget
        ) ELSE (
            echo Neither Chocolatey nor winget found. Please install FFmpeg manually from https://ffmpeg.org/download.html
        )
    )
)

:: Step 7: Launch Streamlit app
echo Setup completed! Launching Ydl Web...
streamlit run main.py

pause
