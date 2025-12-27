@echo off
echo ================================
echo   YDL Web - Windows Setup
echo ================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Python is not installed.
    echo Please install Python 3.9 or higher from https://www.python.org
    pause
    exit /b
)

echo Python detected.
echo.

REM Upgrade pip
echo Updating pip...
python -m pip install --upgrade pip

REM Install dependencies
echo Installing requirements...
pip install -r requirements.txt

echo.
echo ================================
echo Setup complete!
echo Starting YDL Web...
echo ================================
echo.

REM Run Streamlit app
streamlit run main.py

pause
