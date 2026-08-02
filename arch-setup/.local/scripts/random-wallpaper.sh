#!/usr/bin/env bash

rand=$(($RANDOM % 6))

cd ~/.local/wallpapers

cp -a bg-$rand.jpg landing.jpg

hyprpaper
