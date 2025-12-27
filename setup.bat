@echo off
title Ydl Web Setup
echo ========================================
echo    Setting up Ydl Web Environment
echo ========================================

:: Check if Python is installed
python --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Python is not installed. Please install Python 3.10 or higher.
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

:: Install dependencies
echo Installing required Python packages...
pip install -r requirements.txt

:: Launch the app
echo Launching Ydl Web...
streamlit run main.py

:: Pause at the end so user can see errors if any
pause
