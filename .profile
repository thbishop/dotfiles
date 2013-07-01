#
#######################
# load other scripts
#######################
source ~/bin/aws.sh
source ~/bin/git-completion.sh
source ~/bin/git.sh
source ~/bin/boom_completion.sh
source ~/bin/ssh_completion.sh
source ~/bin/work.sh
source ~/bin/ruby.sh
source ~/bin/serve.sh
source ~/bin/svn.sh
source ~/bin/mysql.sh
source ~/bin/npm.sh
source ~/bin/chef_env.sh
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

#################
# new tab
#################
function nt {
  osascript -e "
    tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down
    tell application \"Terminal\" to do script \"cd $PWD \" in selected tab of the front window
  " > /dev/null 2>&1
}


######################
# general aliases
######################
alias c="cat"
alias ll="ls -la"
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


######################
# toggle hidden files in finder
######################
function toggle_hidden_files {
  if [ `defaults read com.apple.finder AppleShowAllFiles` == 1 ]
  then
    echo "Hiding hidden files."
    defaults write com.apple.finder AppleShowAllFiles -bool false
  else
    echo "Showing hidden files."
    defaults write com.apple.finder AppleShowAllFiles -bool true
  fi

  KillAll Finder
}


###################################
# ec2
###################################
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.2.5/jars"
export AWS_CLOUDFORMATION_HOME="/usr/local/Cellar/aws-cfn-tools/1.0.9/jars"
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY="$(ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(ls $HOME/.ec2/cert-*.pem)"
export JAVA_HOME="$(/usr/libexec/java_home)"

###################################
# rbenv
###################################
eval "$(rbenv init -)"
