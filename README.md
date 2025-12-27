# Ydl Web – Streamlined Video Downloader

**Ydl Web** is a user-friendly web-based video downloader built with Streamlit and yt_dlp. It guides users step-by-step to download videos or extract audio, with options to choose the download format (Video, Audio, or MP3), set a custom file name, and select the download directory. Interactive Lottie animations provide visual feedback during the process, making downloads intuitive and engaging.

---

## Features
- Guided, multi-step interface using Streamlit session states
- Flexible download formats: Video, Audio, or Extract MP3
- Customizable file names or default naming from the video source
- Automatic folder creation for organized downloads
- Cross-platform support: Windows, Linux, and macOS (requires `ffmpeg`)
- Lightweight, minimalistic web interface for simplicity and speed

---

## Tech Stack
- Python 3.x
- Streamlit
- yt_dlp
- Streamlit-Lottie
- Requests

---

## Screenshots

You can go to the screenshota folder in the gtihub repo to view the process

## Installation

1. Clone the repository:  
   ```bash
    https://github.com/darkwolfamet/Ydl-web.git && cd ydl-web
    
2. Install dependencies:
   ```bash
    pip install -r requirements.txt

3. Additional information
  Make sure ffmpeg is installed for audio extraction:

  Windows:
  
    https://ffmpeg.org/download.html
  
  Linux:
      
    sudo apt install ffmpeg
  Mac0S
    
    macOS: brew install ffmpeg

## Usage

You can use it by running 

    setup.bat
This is to be done after cloning the github repo, from above.

  


