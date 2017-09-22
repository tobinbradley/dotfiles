#! /bin/bash

echo "Get dotfiles location..."
V_CWD=$(pwd)
V_MY_PATH=$HOME

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
ln -s $V_CWD/.zshrc $V_MY_PATH/.zshrc
ln -s $V_CWD/.tmux.conf $V_MY_PATH/.tmux.conf
ln -s $V_CWD/.vimrc $V_MY_PATH/.vimrc

echo "Setting up vim plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing vim plugins..."
vim -E -c PlugInstall -c q -c q
