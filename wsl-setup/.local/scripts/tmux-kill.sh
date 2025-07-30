#!/bin/sh

echo 'Are you sure you want to kill all sessions except the active one? (y/n)'
read -r answer

if [ "$answer" = 'y' ]; then
    tmux list-sessions | grep -v '(attached)' | cut -d: -f1 | xargs -I {} tmux kill-session -t {}
fi
