# just to make sure we always source .bashrc
source ~/.bashrc

# this is the iterm2 shell integration stuff, making it use XDG_CONFIG_HOME
source "${HOME}/.config/iterm2/shell_integration.sh"

# iterm2 specific commands and functions
export PATH=$PATH:$HOME/.local/bin/iterm2
