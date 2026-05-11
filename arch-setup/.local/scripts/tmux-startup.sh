#!/usr/bin/env bash

# Get current terminal dimensions
set -- $(stty size)
ROWS=$1
COLS=$2

# New session with dimension (subtract 1 row for status bar)
tmux new-session -d -s "~~" -x "$COLS" -y "$((ROWS - 1))"

# If the screen is wide enough
if [[ $COLS -ge 150 ]]; then
	# Right pane
	tmux split-window -h -p 75
	
	# Go to left pane
	tmux select-pane -L

	# Split left vertically
	tmux split-window -v -p 70
	
	# tty-clock
	tmux select-pane -U
	tmux send-keys "tty-clock -c" C-m
	
	# glances
	tmux select-pane -D
	tmux send-keys "glances --disable-left-sidebar" C-m
else
	# Right pane
	tmux split-window -h -p 70
	
	# Go to left pane
	tmux select-pane -L

	# tty-clock
	tmux send-keys "tty-clock -c" C-m
fi

tmux select-pane -R

tmux attach-session -t "~~"
