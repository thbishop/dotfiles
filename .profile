#
#######################
# load other scripts
#######################
source ~/bin/git-completion.sh
source ~/bin/boom_completion.sh
source ~/bin/work.sh
source ~/bin/ruby.sh
source ~/bin/svn.sh
source ~/bin/mysql.sh
source ~/bin/chef_env.sh


##################
# shell
##################
# includes support for git branch name if in a git repo and ruby version (rvm)
PS1='\n\u in \w ( \t || $(~/.rvm/bin/rvm-prompt v p g)$(__git_ps1 " || %s"))\n#'

export PATH=~/bin:/usr/local/bin:$PATH

set -o vi
export EDITOR=vim

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


######################
# Setting PATH for MacPython 2.5
# The orginal version is saved in .profile.pysave
######################
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export PATH


####################
# git related
####################
alias gst="git status"
alias gb="git branch"
alias glogdiff="git log -p"


##
# Your previous /Users/tbishop/.profile file was backed up as /Users/tbishop/.profile.macports-saved_2009-09-18_at_20:00:00
##

# MacPorts Installer addition on 2009-09-18_at_20:00:00: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


###################################
# perl
###################################
source ~/perl5/perlbrew/etc/bashrc


###################################
# ec2
###################################
export EC2_HOME=~/bin/ec2
export PATH=$PATH:$EC2_HOME/bin
export EC2_PRIVATE_KEY=`ls $EC2_HOME/*.pem`
# export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
