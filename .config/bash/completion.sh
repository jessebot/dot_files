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

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ macOS completion ~~~~~~~~~~~~~~~~~~~~~~~~~ #
if [[ $(uname) == *"Darwin"* ]]; then

    if [ $(uname -a | grep arm > /dev/null ; echo $?) -eq 0 ]; then
        # bash completion on macOS (arm64)
        if [ -f "/opt/homebrew/etc/profile.d/bash_completion.sh" ]; then
            . "/opt/homebrew/etc/profile.d/bash_completion.sh"
        fi
        complete -C /opt/homebrew/bin/terraform terraform
    else
        # bash completion on macOS (x86)
        if [ -f "/usr/local/etc/profile.d/bash_completion.sh" ]; then
            . "/usr/local/etc/profile.d/bash_completion.sh"
        fi
    fi
fi


# This loads nvm (for node.js) bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ gcloud ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# enables shell command completion for gcloud.
if [ -f "$HOME/.local/bin/google-cloud-sdk/completion.bash.inc" ]; then
	. "$HOME/.local/bin/google-cloud-sdk/completion.bash.inc"
fi

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ jump ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# https://github.com/gsamokovarov/jump
# remembers directories overtime and helps with auto-completion
# I never use this though...
# eval "$(jump shell bash)"

source ~/.config/bash/lima_completion.sh
source ~/.config/bash/helm_completion.sh
