#!/bin/bash

echo
notify-send "Launching Steam Big Picture Mode"
sleep 1
steam steam://open/bigpicture
sleep 0.5
hyprctl dispatch workspace 10
exit
