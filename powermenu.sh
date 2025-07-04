#!/usr/bin/env bash
#
# define menu entries
options=("Logout" "Shutdown" "Reboot")

# show Rofi dmenu, exit if Esc or no selection
choice=$(printf '%s\n' "${options[@]}" |
  rofi -dmenu -i -p "Power:") || exit 1

# act on the choice
case "$choice" in
Logout) hyprctl dispatch exit ;;
Shutdown) systemctl poweroff ;;
Reboot) systemctl reboot ;;
*) exit 1 ;;
esac
