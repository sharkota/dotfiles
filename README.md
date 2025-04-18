# dotfiles
> [!NOTE]
> I have not fully tested installing this on a fresh system
> It is possible I forgot important packages for the rice
Minimal Arch Hyprland setup to get a system going.
This only contains the files important to the look of the rice, and does not include things like audio setup and extra utility.
## Preview
![Preview Image](https://raw.githubusercontent.com/sharkota/dotfiles/refs/heads/main/preview/p1.png)
![Preview Image](https://raw.githubusercontent.com/sharkota/dotfiles/refs/heads/main/preview/p2.png)
## Install
Install the packages
```sh
sudo pacman -S neofetch kitty dolphin wal waybar wlogout wofi hyprland hyprlock pavucontrol noto-fonts nerd-fonts
```
Move .config folders to your ~/.config folder
Edit ~/.config/wofi/style.css's first line to match your user name. (I could not get it to work dynamically)
Download the wallpaper and place in ~/Pictures/Wallpapers
reboot :D