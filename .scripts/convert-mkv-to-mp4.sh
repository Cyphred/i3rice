# !/bin/sh
ffmpeg -i $1 -map 0 -c copy -c:a aac $2
