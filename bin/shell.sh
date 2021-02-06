set -o vi

export PATH=~/bin/:~/dev/bin:$PATH
export EDITOR=vim
export GPG_TTY=$(tty)
export HISTSIZE=15000
export HISTFILESIZE=15000
export HISTCONTROL=ignoreboth
export BASH_SILENCE_DEPRECATION_WARNING=1

alias ackv="ack --ignore-dir vendor"
alias cddltmp="cd ~/Downloads/tmp"
alias brewup="brew update && brew outdated"
alias duls="du -hd 1"
alias flushdns="dscacheutil -flushcache"
alias hgrep="history | grep"
alias ldate="date +%Y-%m-%dT%H:%M:%S%z"
alias p="ping"
alias pgrep="ps -A -o pid,ppid,user,command | grep -i "
alias rmnl="truncate -s -1 "
alias s="open"
alias senv="env | sort | less"
alias sshno="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias te=tmux_env
alias unixnow="date +%s"
alias x=exit

# CDPATH
cdpath=(
    $HOME/dev
    $HOME/dev/github.com/thbishop
)
export CDPATH=".$(printf ":%s" ${cdpath[@]})"

HOMEBREW_PREFIX=$(brew --prefix)
if type brew &>/dev/null; then
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "${COMPLETION}"
    done
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(rbenv init -)"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

if [ -f "/opt/homebrew/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/opt/homebrew/opt/bash-git-prompt/share"
  GIT_PROMPT_ONLY_IN_REPO=1
  GIT_PROMPT_THEME=Solarized
  GIT_PROMPT_START="\n_LAST_COMMAND_INDICATOR_ | $(date "+%H:%M:%S") | \w |"
  GIT_PROMPT_END="\n# "
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

[ -f /opt/homebrew/etc/profile.d/bash-preexec.sh ] && . /opt/homebrew/etc/profile.d/bash-preexec.sh

