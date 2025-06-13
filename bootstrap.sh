#!/usr/bin/env bash

#Download packages
#CLI stuff
paru -S base base-devel fish slack-desktop github-cli btop man-db neovim xdg-utils xdg-ninja xdg-desktop-portal-hyprland starship thefuck tmux fastfetch stow lazygit tldr zoxide fastfetch

#ags-hyprpanel-git
sudo pacman -S --needed wireplumber libgtop bluez bluez-utils btop dart-sass wl-clipboard brightnessctl swww python upower pacman-contrib power-profiles-daemon gvfs wf-recorder
paru -S --needed aylurs-gtk-shell-git grimblast-git hyprpicker matugen-bin hyprsunset-git

#Utils
paru -S hypridle hyprlock ags-hyprpanel-git hyprpaper hyprpicker hyprpolkitagent hyprsysteminfo rofi-wayland ttf-space-mono-nerd

#Desktop Apps
paru -S ghostty google-chrome slack-desktop spotify discord godot thunderbird telegram-desktop

#Neovim deps
paru -S fzf curl ripgrep fd tree-sitter-cli

sudo chsh -s /usr/bin/fish

sudo reboot now
