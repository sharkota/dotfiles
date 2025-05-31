#!/bin/bash
echo "───────────────────────────────────────────────────────"
echo "Choose setup, README.md for more info"
echo "───────────────────────────────────────────────────────"
echo "Please make backups of your .config, mainly hyprland"
echo "───────────────────────────────────────────────────────"

options=("minimal" "desktop" "addons" "apply config only" "quit")
select opt in "${options[@]}"; do
  case $REPLY in
    1) echo "starting...";
    sh base/run.sh
    break ;;
    2) echo "starting...";
    sh base/run.sh
    sh desktop/run.sh
    break ;;
    3) echo "starting...";
    sh addons/run.sh
    break ;;
    4) echo "starting...";
    rsync -avh base/.config/ ~/.config/
    rsync -avh desktop/.config/ ~/.config/
    echo "Config applied! Source your .bashrc or restart the terminal."
    break ;;
    5) echo "quitting...";
    
    break ;;
    *) echo "invalid option!";;
  esac
done
