#!/bin/bash

num=$(ps aux | grep "ollama" | wc -l)
if [ $num -eq 1 ]; then
    notify-send "ollama running"
    ollama serve
else
    pkill ollama
    notify-send "ollama stopped"
fi
