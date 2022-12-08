# this file needs maintanence and has not been truly updated in years. There may be 🐛

# make noise stop
unsetopt beep

setopt extended_glob
setopt PROMPT_SUBST
setopt TRANSIENT_RPROMPT
export RPROMPT='${vcs_info_msg_0_} %(1j.%B%j%b.)%(2L.%U%L%u.)'
export HOSTNAME=`hostname`
export CORRECT_IGNORE="_*"

# Set a more permissive history
export HISTSIZE=2000
export HISTFILE=~/.zsh_history
export SAVEHIST=2000
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_NO_STORE
setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
#this is irritating, so I commented it. who are you though? and why?!
#setopt SHARE_HISTORY

# tab completion for PID :D
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# Ignore _functions for commands that don't exist
zstyle ':completion:*:functions' ignored-patterns '_*'

# With commands like `rm' it's annoying if one gets offered the same
# filename again even if it is already on the command line. To avoid
# that:
zstyle ':completion:*:rm:*' ignore-line yes

# Set some history/date aliases
alias history="history 0"
alias now="date +%H%M%S"
alias now:="date +%T"
alias today="date +%Y%m%d"
alias today_="date +%Y_%m_%d"
alias vi=nvim
alias sharehistory="fc -RI"

# basic aliases
alias ls="lsd"
alias raw="env cat"
alias cat="bat"
alias gs="git status"

if which lesspipe 1>/dev/null 2>&1; then
    eval "`lesspipe`"
fi

POWERLINE_CONFIG_PATHS=( ~/.config/powerline_zsh )
. /usr/local/lib/python3.11/site-packages/powerline/bindings/zsh/powerline.zsh
