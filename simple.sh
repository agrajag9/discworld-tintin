#!/usr/bin/env bash
BASEDIR="$HOME/.local/share/discworld-tintin"
echo "$BASEDIR"
tmux new-session -d -A -D -s discworld
tmux kill-pane -a -t discworld:1.1
tmux select-pane -t discworld:1.1
tmux split-window -h -l 28
tmux send-keys "topless -c cat $BASEDIR/logs/xptimers.log" 'C-m'
tmux split-window -v -p 50
tmux send-keys "topless cat $BASEDIR/logs/groupshields.log" 'C-m'
tmux split-window -v -p 50
tmux send-keys "topless cat $BASEDIR/logs/minimap.log" 'C-m'
tmux select-pane -t discworld:1.1
tmux split-window -v -b -l 5
tmux send-keys "$BASEDIR/bin/mdt" 'C-m'
tmux select-pane -t discworld:1.2
tmux split-window -v -b -l 4
tmux send-keys "clear && tail -f $BASEDIR/logs/chat.log" 'C-m'
tmux select-pane -t discworld:1.3
tmux send-keys "clear && tt++ -G $BASEDIR/config.tin" 'C-m'
tmux -2 attach-session -t discworld -d
