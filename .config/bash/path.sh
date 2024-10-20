# --------------------------------------------------------------------------
#   Pathing:   Adhereing as closely as possible to XDG Base Directory Spec
#   https://specifications.freedesktop.org/basedir-spec/latest/
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

    # pip packages with command line tools install here by default with apt installed python
    export PATH=$PATH:$HOME/.local/bin

    # make python do it's cache in ~/.cache/python
    export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
    # not respected on Debian for some reason :shrug:
    # export PYTHONUSERBASE=$XDG_DATA_HOME/python

    # apt installed location of pip installed python3.x packages
    pip_packages="$HOME/.local/lib/python$PYTHON_VERSION/site-packages"
    #
    # pip packages installed via linuxbrew will be here (if python is installed via brew)
    # pip_packages="/home/linuxbrew/.linuxbrew/lib/python$PYTHON_VERSION/site-packages"
fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ macOS PATH ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# powerline - a fancy extensible prompt: https://powerline.readthedocs.io
if [[ $(uname) == *"Darwin"* ]]; then
    # don't warn me that BASH is deprecated, becasuse it is already upgraded
    export BASH_SILENCE_DEPRECATION_WARNING=1

    # make python do it's cache in ~/.cache/python
    export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
    # put python data into $HOME/.local/share/python
    export PYTHONUSERBASE=$XDG_DATA_HOME/python

    # this is for python XDG spec stuff
    export PATH="$PYTHONUSERBASE/bin:$PATH"

    if [ $(uname -a | grep arm > /dev/null ; echo $?) -eq 0 ]; then
        # On apple silicon: brew default installs here
        export PATH=/opt/homebrew/bin:$PATH

        # use linux/amd64 platform by default on macOS - may break KinD!
        # export DOCKER_DEFAULT_PLATFORM=linux/amd64

    else
        if [ ! -f "/usr/local/bin/python" ]; then
            # this will link python3.11 to python which will fix poetry issues
            # ref: https://stackoverflow.com/a/74582011/3547184
            ln -s -f /usr/local/bin/python3.12 /usr/local/bin/python
        fi
    fi

    # Load GNU sed, called gsed, instead of MacOS's POSIX sed
    export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH

    pip_packages="$XDG_DATA_HOME/python/lib/python/site-packages"
fi

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
# make sure we can run programs installed via npm
export PATH=$PATH:$XDG_DATA_HOME/npm/bin

export NVM_DIR="$XDG_DATA_HOME"/nvm
# TODO: loads nvm - maybe goes into devops build?
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ golang ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# to make it more XDG compliant
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/.local/bin/go

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

# make sure we make all yamllint changes for safer linting
export YAMLLINT_CONFIG_FILE="$XDG_CONFIG_HOME/yamllint/config.yml"

# linkerd - service mesh cli for k8s
export PATH="$PATH:$HOME/.linkerd2/bin"

