#!/bin/bash

temp="/tmp/the-best-audio-on-earth"
action="/tmp/the-best-action-on-earth"
text="/tmp/the-best-text-on-earth"
lines=$(ps aux | grep pw-record | wc -l)

if test -f $action; then
    vaction="$(cat $action)" 
else
    exit 1
fi

if [ ! $lines -eq 1 ]
then
    notify-send "stopped recording."
    pkill pw-record
    source $HOME/AX/projects/whisper/bin/activate

    if [ $vaction = "ollamae" ]; then
        text=$(whisper /tmp/the-best-audio-on-earth --language English --model base --output_dir /tmp | sed 's/\[[^]]*\]//g' | tr -d '\n' | cut -c2-)
    elif [ $vaction = "ollamas" ]; then
        text=$(whisper /tmp/the-best-audio-on-earth --language Spanish --model base --output_dir /tmp | sed 's/\[[^]]*\]//g' | tr -d '\n' | cut -c2-)
    elif [ $vaction = "translatee-s" ]; then
        text=$(whisper /tmp/the-best-audio-on-earth --language English --model base --output_dir /tmp | sed 's/\[[^]]*\]//g' | tr -d '\n' | cut -c2-)
        notify-send "$(echo $text | trans -b -to es)"
        rm $vaction
        exit 0
    elif [ $vaction = "translates-e" ]; then
        text=$(whisper /tmp/the-best-audio-on-earth --language Spanish --model base --task translate --output_dir /tmp | sed 's/\[[^]]*\]//g' | tr -d '\n' | cut -c2-)
        notify-send "$text"
        rm $action
        exit 0
    else 
        exit 1
    fi

    notify-send "$text"
    result=$(ollama run gemma:2b "$text" | tr "'" '"')
    alacritty --class floating -e "$HOME/AX/scripts/show_result.sh" "'$result'"
    deactivate
else
    exit 1
fi


