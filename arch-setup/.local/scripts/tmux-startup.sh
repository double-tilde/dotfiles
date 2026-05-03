#!/usr/bin/env bash

# Start new session (or attach if exists)
tmux new-session -d -s main

# Split: right pane (60%)
tmux split-window -h -p 60

# Go back to left pane
tmux select-pane -L

# Split left vertically (top/bottom)
tmux split-window -v

# Top-left: tty-clock
tmux select-pane -U
tmux send-keys "tty-clock" C-m

# Bottom-left: htop
tmux select-pane -D
tmux send-keys "htop" C-m

tmux select-pane -R

tmux attach-session -t main
