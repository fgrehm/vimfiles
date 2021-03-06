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

if [ -t 1 ] ; then
  vim +PluginInstall +qall
else
  echo 'Installing vim plugins'
  vim +PluginInstall +qall &> /dev/null
fi
