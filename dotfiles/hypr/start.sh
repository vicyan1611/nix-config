#!/user/bin/env bash
swww-daemon &

swww img ~/nix-config/Wallpapers/afternoon.png &
# the bar
waybar &

nm-applet &

# notification
dunst 
