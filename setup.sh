#!/usr/bin/env bash

echo "Creating symlinks..."

if ! [[ -L $HOME/.vimrc ]]; then
  ln -s `pwd`/vimrc $HOME/.vimrc
fi

if ! [[ -L $HOME/.vim ]]; then
  ln -s `pwd` $HOME/.vim
fi

echo

if ! [[ -d `pwd`/bundle/vundle/.git  ]]; then
  echo "Cloning Vundle..."
  mkdir -p `pwd`/bundle
  git clone https://github.com/gmarik/vundle.git `pwd`/bundle/vundle
else
  echo "Skipping Vundle clone"
fi

vim +BundleInstall +qall
