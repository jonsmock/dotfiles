# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

# set PATH so it includes user's (public|private) bin if it exists
if [ -d ~/bin ] ; then
    export PATH="~/bin:$PATH"
fi
if [ -d ~/bin.pub ] ; then
    export PATH="~/bin.pub:$PATH"
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt;

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# Erase duplicates in history
export HISTCONTROL=erasedups
# Store 10k history entries
export HISTSIZE=10000

# append to the history file, don't overwrite it
shopt -s histappend

source ~/bin.pub/git-completion.bash

export EDITOR="vim"
