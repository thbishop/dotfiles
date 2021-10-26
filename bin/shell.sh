set -o vi

export PATH=~/bin/:~/go/bin:$PATH
export EDITOR=nvim
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
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(rbenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

[ -f /opt/homebrew/etc/profile.d/bash-preexec.sh ] && . /opt/homebrew/etc/profile.d/bash-preexec.sh
eval "$(starship init bash)"
