# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

# MySQL
export MYSQL_PS1="\u, \d> "
export ARCHFLAGS="-arch x86_64"
export MYSQL_HOME=/usr/local/mysql

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$MYSQL_HOME/bin:$PATH

export PS1="\w$ "
export EDITOR="vim"
