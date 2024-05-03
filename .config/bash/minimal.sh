#             @jessebot's minimal browser focused rc file                    #
##############################################################################

source ~/.config/bash/history.sh

# -------------------------------------------------------------------------- #
#                                 Pathing                                    #
# -------------------------------------------------------------------------- #
# python version is subject to change
export PYTHON_VERSION="3.12"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Linux PATH ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
if [[ $(uname) == *"Linux"* ]]; then

    # iptables on debian is here
    export PATH=$PATH:/usr/sbin:/usr/share

    # snap package manager installs commands here
    export PATH=$PATH:/snap/bin

    # HomeBrew on Linux needs all of this to work
    export HOMEBREW_PREFIX=/home/linuxbrew/.linuxbrew
    export HOMEBREW_CELLAR=/home/linuxbrew/.linuxbrew/Cellar
    export HOMEBREW_REPOSITORY=/home/linuxbrew/.linuxbrew/Homebrew
    export MANPATH=$MANPATH:/home/linuxbrew/.linuxbrew/share/man
    export INFOPATH=$INFOPATH:/home/linuxbrew/.linuxbrew/share/info
    export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin
    # pip packages installed via linuxbrew will be here
    pip_packages="/home/linuxbrew/.linuxbrew/lib/python$PYTHON_VERSION/site-packages"
fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ macOS PATH ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# python default install location when you do: pip$PYTHON_VERSION install --user package
export PATH=$PATH:$HOME/.local/bin
# this is for macs without apple silicon, e.g. before M1
export PATH=$PATH:/usr/local/bin:$HOME/Library/Python/$PYTHON_VERSION/bin

if [[ $(uname) == *"Darwin"* ]]; then
    # don't warn me that BASH is deprecated, becasuse it is already upgraded
    export BASH_SILENCE_DEPRECATION_WARNING=1
    # bash completion on macOS
    if [ -f "/usr/local/etc/profile.d/bash_completion.sh" ]; then
        # sources bash completion
        . "/usr/local/etc/profile.d/bash_completion.sh"
    fi

    pip_path="lib/python$PYTHON_VERSION/site-packages"

    # check if this apple silicon
    if [ $(uname -a | grep arm > /dev/null ; echo $?) -eq 0 ]; then
        # On M1/M2: brew default installs here
        export PATH=/opt/homebrew/bin:$PATH
        pip_packages="/opt/homebrew/$pip_path"
    else
        # For older macs before the M1, pre-2020
        pip_packages="/usr/local/$pip_path"
    fi
fi

source ~/.config/bash/text_editing.sh
