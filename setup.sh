#!/bin/bash
set -e

echo "================================"
echo "   Setting up Ydl Web"
echo "================================"

# Check if Python3 is installed
if ! command -v python3 &> /dev/null; then
    echo "Python3 could not be found. Please install Python3."
    exit 1
fi

# Ensure python3-venv is installed
if ! python3 -m venv --help &> /dev/null; then
    echo "python3-venv not found. Installing..."
    sudo apt update
    sudo apt install python3-venv -y
fi

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing git..."
    sudo apt update
    sudo apt install git -y
fi

# Clone repository if not already cloned
if [ ! -d "Ydl-web" ]; then
    echo "Cloning Ydl Web repository..."
    git clone https://github.com/darkwolfamet/Ydl-web.git
fi

cd Ydl-web || exit

# Remove old virtual environment if exists
if [ -d "venv" ]; then
    echo "Removing old virtual environment..."
    rm -rf venv
fi

# Create virtual environment
echo "Creating virtual environment..."
python3 -m venv venv

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
python -m pip install --upgrade pip

# Install Python dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt

# Install FFmpeg if not installed
if ! command -v ffmpeg &> /dev/null; then
    echo "FFmpeg not found. Installing FFmpeg..."
    sudo apt update
    sudo apt install ffmpeg -y
else
    echo "FFmpeg is already installed."
fi

# Launch the app
echo "Launching Ydl Web..."
python -m streamlit run main.py
