#!/bin/bash

SESSION_NAME="intu_logger"
PROJECT_PATH="$WORK_DEV_PATH/intu-logger"

if [ -d $PROJECT_PATH ]; then
  tmux has-session -t $SESSION_NAME

  if [ $? != 0 ]
  then
    tmux new-session -s $SESSION_NAME -n editor -d
    tmux send-keys -t $SESSION_NAME "cd $PROJECT_PATH" C-m
    tmux send-keys -t $SESSION_NAME 'vim' C-m
    tmux split-window -v -p 20 -t $SESSION_NAME
    tmux send-keys -t $SESSION_NAME:1.2 "cd $PROJECT_PATH" C-m
    tmux split-window -h -t $SESSION_NAME:1.2
    tmux send-keys -t $SESSION_NAME:1.3 "cd $PROJECT_PATH" C-m
    tmux new-window -n console -t $SESSION_NAME
    tmux send-keys -t $SESSION_NAME:2.1 "cd $PROJECT_PATH" C-m
    tmux select-window -t $SESSION_NAME:1
    tmux select-pane -t $SESSION_NAME:1.1
  fi

  tmux attach -t $SESSION_NAME
else
  echo "The directory $PROJECT_PATH does not exist"
fi
