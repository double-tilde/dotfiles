# Set path so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/scripts" ] ; then
    PATH="$HOME/.local/scripts:$PATH"
fi

# Set PATH so it includes mason tools
if [ -d "$HOME/.local/share/nvim/mason/bin" ] ; then
    PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
fi

# Variables
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_PICTURES_DIR="$HOME/docs/images"

# Defaults
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GDK_SCALE=1.25
export QT_SCALE_FACTOR=1.25
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export TERM="xterm-256color"

# Hyprshot
export HYPRSHOT_DIR=$HOME/docs/images/screenshots

# Add nvm / npm / node to path
export NVM_DIR="$XDG_DATA_HOME"/nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

# Add python / jupyter to path
export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter

# Add cargo to path
. "$HOME/.config/cargo/env"
. "/home/double-tilde/.config/cargo/env"

# Add java to path
export JAVA_HOME=/usr/lib/jvm/java-25-openjdk
export PATH=$PATH:$JAVA_HOME/bin

# Start hyprland
if [ "$(tty)" = "/dev/tty1" ]; then
    exec start-hyprland
fi
