#!/usr/bin/env bash

echo "Creating symlinks..."

if ! [[ -L $HOME/.vimrc ]]; then
  ln -s `pwd`/vimrc $HOME/.vimrc
fi

if ! [[ -L $HOME/.vim ]]; then
  ln -s `pwd` $HOME/.vim
fi

echo

if ! [[ -d `pwd`/bundle/Vundle.vim/.git  ]]; then
  echo "Cloning Vundle..."
  git clone https://github.com/VundleVim/Vundle.vim.git `pwd`/bundle/Vundle.vim
else
  echo "Skipping Vundle clone"
fi

vim +PluginInstall +qall

set -xe
(cd bundle/command-t/ruby/command-t && ruby extconf.rb && make)
