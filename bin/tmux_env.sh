#!/bin/bash

TMUX_ENV_HOME=~/bin/tmux_envs

if [ $1 == 'ls' ]; then
  for x in `ls $TMUX_ENV_HOME | sort`; do
    echo "${x%%.*}";
  done
else
  TMUX_ENV_FILE=$TMUX_ENV_HOME/$1.sh

  if [ -x "$TMUX_ENV_FILE" ]; then
    $TMUX_ENV_FILE
  else
    echo "Unable to find a tmux environment at $TMUX_ENV_FILE"
  fi
fi
