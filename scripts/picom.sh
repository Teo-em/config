#!/bin/bash

num=$(ps aux | grep "picom -b --config" | wc -l)
if [ $num -eq 2 ]; then
    pkill picom
else
    picom -b --config $HOME/.config/picom/picom.conf &
fi
