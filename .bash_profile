# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ macOS PATH ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
if [[ $(uname) == *"Darwin"* ]]; then
    # this is the iterm2 shell integration stuff, making it use XDG_CONFIG_HOME
    source $HOME/.config/bash/iterm2_integration.sh

    # iterm2 specific commands and functions
    export PATH=$PATH:$HOME/.local/bin/iterm2

    # this is for macs without apple silicon, e.g. before M1
    export PATH=$PATH:$HOME/Library/Python/3.11/bin

    # don't warn me that BASH is deprecated, becasuse it is already upgraded
    export BASH_SILENCE_DEPRECATION_WARNING=1

    pip_path="lib/python3.11/site-packages"

    # check if this apple silicon
    if [ $(uname -a | grep arm > /dev/null ; echo $?) -eq 0 ]; then
        # On M1/M2: brew default installs here
        export PATH=/opt/homebrew/bin:$PATH
        pip_packages="/opt/homebrew/$pip_path"
    else
        # For older macs before the M1, pre-2020
        pip_packages="/usr/local/$pip_path"
    fi

    # Load GNU sed, called gsed, instead of MacOS's POSIX sed
    export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH

    # Always use GNU sed
    alias sed='gsed'
fi

# just to make sure we always source .bashrc
source ~/.bashrc
