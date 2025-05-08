#! /usr/bin/env zsh

# Remove auto generated files
rm -rf ~/.bash* ~/.motd_shown ~/.viminfo ~/.vim ~/.landscape ~/.python_history

# Source things
echo "Sourcing .profile"
source ~/.profile || echo "Failed to source .profile"

# Source things
echo "Sourcing .zshenv"
source ~/.zshenv || echo "Failed to source .zshenv"

echo "Sourcing .zshrc"
source ~/.config/zsh/.zshrc || echo "Failed to source .zshrc"
