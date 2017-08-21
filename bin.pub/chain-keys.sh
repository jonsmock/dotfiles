#!/usr/bin/env bash

# Thanks moquist, https://github.com/moquist/dotfiles.pub

# Usage:
# bash ~bin.pub/chain-keys.sh
# KEYCHAIN_TIMEOUT=30 bash ~bin.pub/chain-keys.sh
#
# then:
# source ~/.keychain/pair-sh

# http://www-128.ibm.com/developerworks/linux/library/l-keyc2/
if type -P keychain &>/dev/null; then
    allkeys="$HOME/.ssh/*_rsa"
    keys=
    for key in $allkeys; do [ -f "$key" ] && keys="${keys} $key "; done
    eval $(keychain --timeout ${KEYCHAIN_TIMEOUT:-15} --nogui --eval $keys)
fi
