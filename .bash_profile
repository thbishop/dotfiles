eval $(/opt/homebrew/bin/brew shellenv)
export BASH_SILENCE_DEPRECATION_WARNING=1

source ~/bin/shell.sh
source ~/bin/aws.sh
source ~/bin/git.sh

export PS1="\n\w | \$(date "+%H:%M:%S") \$(__git_ps1 '| [%s]')\n# "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
