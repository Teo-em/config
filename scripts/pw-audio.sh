#!/bin/bash

temp="/tmp/the-best-audio-on-earth"
action="/tmp/the-best-action-on-earth"
text="/tmp/the-best-text-on-earth"
lines=$(ps aux | grep pw-record | wc -l)
if [ ! -z "$1" ]
then
    echo $1 > $action
else
    exit 1
fi

if [ $lines -eq 1 ]; then
    notify-send "recording..."
    pw-record $temp
else
    notify-send "it was not recording..."
    exit 1
fi
