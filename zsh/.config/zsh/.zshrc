#
# ~~ ~~ ~~ ~~ ~~ ~~
# ~~ ZSH  CONFIG ~~
# ~~ ~~ ~~ ~~ ~~ ~~
#

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.config/zsh/.oh-my-zsh"

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$HOME/.config/zsh/.zsh_history"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="afowler"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git node npm sudo history encode64 copypath zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# vi mode (press ESC to enter)
bindkey -v

# My Scripts
export PATH="$HOME/.local/scripts:$PATH"

# PATH VARIABLES
# Go
export GOPATH=$HOME/.config/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Add nvm / npm / node to path
export NVM_DIR="$XDG_DATA_HOME"/nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history


# Rust/Cargo
export RUSTUP_HOME="$HOME/.config/rustup"
export CARGO_HOME="$HOME/.config/cargo"
export PATH=$PATH:$CARGO_HOME/bin

# fzf
export FZF_DEFAULT_COMMAND='find . -type f'
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
# Old world theme
export FZF_DEFAULT_OPTS="--layout=reverse --height=30% --ansi --border bottom --color=fg:#c9c7cd,bg:#161617,hl:#c9c7cd --color=fg+:#92a2d5,bg+:#161617,hl+:#92a2d5 --color=info:#90b99f,prompt:#df6882,pointer:#92a2d5 --color=marker:#90b99f,spinner:#90b99f,header:#e6b99d"
source <(fzf --zsh)

# Open nvim in the selected directory
fzf-open-nvim() {
    local exclude_dirs=(
    .git
    node_modules
    .cache
    .nvm
    .npm
    .mozilla
    dist
    _site
    public
    .oh-my-zsh
    cargo
    rustup
    .icons
    .pki
  )

  local exclude_args=()
  for dir in "${exclude_dirs[@]}"; do
    exclude_args+=(--exclude "$dir")
  done

  local selected=$(fd -L -d 6 --type f --type d --type l --hidden . ~ "${exclude_args[@]}" | fzf)

  if [[ -z "$selected" ]]; then
    echo "Nothing selected."
    return
  fi
  if [[ -d "$selected" ]]; then
      cd "$selected" && nvim .
  elif [[ -f "$selected" ]]; then
      nvim "$selected"
  else
      echo "No file or directory selected."
  fi
}

# zle = zsh line editor, adds the above function to the list of functions
# type "zle -la" to see a list of available functions
zle -N fzf-open-nvim
# bind the above function to ctrl f
bindkey '^f' fzf-open-nvim

# Use Windows git when working under C:\ drive
function git() {
  if $(pwd -P | grep -q "^/mnt/c/*"); then
    git.exe "$@"
  else
    command git "$@"
  fi
}

# Use Windows lazygit (installed with scopp) when working under C:\ drive
function lazygit() {
  if $(pwd -P | grep -q "^/mnt/c/*"); then
    lazygit.exe "$@"
  else
    command lazygit "$@"
  fi
}

# Aliases
# Set personal aliases, overriding those provided by oh-my-zsh.
# For a full list of active aliases, run `alias`.

# Python Aliases
alias python="python3"
alias py="python3"

# Neovim Aliases
alias vim="nvim"
alias -s go="nvim"
alias -s python3="nvim"
alias -s lua="nvim"
alias -s html="nvim"
alias -s css="nvim"
alias -s js="nvim"
alias -s svelte="nvim"
export MANPAGER="nvim +Man!" # use neovim controls for man entries

# NPM Aliases
alias bs-serve="browser-sync --server --files ."

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
