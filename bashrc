# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

export PS1="\w$ "
export EDITOR="vim"

# set PATH so it includes user's (public|private) bin if it exists
if [ -d ~/bin ] ; then
    PATH="~/bin:$PATH"
fi
if [ -d ~/bin.pub ] ; then
    PATH="~/bin.pub:$PATH"
fi
