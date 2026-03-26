#!/bin/bash

clear && fastfetch && echo $'\n' && fortune
if pgrep -x waybar >/dev/null; then
  pkill -x waybar
fi
cp ~/.config/hypr/monitor.mode ~/.config/hypr/monitors.conf
cp ~/.config/hypr/mon-keys ~/.config/hypr/keybindings.conf
sleep 3
awww img -o "DP-1" --transition-fps 144 --transition-type right --transition-duration 2 ~/.config/calos/current/background
sleep 1
hyprctl dispatch movetoworkspace 1
sleep 1
systemctl --user start waybar.service >/dev/null 2>&1 &
