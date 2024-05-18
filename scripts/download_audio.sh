#!/bin/sh

if [ $# -eq 0 ]
then
    echo "Error"
    exit 1
fi



temp="/home/goodman/AX/music/"
name=$(yt-dlp --output "%(title)s" -x --print filename $1) 

if [ $? -ne 0 ]
then
    echo "Error"
    exit 2
fi

echo -n "Descargando ."
yt-dlp --output "${temp}%(title)s" -x $1 &> /dev/null
echo -n " ."
ffmpeg -i "${temp}${name}.opus" -ab 320k "${temp}${name}.mp3" &> /dev/null
echo -n " ."
rm "${temp}${name}.opus"
