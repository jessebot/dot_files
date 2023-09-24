# --------------------------------------------------------------------- #
#                           SHELL ALIASES                               #
# --------------------------------------------------------------------- #

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~ MacOS Specific ~~~~~~~~~~~~~~~~~~~~~~~~~~ #
if [[ $(uname) == *"Darwin"* ]]; then
    # Always use GNU sed
    alias sed='gsed'
else
    # freetube only seems to work through flatpak on debian
    # alias freetube="flatpak run io.freetubeapp.FreeTube"
    # lutris works better through flatpak
    alias lutris="flatpak run net.lutris.Lutris"
fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Typos <3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
alias peotry='poetry'
alias pign='ping'
alias gtop='btm'
alias gotop='btm'
# can never spell clear
alias celar='clear'
alias clar='clear'
# clear, but in dutch
alias leegmaken='clear'
# can't spell tree
alias ter='tree'
alias tre='tree'
alias tere='tree'
# can't spell docker
alias docekr='docker'

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Python 🐍 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# can't spell python
alias pip="pip$PYTHON_VERSION"
alias pthyon="python$PYTHON_VERSION"
alias ptyhon="python$PYTHON_VERSION"
alias pythong="python$PYTHON_VERSION"
# alias because versions lower than python$PYTHON_VERSION still in some places
alias python="python$PYTHON_VERSION"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ General ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# allow setting wezterm tab title more easily
alias tab='wezterm cli set-tab-title'

# makes wget XDG compliant (this goes to ~/.local/share/wget/wget-hsts)
mkdir -p $XDG_DATA_HOME/wget/wget-hsts
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget/wget-hsts"'

# colordiff - diff, but with colors for accessibility
alias diff='colordiff -uw'

# we love a good tracer t
alias tracert='traceroute'

# whoami, whereami, whoareyou?
alias whereami='hostname'
alias whoareyou='echo "I am $HOSTNAME, your favorite computer 🥰"'

# scrncpy installs adb for you, but it's awkward to use, so we just alias it
alias adb='scrcpy.adb'

# I never remember what the img2sixel command is called
alias sixel='img2sixel'
alias imgcat='wezterm imgcat'

# use btm instead of top for live system TUI dashboard
alias top='btm'

# quick to do
alias todo="$EDITOR ~/todo.md"

# so that w3m uses the correct XDG config location
alias w3m="w3m -sixel -config ~/.config/w3m/config"

# to run my main dev environment container
# run the docker container with my local repos dir and local ssh keys as well as my timezone already set 
if [[ "$(arch)" == "arm64" ]]; then
    alias do-ide="docker run -it --platform=linux/arm64 -it -v ~/repos:/home/friend/repos -v ~/.ssh:/home/friend/.ssh --env 'TZ=Europe/Brussels' --rm jessebot/onboardme:latest-arm"
    alias do-devops="docker run -it --platform=linux/arm64 -it -v ~/repos:/home/friend/repos -v ~/.ssh:/home/friend/.ssh --env 'TZ=Europe/Brussels' --rm jessebot/onboardme:arm-devops"
    alias do-full="docker run -it --platform=linux/arm64 -it -v ~/repos:/home/friend/repos -v ~/.ssh:/home/friend/.ssh --env 'TZ=Europe/Brussels' --rm jessebot/onboardme:arm-full-tui"
else
    alias do-ide="docker run -it -v ~/repos:/home/friend/repos -v ~/.ssh:/home/friend/.ssh --env 'TZ=Europe/Brussels' --rm jessebot/onboardme:latest"
    alias do-devops="docker run -it -v ~/repos:/home/friend/repos -v ~/.ssh:/home/friend/.ssh --env 'TZ=Europe/Brussels' --rm jessebot/onboardme:devops"
    alias do-full="docker run -it -v ~/repos:/home/friend/repos -v ~/.ssh:/home/friend/.ssh --env 'TZ=Europe/Brussels' --rm jessebot/onboardme:full-tui"
fi


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ls ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# lsd instead of ls for colors/icons
alias ls='lsd -a'
# lsd and list long, human readable file sizes, show hidden files
alias ll='lsd -hal'
# sort by most recent and reversed, so the most recent file is the last
# helpful for directories with lots of files
alias lt='lsd -atr'
# same as above, but long
alias llt='lsd -haltr'
# lsd already has a fancier tree command with icons
alias tree='lsd --tree --depth=2'

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ grep ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# always use colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias grpe='grep'
alias gerp='grep'

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ git ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

alias gc='git commit -m'
alias gs='git status'
# check all directories below current directory for their git status
alias gsa='ls -1 -A | xargs -I % sh -c "if [ -d % ]; then toilet --gay -f smblock %; cd %; git status --short; cd - > /dev/null; echo ''; fi"'
alias gd='git diff'
alias ga='git add .'
alias gph='git push && git push --tags'
alias gp='git pull && git log -1'

# glab is gitlab's cli, but I always type gl by accident
alias gl='glab'

# typos
alias gitcommit='git commit'
alias gitadd='git add'
alias gti='git'
alias gtt='git'

# Function to fix gi typos
function gi {
    if [[ $1 = "tpull" || $1 = "pull" ]]; then
        git pull
    elif [ $1 = "tpush" ]; then
        shift
        git push $@
    elif [ $1 = "tdiff" ]; then
        # this drops the tdiff arg and then starts the arg array at the next arg
        shift
        # $@ is all of the arguments passed in
        git diff "$@"
    elif [ $1 = "tcommit" ]; then
        # this drops the tcommit arg and then starts the arg array at the next arg
        shift
        # $@ is all of the arguments passed in
        git commit "$@"
    fi
}

function gita {
    if [[ $1 = "dd" ]]; then
        shift
        git add $@
    fi
}


# -------------------------------------------------------------------------- #
# --------------------------  CUSTOM FUNCTIONS ----------------------------- #
# -------------------------------------------------------------------------- #

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ag (search repos) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
function agr {
    if [ $2 = "y"]; then
        for $repo in $(ls -1 $REPOS); do
            cd $REPOS/$repo && git pull
        done
    fi
    ag $1 $REPOS
}

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ base64 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

function b64 {
    echo -n $1 | base64
}

# set decode to be base64 decode
function decode {
    echo -n $1 | base64 --decode
}

## MORE ALIASES IN text_editing.sh
