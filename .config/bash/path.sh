# --------------------------------------------------------------------------
#   Pathing:   Adhereing as closely as possible to XDG Base Directory Spec
#   https://specifications.freedesktop.org/basedir-spec/latest/
# --------------------------------------------------------------------------
OS=$(uname)

if [[ "$OS" == *"Linux"* ]]; then
    export XDG_DATA_HOME="$HOME/.local"
else
    export XDG_DATA_HOME="$HOME/.local/share"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# this relative is used for both macOS and Debian based distros
pip_path_suffix="lib/python$PYTHON_VERSION/site-packages"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~ LinuxBrew PATH ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
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

    # pip packages installed via linuxbrew will be here (if python is installed via linuxbrew)
    # pip_packages="/home/linuxbrew/.linuxbrew/$pip_path_suffix"

    # pip packages with command line tools install here by default with apt installed python
    export PATH=$PATH:$XDG_DATA_HOME/bin
    # apt installed location of pip installed python3.x packages
    pip_packages="$XDG_DATA_HOME/$pip_path_suffix"
fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ macOS PATH ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
if [[ $(uname) == *"Darwin"* ]]; then

    # iterm2 specific commands and functions
    export PATH=$PATH:$HOME/.local/bin/iterm2

    # don't warn me that BASH is deprecated, becasuse it is already upgraded
    export BASH_SILENCE_DEPRECATION_WARNING=1


    if [ $(uname -a | grep arm > /dev/null ; echo $?) -eq 0 ]; then
        # On apple silicon: brew default installs here
        export PATH=/opt/homebrew/bin:$PATH
        pip_packages="/opt/homebrew/$pip_path_suffix"
    else
        # For older macs before the M1, pre-2020, WITHOUT apple silicon
        export PATH=$HOME/Library/Python/$PYTHON_VERSION/bin:$PATH
        pip_packages="/usr/local/$pip_path_suffix"
    fi

    # Load GNU sed, called gsed, instead of MacOS's POSIX sed
    export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Python ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# python default install location when you: pip$VERSION install --user package
export PATH=$PATH:$HOME/.local/bin:/usr/local/bin

if [[ "$OS" == *"Linux"* ]]; then
    export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME
    export PYTHONUSERBASE=$XDG_DATA_HOME
else
    export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
    export PYTHONUSERBASE=$XDG_DATA_HOME/python
fi

# Run py cmds in this file b4 the 1st prompt is displayed in interactive mode
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/interactive_startup.py

# this is for python virtualenvs
export PYENV_ROOT=$XDG_DATA_HOME/pyenv

# ~~~~~~~~~~~~~~~~~~~ nvm/npm for javascript stuff  ~~~~~~~~~~~~~~~~~~~~~~~~~
# for npm to use XDG stuff
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NVM_DIR="$XDG_DATA_HOME"/nvm
# TODO: loads nvm - maybe goes into devops build?
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ golang ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# to make it more XDG compliant
export GOROOT=$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin:$GOROOT

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ rust ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ general ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker

# Make gradle use XDG
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle

# make wget use XDG
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# make w3m use XDG
export W3M_DIR="~/.local/state/w3m"

# add gcloud to path on macOS because they don't have a homebrew package
export PATH=$PATH:$HOME/.local/bin/google-cloud-sdk/bin
# updates PATH for the Google Cloud SDK.
if [ -f "/Users/$USER/.local/bin/google-cloud-sdk/path.bash.inc" ]; then . "/Users/$USER/.local/bin/google-cloud-sdk/path.bash.inc"; fi
