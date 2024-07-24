#!/usr/bin/env bash

: "${CM_LAUNCHER=rofi}"
: "${CM_HISTLENGTH=8}"

shopt -s nullglob

cache_dir=$(clipctl cache-dir)
cache_file=$cache_dir/line_cache

# Not -h, see #142
if [[ $1 == --help ]]; then
    cat << 'EOF'
clipmenu is a simple clipboard manager using dmenu and xsel. Launch this
when you want to select a clip.

All arguments are passed through to dmenu itself.

Environment variables:

- $CM_DIR: specify the base directory to store the cache dir in (default: $XDG_RUNTIME_DIR, $TMPDIR, or /tmp)
- $CM_HISTLENGTH: specify the number of lines to show in dmenu/rofi (default: 8)
- $CM_LAUNCHER: specify a dmenu-compatible launcher (default: dmenu)
- $CM_OUTPUT_CLIP: if set, output clip selection to stdout
EOF
    exit 0
fi

if ! [[ -f "$cache_file" ]]; then
    printf '%s\n' 'No cache file yet, did you run clipmenud?'
    exit 2
fi

# Blacklist of non-dmenu launchers
launcher_args=(-l "${CM_HISTLENGTH}")
if [[ "$CM_LAUNCHER" == fzf ]]; then
    launcher_args=()
fi

# rofi supports dmenu-like arguments through the -dmenu flag. -p wastes space
# in real dmenu, but rofi shows "dmenu:" anyway, so pass it here only.
[[ "$CM_LAUNCHER" == rofi ]] && set -- -dmenu -p clipmenu "$@"

list_clips() {
    LC_ALL=C sort -rnk 1 < "$cache_file" | cut -d' ' -f2- | awk '!seen[$0]++'
}

if [[ "$CM_LAUNCHER" == rofi-script ]]; then
    if (( $# )); then
        chosen_line="${!#}"
    else
        list_clips
        exit
    fi
else
    chosen_line=$(list_clips | "$CM_LAUNCHER" "${launcher_args[@]}" "$@")
    launcher_exit=$?
fi

[[ $chosen_line ]] || exit 1
file=$cache_dir/$(cksum <<< "$chosen_line")
[[ -f "$file" ]] || exit 2

for selection in clipboard primary; do
    xsel --logfile /dev/null -i --"$selection" < "$file"
done

if (( CM_OUTPUT_CLIP )); then
    cat "$file"
fi

exit "${launcher_exit:-"$?"}"
