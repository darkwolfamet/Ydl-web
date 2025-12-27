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

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing git..."
    sudo apt update && sudo apt install git -y
fi

# Clone repository if not already cloned
if [ ! -d "Ydl-web" ]; then
    echo "Cloning Ydl Web repository..."
    git clone https://github.com/darkwolfamet/Ydl-web.git
fi

cd Ydl-web || exit

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
python3 -m pip install --upgrade pip

# Install Python dependencies
echo "Installing Python dependencies..."
python3 -m pip install -r requirements.txt

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
python3 -m streamlit run main.py

