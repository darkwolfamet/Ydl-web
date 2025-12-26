import os

def download_option(full_path,output_name):
    
    video_options = {
    "format": "bestvideo+bestaudio/best",
    "outtmpl": os.path.join(full_path, f"{output_name}.%(ext)s"),
    "merge_output_format": "mp4",
    "quiet": False,
    "no_warnings": False,
}

    audio_options = {
        "format": "bestaudio/best",
        "outtmpl": os.path.join(full_path, f"{output_name}.%(ext)s"),
        "quiet": False,
        "no_warnings": False,
}

    extract_options = {
        "format": "bestaudio/best",
        "outtmpl": os.path.join(full_path ,f"{output_name}.%(ext)s"),
        "quiet": False,
        "no_warnings":False,
        "postprocessors": [
            {
                "key": "FFmpegExtractAudio",
                "preferredcodec": "mp3",
                "preferredquality": "192",
            }
        ],
}

    return {
        "video": video_options,
        "audio": audio_options,
        "extract": extract_options,
    }