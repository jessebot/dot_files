# ------------------------------------------------------------------------- #
#                              Text Editor
# Default, in order of preference (subject to availability): nvim, vim, vi
# ------------------------------------------------------------------------- #

# Default EDITOR is nvim
if [ -n "$(which nvim)" ]; then
    export EDITOR=nvim
# if nvim is not available, set EDITOR to vim
else
    export EDITOR=vim
fi

# always use nvim (or vim) instead of vi
alias vi=$EDITOR
# use nvim instead of vim when available
alias vim=$EDITOR
# I and many others always try to type neovim :)
alias neovim=$EDITOR
alias nivm=$EDITOR
alias ivm=$EDITOR
alias vmi=$EDITOR

# open vi, vim, or nvim to a specific line
# example to open a file to line 255
# lnvim /home/friend/somefile.py:255
lnvim() {
    file=$(echo $1 |cut -f 1 -d ":")
    line=$(echo $1 | cut -f 2 -d ":")
    $EDITOR +$line $file
}

# this is useful because I split a lot of files
alias vsplit="$EDITOR -O"

# make all colors work by default, including via ssh!!
unset TERM
export TERM=xterm-256color
export COLORTERM=truecolor

# -- This is for making some basic resizing working with various cli tools --
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


# ------------------------------------------------------------------------- #
#                              TEXT VIEWING                                 #
# ------------------------------------------------------------------------- #
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# colors for less when displaying man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;35m'

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ cat ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# build current bat cache to index new themes or syntax
# currently broken if a folder called cache exists in the directory where this runs
# bat cache --build > /dev/null || batcat cache --build > /dev/null

# TODO:
# - Write those docs with links to both apps (rich, and bat)
# Take args:
#   -H, --head $NUMBER for head
#   -p                 for enabling pager
#   -t, --tail $NUMBER for tail
#
# Function to use the best syntax highlighting app for the job
function dog {
    # if this is a csv file, ALWAYS use rich to print the data
    if [[ "$1" == *".csv" ]]; then
        rich "$1"
    # if this is a json file, always use jq to pretty print it
    elif [[ "$1" == *".json" ]]; then
        env cat "$1" | jq
    # if this is a YAML file, always use yq to pretty print and validate it
    # if using yq fails, fall back to bat & redirect errors to the shadow realm
    elif [[ "$1" == *".yaml" ]] || [[ "$1" == *".yml" ]]; then
        env cat "$1" | yq 2> /dev/null || bat --plain --theme=spacechalk --pager=never "$1"
    else
        # use batcat - syntax highlighting + git support
        bat --plain --theme=spacechalk --pager=never "$1" || batcat --pager=never --theme=spacechalk --plain "$1"
    fi
}

alias raw='env cat'
alias cat='dog'
