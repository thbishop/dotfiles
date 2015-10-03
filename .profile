#
#######################
# load other scripts
#######################
source ~/bin/git-completion.sh
source ~/bin/git.sh
source ~/bin/go.sh
source ~/bin/docker.sh
source ~/bin/ssh_completion.sh
source ~/bin/work.sh
source ~/bin/ruby.sh
source ~/bin/serve.sh
source ~/bin/shell.sh
source ~/bin/svn.sh
source ~/bin/mysql.sh
source ~/bin/npm.sh
source ~/bin/tmux.sh


##################
# shell
##################
# includes support for git branch name if in a git repo and ruby version (rvm)
GIT_PS1_SHOWDIRTYSTATE=1
PS1='\n\u in \w (\t || $(rbenv version-name)$(__git_ps1 " || %s"))\n# '

export PATH=~/bin:/usr/local/bin:/usr/local/heroku/bin:/Applications/Vagrant/bin/:$PATH

set -o vi
export EDITOR=vim
export DEV_PATH=~/data/personal/dev

#################
# history
#################
HISTSIZE=15000
HISTFILESIZE=15000
HISTCONTROL=ignoreboth


######################
# general aliases
######################
alias pgrep="ps -A -o pid,ppid,user,command | grep -i "
alias p="ping"
alias s="open"
alias x="exit"
alias flushdns="dscacheutil -flushcache"
alias pdev="cd ~/data/personal/dev"
alias lg_logs="find . -type f -size +50M -name *.log -print | xargs du -hs | sort -r"
alias f="fission"
alias sshno="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias hgrep="history | grep"


export JAVA_HOME="$(/usr/libexec/java_home)"

###################################
# rbenv
###################################
eval "$(rbenv init -)"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
eval "$(jenv init -)"
