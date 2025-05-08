#!/usr/bin/env bash

# Install essentials
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm --needed git base-devel curl wget nano vi vim \
networkmanager stow || echo "failed to install essentials"

# Stow
[[ -d ~/dotfiles ]] || { echo "dotfiles directory not found"; return 1; }
cd ~/dotfiles
for dir in alacritty bash dunst fastfetch kitty nvim tmux waybar wofi zsh setup-arch; do
	stow "$dir"
done
cd ~

# Install yay
if ! command -v yay &>/dev/null; then
	git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si \
	&& cd .. && rm -rf yay && yay -Syu || echo "failed to install yay"
fi

# Install hyprland
if ! command -v hyprland &>/dev/null; then
	yay -S --noconfirm wayland xdg-desktop-portal xdg-desktop-portal-wlr dunst waybar \
	hyprpaper grim slurp wl-clipboard wofi dunst || echo "failed to install hyprland"
fi

# Install fonts
yay -S --noconfirm ttf-karla otf-geist-mono-nerd ttf-hack-nerd ttf-firacode-nerd \
ttf-liberation ttf-dejavu ttf-ubuntu-font-family adobe-source-code-pro-fonts \
adobe-source-sans-fonts adobe-source-serif-fonts noto-fonts noto-fonts-cjk \
noto-fonts-emoji noto-fonts-extra font-manager || echo "failed to install fonts"

# Install development tools
if ! command -v zsh &>/dev/null; then
	yay -S --noconfirm alacitty kitty zsh tmux fzf ripgrep neovim bat tldr openssh \
	|| echo "failed to install development tools"
fi

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Install Audio tools
if ! command -v pavucontrol &>/dev/null; then
	yay -S --noconfirm pipewire pipewire-pulse wireplumber pavucontrol || echo "failed to install audio tools"
fi

# Install extras
yay -S --noconfirm firefox obs-studio vlc mpv gimp htop fastfetch || echo "failed to install extras"

# Enable system services
sudo systemctl enable --now NetworkManager
sudo systemctl --user enable --now pipewire pipewire-pulse wireplumber

# Cleanup
yay -Sc --noconfirm # clean package cache

