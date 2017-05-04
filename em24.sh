#!/bin/bash
cmd=$1
USER=em24
# the name of your primary tmux session
SESSION=$USER
# your IRC nickname
IRC_NICK=$USER
 
# if the session is already running, just attach to it.
tmux has-session -t $SESSION
if [ $? -eq 0 ]; then
    echo "Session $SESSION already exists. Attaching."
    sleep 1
    tmux attach -t $SESSION
    exit 0;
fi
 
# create a new session, named $SESSION, and detach from it
tmux new-session -d -s $SESSION
 
# Now populate the session with the windows you use every day
# Some windows I specifically want at a particular index.
# I always want IRC in window 0 and Email in window 1.
 
# 0 - IRC
tmux set-window-option -t $SESSION -g automatic-rename off
tmux new-window    -t $SESSION:0 -k -n em24 # weechat-curses
tmux set-window-option -t $SESSION:0 automatic-rename off
#tmux set-window-option -t $SESSION:0 monitor-content $IRC_NICK
#tmux rename-window -t $SESSION:0 -n irc
# 1 - Mail
#tmux new-window    -t $SESSION:1 -n mail alpine
# 2 - Music (on one workstation, nothing on another)
# So that I can quickly hit ^b2<spacebar> to pause my tunes, I always put music in window 2.
# Makefile target does this: mpg123 --shuffle --control --list *m3u
#tmux new-window -t $SESSION:2 -n music 'cd ~/Music; make music'
#tmux new-window    -t $SESSION:2 -n temp # just to leave 2 empty
 
# After those base windows are statically defined, what follows depends where
# I'm working and what my focus is.
# So these new windows will just  number sequentially.
#tmux new-window    -t $SESSION -a -n work
#tmux new-window    -t $SESSION -a -n root  'sudo su -'
#tmux new-window    -t $SESSION -a -n fw    'ssh root@fw'
#tmux new-window    -t $SESSION -a -n virt  'ssh root@sammy'
#tmux new-window    -t $SESSION -a -n lime  'ssh root@lime'
#tmux new-window    -t $SESSION -a -n scsi  'ssh root@donkey'
#tmux new-window    -t $SESSION -a -n back  'ssh root@bacula'
#tmux kill-window   -t $SESSION:2 # just want to leave slot 2 empty
#

split6(){
	n=$1
	for i in `seq 5`
	do
		tmux select-pane -t $n
		tmux split -l 12 
	done
}
login(){
	id=$1
	tmux send-keys "s66lx" C-m
	tmux send-keys "ssh loginview03" C-m
	tmux send-keys "semx $id" C-m
	tmux send-keys "$cmd " C-m

}
 
# all done. select starting window and get to work
# you may need to cycle through windows and type in passwords
# if you don't use ssh keys
#tmux set-option remain-on-exit on
tmux select-window -t $SESSION:0
tmux split-window -h 
tmux select-pane -t 1
tmux split-window -h 
tmux select-pane -t 3
tmux split-window -h 

split6 1;

split6 7;

split6 13;

split6 19;

for i in `seq 24`
do
	tmux select-pane -t $i
	login $i
done
#tmux select-layout even-vertical



tmux attach -t $SESSION
