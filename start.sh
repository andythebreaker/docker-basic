#!/bin/bash
tmux new-session -d -s autotests -n onlywindows
tmux send-keys -t autotests:onlywindows 'cd /root/yolov5' Enter
tmux send-keys -t autotests:onlywindows 'pubhtml up -p 22128' Enter
tmux new-session -d -s butotests -n anlywindows
tmux send-keys -t butotests:anlywindows 'cd /root/material-kit-react' Enter
tmux send-keys -t butotests:anlywindows 'npm start' Enter
tmux new-session -d -s cutotests -n bnlywindows
tmux send-keys -t cutotests:bnlywindows 'cd /root/pythonRelay4y5v7fnd' Enter
tmux send-keys -t cutotests:bnlywindows 'npm start' Enter
flask run
