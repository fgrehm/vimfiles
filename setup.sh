#!/usr/bin/env bash

symlinks=( vimrc vim )

echo "Creating symlinks..."
for link in ${symlinks[@]}; do
  target="`pwd`/${link}"
  link_name="${HOME}/.${link}"
  if ! [[ -L $link_name ]]; then
    echo "  LINK - ${link_name}"
    ln -s $target $link_name
  else
    echo "  SKIP - ${link_name}"
  fi
done

if ! [[ -d `pwd`/vim/bundle/vundle/.git  ]]; then
  echo "Cloning Vundle"
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
else
  echo "Skipping Vundle clone"
fi

vim +BundleInstall +qall
