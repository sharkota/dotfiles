#!/bin/bash
echo "────────────────────────────────────────"
echo "Installing packages..."
echo "────────────────────────────────────────"
sudo pacman --noconfirm -S ttf-cascadia-code-nerd python-pywal
#sudo pacman --noconfirm -S --needed git base-devel
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi
yay --noconfirm -S timg neofetch
echo "────────────────────────────────────────"
echo "Updating dotfiles..."
echo "────────────────────────────────────────"
rsync -avh base/.config/ ~/.config/
echo "────────────────────────────────────────"
echo "Base installed!"
echo "────────────────────────────────────────"