#!/bin/bash

clear && fastfetch && echo $'\n' && fortune
cp ~/.config/hypr/monitor.mode ~/.config/hypr/monitors.conf
sleep 3
swww img -o "DP-1" --transition-fps 144 --transition-type right --transition-duration 2 ~/.config/calos/current/background
sleep 1
hyprctl dispatch movetoworkspace 1
