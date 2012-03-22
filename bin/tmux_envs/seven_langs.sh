#!/bin/bash

SESSION_NAME="seven_langs"
PROJECT_PATH="$DEV_PATH/seven_langs_in_seven_weeks"

if [ -d $PROJECT_PATH ]; then
  tmux has-session -t $SESSION_NAME

  if [ $? != 0 ]
  then
    tmux new-session -s $SESSION_NAME -n editor -d
    tmux send-keys -t $SESSION_NAME "cd $PROJECT_PATH" C-m
    tmux send-keys -t $SESSION_NAME 'vim' C-m
    tmux split-window -h -t $SESSION_NAME
    tmux send-keys -t $SESSION_NAME:1.2 "cd $PROJECT_PATH" C-m
  fi

  tmux attach -t $SESSION_NAME
else
  echo "The directory $PROJECT_PATH does not exist"
fi
