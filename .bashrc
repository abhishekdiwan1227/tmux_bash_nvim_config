# set env paths for GO
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go

# check if tmux en var is set, start old/new session
[ -z "$TMUX" ] && exec tmux new-session;

# ignore case on TAB completeion
bind 'set completion-ignore-case on'

# add git branch to PS1
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\e[91m\]\$(__git_ps1 ' [%s]')\[\e[00m\]\$ "
