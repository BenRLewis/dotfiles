#!/bin/bash

#Install antigen if it isn't installed
if [ ! -d "~/bin/antigen" ]; then
  git clone https://github.com/zsh-users/antigen ~/bin/antigen
fi

#Install vundle for vim if it isn't installed
if [ ! -d "~/.vim/bundle/Vundle.vim" ]; then
  git clone https://github.com/zsh-users/antigen ~/bin/antigen
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

read -p "Do you want to download SSH keys from Github? y/N" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    curl https://github.com/FollowingGhosts.keys --create-dirs -o ~/.ssh/authorized_keys
fi

#Clone the git repo for the dotfiles
git clone https://github.com/FollowingGhosts/dotfiles ~/

#Link the dotfiles to where they should be
ln -s $(pwd)tmux.conf ~/tmux.conf
ln -s $(pwd)vimrc ~/.vimrc
ln -s $(pwd)zsh_aliases ./.zsh_aliases
ln -s $(pwd)zsh_paths ./.zsh_paths
ln -s $(pwd)zshrc ./zshrc

chsh /bin/zsh
