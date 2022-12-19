# --------------------------------------------------------------------------
#                                 History
# --------------------------------------------------------------------------

# append to the history file, don't overwrite it
shopt -s histappend

# name of the history file to create and log to
HISTFILE="$HOME/.local/state/bash/.history"

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# for setting time stamps on history
HISTTIMEFORMAT="%d/%m/%y %T "
