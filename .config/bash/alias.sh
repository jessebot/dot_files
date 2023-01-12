# --------------------------------------------------------------------- #
#                           SHELL ALIASES                               #
# --------------------------------------------------------------------- #

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~ MacOS Specific ~~~~~~~~~~~~~~~~~~~~~~~~~~ #
if [[ $(uname) == *"Darwin"* ]]; then
    # Always use GNU sed
    alias sed='gsed'
else
    # wezterm requires this if it's installed via flatpak
    alias wezterm='flatpak run org.wezfurlong.wezterm'
    # steam only seems to work through flatpak on debian
    alias steam="flatpak run com.valvesoftware.Steam"
    # freetube only seems to work through flatpak on debian
    alias freetube="flatpak run io.freetubeapp.FreeTube"
fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Typos <3 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
alias pign='ping'
alias gtop='gotop'
# can never spell clear
alias celar='clear'
alias clar='clear'
# clear, but in dutch
alias leegmaken='clear'
# can't spell tree
alias ter='tree'
alias tre='tree'
alias tere='tree'

# can't spell python
alias pthyon="python$PYTHON_VERSION"
alias ptyhon="python$PYTHON_VERSION"
alias pythong="python$PYTHON_VERSION"
# alias because versions lower than python$PYTHON_VERSION still in some places
alias python="python$PYTHON_VERSION"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ General ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

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

# quick to do
alias todo="$EDITOR ~/todo.md"

# so that w3m uses the correct XDG config location
alias w3m="w3m -sixel -config ~/.config/w3m/config"

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
alias gsa='ls -1 -A | xargs -I % sh -c "if [ -d % ]; then toilet -f smblock % | lolcat ; cd %; git status --short; cd - > /dev/null; echo ''; fi"'
alias gd='git diff'
alias ga='git add .'
alias gph='git push && git push --tags'
alias gpl='git pull'

# typos
alias gitcommit='git commit'
alias gitadd='git add'
alias gti='git'
alias gtt='git'

# glab is gitlab's cli, but I always type gl by accident
alias gl='glab'

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
