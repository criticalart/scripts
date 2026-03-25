#!/bin/bash

clear && fastfetch && echo $'\n' && fortune
if pgrep -x waybar >/dev/null; then
  pkill -x waybar
fi
cp ~/.config/hypr/tv.mode ~/.config/hypr/monitors.conf
sleep 3
swww img -o "HDMI-A-1" --transition-fps 60 --transition-type left --transition-duration 2 ~/.config/calos/current/background
sleep 1
hyprctl dispatch movetoworkspace 6
sleep 1
systemctl --user start waybar.service >/dev/null 2>&1 &
