#!/usr/bin/env python3
import yt_dlp
import argparse
import os
import re
import html
import textwrap
import subprocess

def clean_transcript(input_file, output_file):
    if not os.path.exists(input_file):
        print(f"Error: {input_file} not found.")
        return

    with open(input_file, 'r', encoding='utf-8') as f:
        content = f.read()

    # Remove timestamps: '/^[0-9][0-9]:[0-9][0-9]:[0-9][0-9].[0-9][0-9][0-9] --> [0-9][0-9]:[0-9][0-9]:[0-9][0-9].[0-9][0-9][0-9]$/d'
    content = re.sub(r'^\d{2}:\d{2}:\d{2}\.\d{3} --> \d{2}:\d{2}:\d{2}\.\d{3}$', '', content, flags=re.MULTILINE)

    # Remove line numbers: '/^[[:digit:]]\{1,3\}$/d'
    content = re.sub(r'^\d{1,3}$', '', content, flags=re.MULTILINE)

    # Remove tags: 's/<[^>]*>//g'
    content = re.sub(r'<[^>]*>', '', content)

    # Html decode
    content = html.unescape(content)

    # Remove empty lines
    lines = content.splitlines()
    cleaned_lines = [line.strip() for line in lines if line.strip()]

    # Join them, then split with 120 characters per line
    cleaned_content = ' '.join(cleaned_lines)
    cleaned_content = textwrap.fill(cleaned_content, width=120)

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(cleaned_content)

def main():
    parser = argparse.ArgumentParser(description="Download and clean transcript from YouTube video.")
    parser.add_argument('url', help='The URL of the YouTube video')
    parser.add_argument('--ai', action='store_true', help='Organize transcript into markdown with headings')
    args = parser.parse_args()

    url = args.url

    ydl_opts = {
        'skip_download': True,
        'writesubtitles': True,
        'writeautomaticsub': True,
        'subtitleslangs': ['en'],
        'subtitlesformat': 'ttml',
        'postprocessors': [{
            'key': 'FFmpegSubtitlesConvertor',
            'format': 'srt',
        }],
        'outtmpl': '%(title)s.%(ext)s',
        'quiet': True,
        'no_warnings': True,
    }

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        info = ydl.extract_info(url, download=True)
        base_name = ydl.prepare_filename(info)

    filename_base = os.path.splitext(base_name)[0]
    srt_file = f"{filename_base}.en.ttml"
    output_file = f"{filename_base}.txt"

    clean_transcript(srt_file, output_file)

    if os.path.exists(srt_file):
        os.remove(srt_file)
        print(f"Transcript saved to {output_file}")

    if args.ai:
        prompt = (
            f"You are processing a video transcript from {output_file}. "
            "CRITICAL RULES:\n"
            "1. NEVER change the actual words or content of what the speaker said. The transcript must remain faithful to the original speech.\n"
            "2. You MAY add punctuation (commas, periods, question marks, etc.) and paragraph breaks for readability.\n"
            "3. You MAY correct obvious spelling mistakes from auto-captioning.\n"
            "4. You MAY tone down speech mannerisms (e.g., excessive 'um', 'uh', 'like', filler repetitions) but do NOT remove or alter any meaningful words.\n"
            "5. Organize the transcript into logical sections with markdown headings.\n"
            "Output a well-formatted markdown file."
        )
        subprocess.run(["opencode", "run", prompt])

if __name__ == "__main__":
    main()
