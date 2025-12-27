# Ydl Web – Streamlined Video Downloader

**Ydl Web** is a user-friendly, web-based video downloader built with Streamlit and `yt-dlp`.  
It guides users step by step to download videos or extract audio, allowing them to:

- Choose the download format (Video, Audio, or MP3 extract)
- Set a custom file name or use the default title
- Select or create a download directory

Interactive Lottie animations provide visual feedback during processing, making the experience intuitive and engaging.

---

## Features

- Guided, multi-step interface using Streamlit session state
- Flexible download formats: Video, Audio, or MP3 Extract
- Custom file naming or automatic title-based naming
- Automatic folder creation for organized downloads
- Cross-platform support: Windows, Linux, and macOS (FFmpeg required)
- Lightweight and minimalistic web interface

---

## Tech Stack

- Python 3.x
- Streamlit
- yt-dlp
- Streamlit-Lottie
- Requests

---

## Screenshots

Screenshots showing the full workflow are available in the **`screenshots/`** folder in this repository.

---

## Installation

### Option 1: Automated Setup (Windows – Recommended)

1. Clone the repository:
   ```bash
   git clone https://github.com/darkwolfamet/Ydl-web.git
   cd Ydl-web
2. Write the command:
   ```bash
   setup.bat

## Option 2: Manual Setup (All Platforms)

1. Clone the repository:
   ```bash
   git clone https://github.com/darkwolfamet/Ydl-web.git
   cd Ydl-web
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
3. Run the app:
   ```bash
   streamlit run main.py
4. Or Run this in the terminal
   ```bash
   chmod +x setup.sh
   ./setup.sh


## FFmpeg Requirement (Important)

FFmpeg is required for audio extraction and MP3 conversion.

### Windows
Download and install FFmpeg from:
      
      https://ffmpeg.org/download.html
### Linux (Debian/Ubuntu)
      sudo apt install ffmpeg

## Usage

After launching the app:

1. Follow the guided prompts
2. Choose your download format
3. Select a file name and destination folder
4. Wait for the download animation
5 .Retrieve your file from the displayed path






