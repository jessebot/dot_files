# ------------------------------------------------------------------------- #
#                              Text Editor
# Default, in order of preference (subject to availability): nvim, vim, vi
# ------------------------------------------------------------------------- #

# make vim use the XDG Base Dir Spec (store in ~/.config/vim/vimrc)
alias vim="VIMINIT='source "$XDG_CONFIG_HOME/vim/vimrc"' vim"

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

# make all colors work by default
export TERM=xterm-256color

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

# TODO: Write those docs with links to both apps (rich, and bat)
# Function to use the best syntax highlighting app for the job
function dog {
    # if file has more lines than legnth of the terminal use app with pager
    too_long=false
    if [ $(wc -l $1 | awk '{print $1}') -gt $(tput lines) ]; then
        too_long=true
    fi

    # if this is a markdown or csv file, ALWAYS use rich to print the data
    if [[ "$1" == *".md" ]] || [[ "$1" == *".csv" ]]; then
        if $too_long; then
            # pager allows moving with j for down, k for up, and :q for quit
            rich --pager $1
        else
            rich $1
            echo ""
        fi
    else
        # use batcat - sytnax highlighting + git support and pager
        bat $1
    fi
}

alias raw='env cat'
alias cat='dog'
