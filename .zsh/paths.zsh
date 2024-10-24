# ~/.zsh/paths.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"

# MySQL
export PATH=${PATH}:/usr/local/mysql/bin/

# Ant
export ANT_HOME=/usr/local/ant
export PATH=$PATH:$ANT_HOME/bin

# ID360 Related
export SERVERS_PATH="$HOME/Developer/official/servers"
export SCRIPTS_PATH="$HOME/Developer/official/scripts"

# Other paths
export GPG_TTY=$(tty)   # For gpg key generation work

# SDKMAN Setup
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
