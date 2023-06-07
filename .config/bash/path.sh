# --------------------------------------------------------------------------
#   Pathing: Adhereing as closely as possible to XDG Base Directory Spec
#            https://specifications.freedesktop.org/basedir-spec/latest/
# --------------------------------------------------------------------------
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~ Linux PATH ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# iptables on debian is here
export PATH=$PATH:/usr/sbin:/usr/share

# snap package manager installs commands here
# export PATH=$PATH:/snap/bin

# pip packages with command line tools install here by default with apt installed python
export PATH=$PATH:$HOME/.local/bin

# make python do it's cache in ~/.cache/python
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python

# not respected on Debian for some reason :shrug:
# export PYTHONUSERBASE=$XDG_DATA_HOME/python

# apt installed location of pip installed python3.x packages
pip_packages="$HOME/.local/lib/python$PYTHON_VERSION/site-packages"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Python ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# python default install location when you: pip$VERSION install --user package
export PATH=$PATH:$HOME/.local/bin:/usr/local/bin

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

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ pyenv ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
if [ -d "$PYENV_ROOT" ]; then
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    # Load pyenv-virtualenv automatically by adding
    # the following to ~/.bashrc:
    eval "$(pyenv virtualenv-init -)"
fi

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
