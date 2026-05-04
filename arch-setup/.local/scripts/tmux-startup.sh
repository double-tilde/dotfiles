#!/usr/bin/env bash

# Get current terminal dimensions
set -- $(stty size)
ROWS=$1
COLS=$2

# New session with dimension (subtract 1 row for status bar)
tmux new-session -d -s dt -x "$COLS" -y "$((ROWS - 1))"

# Right pane
tmux split-window -h -p 75

# Go to left pane
tmux select-pane -L

# Split left vertically
tmux split-window -v

# tty-clock
tmux select-pane -U
tmux send-keys "tty-clock" C-m

# htop
tmux select-pane -D
tmux send-keys "htop -d 30 --no-function-bar --readonly" C-m

tmux select-pane -R

tmux attach-session -t dt
