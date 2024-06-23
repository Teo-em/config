#!/bin/sh

if [ $# -eq 0 ]
then
    echo "Error"
    exit 1
fi


directory="/home/goodman/AX/music/"
if [ $2 = "home" ]
then
    directory="$HOME/"
elif [ $2 = "sdd" ]
then
    directory="$HOME/sdd/"
fi

name=$(yt-dlp --output "%(title)s" -x --print filename $1) 

if [ $? -ne 0 ]
then
    echo "Error"
    exit 2
fi

echo -n "Descargando ."
yt-dlp --output "${directory}%(title)s" -x $1 &> /dev/null
echo -n " ."
ffmpeg -i "${directory}${name}.opus" -ab 320k "${directory}${name}.mp3" &> /dev/null
echo -n " ."
rm "${directory}${name}.opus"
