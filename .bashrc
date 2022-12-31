#                      @jessebot's personal .bashrc
# -------------------------------------------------------------------------- #
#                                 General                                    #
# -------------------------------------------------------------------------- #

# fixes "scp: Received message too long 169564991" error
# If not running interactively, don't do anything, no outputs
case $- in
    *i*) ;;
      *) return;;
esac


# I hate bells a lot
set bell-style none

# python version is subject to change, but really important for pathing
export PYTHON_VERSION="3.11"

# this just makes howdoi use colors
export HOWDOI_COLORIZE=1

# makes gpg prompt for passphrase in the terminal for git commit -S
export GPG_TTY=$(tty)

# source all the pathing exports including XDG Base Dir Spec env vars
. ~/.config/bash/path.sh

# history settings are in this file (this relies on path.sh being sourced)
. $XDG_CONFIG_HOME/bash/history.sh

# everything to do with things like less and editors is in here
. $XDG_CONFIG_HOME/bash/text_editing.sh

# aliases are all confined to this file
. $XDG_CONFIG_HOME/bash/alias.sh

# k8s aliases and configuration
. $XDG_CONFIG_HOME/bash/k8s.sh

# load additional bash completion for different commands
. $XDG_CONFIG_HOME/bash/completion.sh

# -------------------------------------------------------------------------- #
#                            Other Load on start                             #
# -------------------------------------------------------------------------- #

# include external rc files in ~/.config/bash/personal if they exist
personal_rc_file="$XDG_CONFIG_HOME/bash/personal/bashrc"
if [ -f $personal_rc_file ]; then
    . $personal_rc_file
fi

# for powerline, a fancy extensible prompt: https://powerline.readthedocs.io
if [ -f $pip_packages/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . $pip_packages/powerline/bindings/bash/powerline.sh
fi

# -------------------------------------------------------------------------- #
#                            PERSONAL MOTD                                   #
# -------------------------------------------------------------------------- #
# run fastfetch, a system facts cli script, immediately when we login anywhere
fastfetch
