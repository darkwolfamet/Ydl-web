@echo off
SETLOCAL

:: -----------------------------------------
:: Setup Ydl Web on Windows
:: -----------------------------------------

echo.
echo ================================
echo    Setting up Ydl Web
echo ================================
echo.

:: Check if Python is installed
python --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo Python is not installed. Please install Python 3.10+ and try again.
    pause
    exit /b
)

:: Create virtual environment if it doesn't exist
IF NOT EXIST "venv" (
    echo Creating virtual environment...
    python -m venv venv
)

:: Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

:: Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip

:: Install Python dependencies
echo Installing Python dependencies...
pip install -r requirements.txt

:: Install FFmpeg if not found
where ffmpeg >nul 2>&1
IF ERRORLEVEL 1 (
    echo FFmpeg not found. Attempting installation via winget...
    winget install --id=Gyan.FFmpeg -e --source winget
    echo If winget is not available, please install FFmpeg manually from https://ffmpeg.org/download.html
)

:: Launch Streamlit app
echo Launching Ydl Web...
streamlit run main.py

pause
