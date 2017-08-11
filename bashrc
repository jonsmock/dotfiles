# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

# set PATH so it includes user's (public|private) bin if it exists
if [ -d ~/bin ] ; then
    PATH="~/bin:$PATH"
fi
if [ -d ~/bin.pub ] ; then
    PATH="~/bin.pub:$PATH"
fi

# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000

source ~/bin.pub/git-completion.bash

export PS1="\w$ "
export EDITOR="vim"
