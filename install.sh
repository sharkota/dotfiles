#!/bin/bash
echo "────────────────────────────────────────"
echo "Choose setup, README.md for more info"
echo "────────────────────────────────────────"

options=("minimal" "desktop" "addons" "quit")
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
    4) echo "quitting...";
    
    break ;;
    *) echo "invalid option!";;
  esac
done
