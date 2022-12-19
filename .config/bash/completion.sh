# -------------------------------------------------------------------------- #
#                           TAB COMPLETION                                   #
# -------------------------------------------------------------------------- #

# ~~~~~~~~~~~~~~~~ enable programmable completion features ~~~~~~~~~~~~~~~~~ #
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Terraform ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
complete -C /usr/local/bin/terraform terraform

# This loads nvm (for node.js) bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
