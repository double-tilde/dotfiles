#!/bin/bash

choice=$(printf "  Lock\n󰍃  Logout\n󰜉  Reboot\n  Shutdown" | wofi --show dmenu -p "Power Menu")

case "$choice" in
  "  Lock") swaylock --image ~/.local/wallpapers/landing.jpg --effect-blur 7x5 --clock --indicator \
--indicator-radius 100 --indicator-thickness 7 --ring-color ffffff99 --ring-clear-color ffffff99 \
--ring-ver-color ffffff99 --ring-wrong-color ffffff99 --key-hl-color ffffff --bs-hl-color ffffff \
--text-color ffffff --text-clear-color ffffff --text-ver-color ffffff --text-wrong-color ffffff \
--inside-color 00000044 --inside-clear-color 00000044 --inside-ver-color 00000044 \
--inside-wrong-color 00000044 --line-color 00000000 --separator-color 00000000 ;;
  "󰍃  Logout")   hyprctl dispatch exit ;;
  "󰜉  Reboot")   systemctl reboot ;;
  "  Shutdown") systemctl poweroff ;;
esac

