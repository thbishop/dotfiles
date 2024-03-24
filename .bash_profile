eval $(/opt/homebrew/bin/brew shellenv)
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

export BASH_SILENCE_DEPRECATION_WARNING=1

source ~/bin/shell.sh
source ~/bin/aws.sh
source ~/bin/git.sh
