set -o vi

export PATH=~/bin:~/.local/bin:~/go/bin:$PATH
export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR=nvim
export GPG_TTY=$(tty)

export HISTCONTROL=ignoreboth
export HISTFILESIZE=1500000
export HISTIGNORE="ls:history:x:exit:clear:"
export HISTSIZE=1500000
shopt -s histappend

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.cargo/env ] && source ~/.cargo/env

alias brewup="brew update && brew outdated"
alias hgrep="history | grep"
alias p="ping"
alias pgrep="ps -A -o pid,ppid,user,command | grep -i "
alias s="open"
alias senv="env | sort | less"
alias snipcp="pet search | pbcopy"
alias unixnow="date +%s"
alias x=exit

function alert() {
  local message=${1:-"It's done!"}
  local title=${2:-"Alert"}
  osascript -e "display notification \"$message\" with title \"$title\""
}

function cl-latest() {
  grep -m 1 '^## \[\d' CHANGELOG.md | keepachangelog-version
}

function cl-bump-patch() {
  local latest_version
  latest_version=$(cl-latest)
}

# asdf
PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
. <(asdf completion bash)

eval "$(starship init bash)"
