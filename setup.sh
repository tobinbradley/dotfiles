#! /bin/bash

echo "Get dotfiles location..."
cwd=$(pwd)

echo "Back up existing files if present..."
if [ -f ~/.zshrc ]
  then mv ~/.zshrc ~/.zshrc.bak
fi
if [ -f ~/.tmux.conf ]
  then mv ~/.tmux.conf ~/.tmux.conf.bak
fi
if [ -f ~/.vimrc ]
  then mv ~/.vimrc ~/.vimrc.bak
fi

echo "Linking repo files..."
ln -s $cwd/.zshrc ~/.zshrc
ln -s $cwd/.tmux.conf ~/.tmux.conf
ln -s $cwd/.vimrc ~/.vimrc

echo "Setting up vim plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins..."
vim -E -c PlugInstall -c q -c q
