#  _____ _           ____                     _   _ _        _       
# |_   _| |__   ___ / ___| __ _ ___ ___ _   _| \ | (_)_ __  (_) __ _ 
#   | | | '_ \ / _ \ |  _ / _` / __/ __| | | |  \| | | '_ \ | |/ _` |
#   | | | | | |  __/ |_| | (_| \__ \__ \ |_| | |\  | | | | || | (_| |
#   |_| |_| |_|\___|\____|\__,_|___/___/\__, |_| \_|_|_| |_|/ |\__,_|
#                                       |___/             |__/       
#   Spawned: Fri Apr 05 2024 - 08:02
#  Last Mod: Mon Apr 22 2024 - 21:26
#  Config: .bashrc
#  Depends:
#  Note:
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

EDITOR="/usr/bin/vim"
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
shopt -s autocd
#export EDITOR
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.emacs/bin:$PATH"
export FZF_DEFAULT_COMMAND='fd -H --type f'
export FZF_DEFAULT_OPTS="--height 80% --layout=reverse --border=rounded" alias fbat="fzf --preview 'bat --color=always {}' --preview-window '~3'"
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export HISTSIZE=10000

BOLD='\[\033[1m\]'
RED='\[\033[38;2;255;0;0m'
BLUE='\[\033[38;2;5;217;232m'
GREEN='\[\033[38;2;22;255;22m'
RESET='\[\033[0m\]'


alias grep='grep --color=auto'
PS1='[   ] [ \W ] '

alias br='source ~/.bashrc'
alias c='clear'
alias cl='clear && ls'

alias ls='lsd -a --group-directories-first $1'
alias ll='lsd -al --group-directories-first'

alias chx='chmod +x'

alias cron='EDITOR=vim crontab -e'

alias pac='sudo pacman -S'
alias pac-rm='sudo pacman -Rs'
alias pac-srch='sudo pacman -Ss'
alias pac-info='sudo pacman -Qi'
alias update='sudo pacman -Syu && echo "0" > ~/.local/tmp/UPDATES.txt'
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -500 | nl > ~/rip.txt"


alias vup='pactl set-sink-volume 0 +10%'
alias vdn='pactl set-sink-volume 0 -10%'
# Spotify_Player things
alias NP='cmd-playerctl'
alias sp='playerctl --player=spotify_player play-pause'
alias sl='spotify_player like'
alias sn='spotify_player playback next'


# FZF demnu
alias menu='$(compgen -c | sort -u | fzf | xargs which &)'



