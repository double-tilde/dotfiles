#!/usr/bin/env bash

# Start new session
tmux new-session -d -s dt

# Right pane
tmux split-window -h -p 65

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
