#! /usr/bin/env zsh

# Remove auto generated files
rm -rf ~/.bash_history ~/.sudo_as_admin_successful ~/.motd_shown ~/.viminfo ~/.vim ~/.landscape ~/.python_history

# Source things
echo "Sourcing .zshenv"
source ~/.zshenv || echo "Failed to source .zshenv"

echo "Sourcing .zshrc"
source ~/.config/zsh/.zshrc || echo "Failed to source .zshrc"
