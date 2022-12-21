# --------------------------------------------------------------------------
#                                 Pathing
#          Adhereing as closely as possible to XDG Base Directory Spec:
#            https://wiki.archlinux.org/title/XDG_Base_Directory
# --------------------------------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

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
    # pip packages installed via linuxbrew will be here
    pip_packages="/home/linuxbrew/.linuxbrew/lib/python$PYTHON_VERSION/site-packages"
fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Python ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# python default install location when you do: pip$PYTHON_VERSION install --user package
export PATH=$PATH:$HOME/.local/bin:/usr/local/bin

# make python do it's cache in ~/.cache/python
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
# Run py cmds in this file b4 the 1st prompt is displayed in interactive mode
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/interactive_startup.py

# this is for python virtualenvs
export PYENV_ROOT=$XDG_DATA_HOME/pyenv

# ~~~~~~~~~~~~~~~~~~~ nvm/npm for javascript stuff  ~~~~~~~~~~~~~~~~~~~~~~~~~
export NVM_DIR="$XDG_DATA_HOME"/nvm
# also for js stuff
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ golang ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TODO: probably should look into this one, to make it more XDG compliant
GOROOT=$HOME
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

# ~~~~~~~~~~~~~~~~~~~~~~~~ other ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Make gradle use XDG
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle

# make wget use XDG
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

# make w3m use XDG
export W3M_DIR="~/.local/state/w3m"
