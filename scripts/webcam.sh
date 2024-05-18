nc 192.168.0.120 9999 | ffmpeg -i /dev/stdin -codec copy -f v4l2 /dev/video0
