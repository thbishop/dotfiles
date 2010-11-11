#!/bin/bash

export RUBYOPT="-rubygems"
export r="rails"
alias rautotest='RSPEC=true autotest'

# rvm
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# rdoc for hanna template
export RDOCOPT="-S -f html -T hanna"
