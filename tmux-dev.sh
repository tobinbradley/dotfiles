#! /bin/bash

session=$1
tmux has-session -t $session
if [ $? != 0 ]
then
     tmux new-session -s $session -n editor -d
     tmux split-window -t $session -v -p 20
     tmux split-window -t $session -h -p 50
     tmux attach -t $session
else
     tmux attach -t $session
fi
