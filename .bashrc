#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
#################################
# END OF DEFAULT BASHRC
#################################
# Startup
# Pywal is ran once at hyprland startup, this just applies it to the terminal when opened
cat ~/.cache/wal/sequences
# Aliases/Alias Functions
# Online Manual
wtfis() {
    curl cheat.sh/$1
}
# Get it?
alias nay='yay --noconfirm'
# Handy for repairing quickly
alias vencord='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'