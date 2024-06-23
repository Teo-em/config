#!/bin/bash

devname=$(lsblk -O | awk 'NR==1 {for (i=1; i<=NF; i++) if ($i == "ID-LINK") id=i; else if ($i == "FSTYPE") name=i} {print $name, $id}' | grep SONY_WALKMAN | awk '{print $1}' | cut -d ' ' -f1 | head -n 1)
device=/dev/${devname}1
directory=/mnt/walkman

if ! grep -qs $directory /proc/mounts; then
    sudo mount $device $directory
    if [ "$?" != 0 ]; then
        exit 1
    fi
fi

if [ "$1" = "sync" ]; then
    sudo rsync --no-o --no-g --no-perms --human-readable --progress $HOME/sdd/* ${directory}/
    ls $directory/*.mp3
    echo "syncing..."
    sync /mnt/walkman/*
    echo "unmounting..."
    sudo umount $directory
    echo "Done!"
fi

if [ "$1" = "wipe" ]; then
    sudo rm /mnt/walkman/*.mp3
fi
