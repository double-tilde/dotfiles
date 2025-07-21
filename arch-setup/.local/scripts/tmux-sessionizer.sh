#!/usr/bin/env bash

export FZF_DEFAULT_OPTS="--layout=reverse --height=30% --ansi --border bottom --color=fg:#c9c7cd,bg:#161617,hl:#c9c7cd --color=fg+:#92a2d5,bg+:#161617,hl+:#92a2d5 --color=info:#90b99f,prompt:#df6882,pointer:#92a2d5 --color=marker:#90b99f,spinner:#90b99f,header:#e6b99d"

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/docs ~/projects/ ~/dotfiles ~/dotfiles/*/.config ~/ -mindepth 1 -maxdepth 1 -type d | fzf)
fi

[[ -z $selected ]] && exit 0

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s "$selected_name" -c "$selected" -n 'neovim' "zsh -c 'nvim; zsh'"
    tmux new-window -t "$selected_name" -n 'terminal' -c "$selected"
    tmux new-window -t "$selected_name" -n 'server' -c "$selected"
    tmux select-window -t "$selected_name":1
    tmux attach-session -t "$selected_name"
    exit 0
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected" -n 'neovim' "zsh -c 'nvim; zsh'"
    tmux new-window -t "$selected_name" -n 'terminal' -c "$selected"
    tmux new-window -t "$selected_name" -n 'server' -c "$selected"
    tmux select-window -t "$selected_name":1
fi

tmux switch-client -t "$selected_name"
