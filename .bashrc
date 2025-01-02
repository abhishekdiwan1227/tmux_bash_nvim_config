source "$HOME/.cargo/env"
source "$HOME/.config/fzf/scripts/completion.sh"
source "$HOME/.config/fzf/scripts/key-bindings.sh"

# env vars
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export DOTFILES=$HOME/.mydotfiles

# check if tmux env var is set, start new session
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session -A -s main -c ~/
fi

# ignore case on TAB completeion
bind 'set completion-ignore-case on'

if command -v nvim &> /dev/null; then
  alias vim=nvim
fi

if command -v vifm &> /dev/null; then
  alias fm=vifm
fi

if [ -d "$HOME/source/repos" ]; then 
	export REPOS="${HOME}/source/repos" 
fi

# add git branch to PS1
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\e[91m\]\$(__git_ps1 ' [%s]')\[\e[00m\]\$ "

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
