#!/usr/bin/env bash

# Install essentials
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm --needed git base-devel curl wget nano vi vim \
networkmanager stow || { echo "failed to install essentials"; return 1; }

# Stow dotfiles
[[ -d ~/dotfiles ]] || { echo "dotfiles directory not found"; return 1; }
cd ~/dotfiles
for dir in alacritty bash dunst fastfetch kitty nvim swaync tmux waybar rofi-wayland zsh setup-arch; do
	stow "$dir"
done
cd ~

# Install yay
if ! command -v yay &>/dev/null; then
	git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si \
	&& cd .. && rm -rf yay && yay -Syu || { echo "failed to install yay"; return 1; }
fi

# Install programming languages
cd ~ && mkdir ~/.local && mkdir ~/.local/share && mkdir ~/.local/share/nvm && \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
&& nvm install --lts || { echo "failed to install npm"; return 1; }

curl https://sh.rustup.rs -sSf | sh || { echo "failed to install rust"; return 1; }
sudo mv ~/.cargo ~/.config/cargo && sudo mv ~/.rustup ~/.config/rustup

yay -S --noconfirm go hugo python python-pip || { echo "failed to install go any python"; return 1; }

if ! command -v npm &>/dev/null; then
	npm install -g typescript
end

# Install hyprland
yay -S --noconfirm wayland hyprland xdg-desktop-portal xdg-desktop-portal-hyprland \
xdg-desktop-portal-wlr waybar grim slurp jq hyprpicker hyprshot hyprpaper \
wl-clipboard wofi swaync swaylock-effects swayidle \
|| { echo "failed to install hyprland"; return 1; }

# Install fonts
yay -S --noconfirm ttf-karla otf-geist-mono-nerd ttf-hack-nerd ttf-firacode-nerd \
ttf-liberation ttf-dejavu ttf-ubuntu-font-family adobe-source-code-pro-fonts \
adobe-source-sans-fonts adobe-source-serif-fonts noto-fonts noto-fonts-cjk \
noto-fonts-emoji noto-fonts-extra font-manager || { echo "failed to install fonts"; return 1; }

# Install development tools
yay -S --noconfirm alacitty kitty zsh tmux fzf ripgrep neovim bat tldr openssh \
||  { echo "failed to install development tools"; return 1; }

# Install Oh My Zsh
if command -v zsh; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || { echo "failed to install oh my zsh"; return 1; }
fi

# Install Tmux Plugin Manager
if command -v tmux; then
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm \
	|| { echo "failed to install tpm"; return 1; }
fi

# Install Audio tools
yay -S --noconfirm pipewire pipewire-pulse wireplumber pavucontrol \
||  { echo "failed to install audio tools"; return 1; }

# Install extras
yay -S --noconfirm firefox zen-browser-bin mullvad-vpn thunar obs-studio obsidian vlc imv mpv gimp \
htop fastfetch brightnessctl okular || { echo "failed to install extra tools"; return 1; }

# Enable system services
sudo systemctl enable --now NetworkManager
sudo systemctl --user enable --now pipewire pipewire-pulse wireplumber

# Cleanup
yay -Sc --noconfirm
