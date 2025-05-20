#!/bin/bash
echo "────────────────────────────────────────"
echo "Addons requires Discord! Will install Vencord."
echo "────────────────────────────────────────"
read -p "Do you want to continue? [Y/n] " answer
case "$answer" in
    [Nn]* ) echo "Aborted."; exit 1;;
esac
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
yay --noconfirm -S ttf-comfortaa
echo "────────────────────────────────────────"
echo "Updating dotfiles..."
echo "────────────────────────────────────────"
rsync -avh addons/.config/ ~/.config/
echo "────────────────────────────────────────"
echo "Addons installed! Go enable themes."
echo "────────────────────────────────────────"