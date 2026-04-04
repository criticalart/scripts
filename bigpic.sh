#!/bin/bash

echo
notify-send "Launching Steam Big Picture Mode"
steam steam://open/bigpicture
sleep 1
hyprctl dispatch workspace 10
sleep 5
hyprctl dispatch focuswindow title:Steam Big Picture Mode && hyprctl dispatch fullscreen
exit
