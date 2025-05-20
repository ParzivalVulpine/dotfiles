#!/usr/bin/env bash

#Install paru
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

#Setup Mirrors
paru -S shiny-mirrors

sudo shiny-mirrors config -c Global, Argentina, Brazil, Colombia, Ecuador, Peru, United States -c South America -p Https, Rsync

sudo shiny-mirrors refresh

#Stow dotfiles
git clone https://github.com/ParzivalVulpine/dotfiles
cd dotfiles/
./stow-this.sh

#Download packages
#CLI stuff
paru -S base base-devel fish slack-desktop github-cli btop man-db neovim xdg-utils xdg-ninja xdg-desktop-portal-hyprland starship thefuck tmux fastfetch stow lazygit

#Utils
paru -S hypridle hyprlock hyprpanel hyprpaper hyprpicker hyprpolkitagent hyprsysteminfo rofi-wayland

#Desktop Apps
paru -S ghostty google-chrome slack-desktop spotify discord godot thunderbird telegram steam

git clone https://github.com/ParzivalVulpine/dotfiles
cd dotfiles/
./stow-this.sh

