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
export PATH="$HOME/.local/bin:$PATH"
export FZF_DEFAULT_COMMAND='fd -H --type f'
export FZF_DEFAULT_OPTS="--height 80% --layout=reverse --border=rounded" 
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
shopt -s autocd
shopt -s histappend
# export PATH="$HOME/.emacs/bin:$PATH"
# alias fbat="fzf --preview 'bat --color=always {}' --preview-window '~3'"

BOLD='\[\033[1m\]'
RED='\[\033[38;2;255;0;0m'
BLUE='\[\033[38;2;5;217;232m'
GREEN='\033[38;2;22;255;22m'
RESET='\033[0m'


alias grep='grep --color=auto'
PS1='[   ] [ \W ] '

alias br='source ~/.bashrc'
alias c='clear'
alias cl='clear && ls'

alias ls='lsd -a --group-directories-first --color=always'
alias ll='lsd -al --group-directories-first'

alias chx='chmod +x'

alias cron='EDITOR=vim crontab -e'
alias cron-log='journalctl -u cronie.service'


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
alias sl="spotify_player like && echo -e \"${GREEN}          Liked - $(playerctl --player=spotify_player metadata -f '{{trunc(artist, 20)}} - {{trunc(title, 20)}}')${RESET}\n\""
alias sn='spotify_player playback next'


# FZF demnu
alias menu='$(compgen -c | sort -u | fzf | xargs which &)'

alias kill-wifi='sudo nmcli dev disconnect wlo1'

alias HR='hyprctl reload'

alias MNT-NFS="sudo mount -t nfs -o vers=4 192.168.254.21:/srv/nfs/DataT ~/mnt/DataT"
alias MNT-300="sudo mount -t nfs -o vers=4 192.168.254.21:/srv/nfs/Data3 ~/mnt/Data3"

alias bin='cd ~/.local/bin && ls'
alias cfg='cd ~/.config && ls'
alias d='cd ~/Downloads && ls'

alias bs='bspc config top_padding 0'

function show_color_palette() {
    local file="$1"
    local colors=()
    local count=1

    # Read the hex color list from the file
    while IFS= read -r color; do
        colors+=("$color")
    done < "$file"

    # Output color blocks with a count, each on a new line, adding a space for 1-9
    for color in "${colors[@]}"; do
        # Remove the leading '#' character
        color="${color#\#}"
        # Convert hex to decimal RGB values
        local r=$((16#${color:0:2}))
        local g=$((16#${color:2:2}))
        local b=$((16#${color:4:2}))
        # Add an empty space before the count for numbers 1-9
        if [ $count -lt 10 ]; then
            printf " %d: \e[48;2;%d;%d;%dm    \e[0m\n" "$count" "$r" "$g" "$b"
        else
            printf "%d: \e[48;2;%d;%d;%dm    \e[0m\n" "$count" "$r" "$g" "$b"
        fi
        ((count++))
    done
}