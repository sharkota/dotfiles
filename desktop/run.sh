#!/bin/bash
echo "────────────────────────────────────────"
echo "Installing packages..."
echo "────────────────────────────────────────"
yay --noconfirm -S kitty wofi hyprland hyprpaper hyprlock hyprpolkitagent hyprshot ffmpeg imagemagick
echo "────────────────────────────────────────"
echo "Updating dotfiles..."
echo "────────────────────────────────────────"
rsync -avh desktop/.config/ ~/.config/
echo "────────────────────────────────────────"
echo "Applying Colors..."
echo "────────────────────────────────────────"
wal -i ~/.config/krice/wal.png
echo "────────────────────────────────────────"
echo "Desktop installed!"
echo "────────────────────────────────────────"
echo "Copy the functions from the git's .bashrc to yours for the krice-set function.
It is done this way so that you will only add the source once."