#!/bin/sh
temp="${HOME}/AX/music/"
name=$(yt-dlp --output "%(title)s" -x --print filename $1)
echo -n "Descargando ."
yt-dlp --output "${temp}%(title)s" -x $1 &> /dev/null
echo -n " ."
ffmpeg -i "${temp}${name}.opus" -ab 320k "${temp}${name}.mp3" &> /dev/null
echo -n " ."
rm "${temp}${name}.opus"
