# dotfiles
> [!NOTE]
> UNDER CONSTRUCTION - SETUP SOON
> SETTING UP WHILE THIS MESSAGE IS HERE
> WILL LIKELY BREAK THINGS
## Requirements
Working Arch Install
## Install
```sh
git clone https://github.com/sharkota/dotfiles.git
cd dotfiles
sh install.sh
```
The above script will give you multiple options to choose from and is reccomended.
If you are cherrypicking files then you can take them from base, desktop, etc.

### Minimal
Mostly neofetch and wal setup, also installs when choosing desktop.
Sets up yay, which will be required for other packages.
### Desktop
Installs minimal, then installs desktop packages.
Adds a custom command to your ~/.bashrc named "krice"
This command is used for managing the background and user avatar easily.
### Addons
Currently, only installs the vencord theme.
The vencord installer will be ran, you can quit it if you already have it installed.