#!/bin/bash

alias git=hub
alias gb="git branch"
alias gba="git branch -a"
alias gst="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gf="git fetch"
alias gfp="git fetch --prune"
alias glogdiff="git log -p"
alias glc="git rev-parse HEAD | tr '\n' ' ' | pbcopy"
alias glp='git log --graph --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset"'
alias grm="git rebase origin/master"
alias gundo="git reset --soft HEAD^"
