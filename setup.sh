#!/bin/bash

# TODO:
# - Instead of blindly git-pull'ing, lock to a specific SHA

set -ex

repo=$(pwd)

cd ~/ && ln -vsf $repo/bin.pub
cd ~/ && ln -vsf $repo/.vim/

ln -vsf $repo/profile ~/.profile
ln -vsf $repo/gitconfig ~/.gitconfig
ln -vsf $repo/gitignore ~/.gitignore
ln -vsf $repo/bash_profile ~/.bash_profile
ln -vsf $repo/bashrc ~/.bashrc
ln -vsf $repo/vimrc ~/.vimrc


# bins

mkdir -p bin-utils

if [[ ! -d $repo/bin-utils/selecta ]]; then
	cd $repo/bin-utils && git clone https://github.com/garybernhardt/selecta
fi
git -C $repo/bin-utils/selecta pull
ln -vsf $repo/bin-utils/selecta/selecta $repo/bin.pub/selecta


# VIM Bundles

mkdir -p $repo/.vim/bundle

if [[ ! -d $repo/.vim/bundle/vim-fireplace ]]; then
	cd $repo/.vim/bundle && git clone https://github.com/tpope/vim-fireplace
fi
git -C $repo/.vim/bundle/vim-fireplace pull

if [[ ! -d $repo/.vim/bundle/vim-clojure-static ]]; then
	cd $repo/.vim/bundle && git clone https://github.com/guns/vim-clojure-static
fi
git -C $repo/.vim/bundle/vim-clojure-static pull
