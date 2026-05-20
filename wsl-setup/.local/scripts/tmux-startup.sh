#!/usr/bin/env bash

# Get current terminal dimensions
set -- $(stty size)
ROWS=$1
COLS=$2

# New session with dimension (subtract 1 row for status bar)
tmux new-session -d -s "~~" -x "$COLS" -y "$((ROWS - 1))"

# Right pane
tmux split-window -h -p 75

tmux attach-session -t "~~"
