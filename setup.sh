#!/bin/bash

#Install antigen if it isn't installed
if [ ! -d ~/bin/antigen ]; then
  echo "Cloning antigen"
  git clone https://github.com/zsh-users/antigen ~/bin/antigen
fi

#Install vundle for vim if it isn't installed
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  echo "Cloning vundle"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

read -p "Do you want to download SSH keys from Github? [y/N] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    curl https://github.com/FollowingGhosts.keys --create-dirs -o ~/.ssh/authorized_keys
fi

#Clone the git repo for the dotfiles
if [ ! -d ~/dotfiles ]; then
  git clone https://github.com/FollowingGhosts/dotfiles ~/dotfiles
fi
#Link the dotfiles to where they should be
ln -fs $(pwd)/tmux.conf ~/.tmux.conf
ln -fs $(pwd)/vimrc ~/.vimrc
ln -fs $(pwd)/zsh_aliases ~/.zsh_aliases
ln -fs $(pwd)/zsh_paths ~/.zsh_paths
ln -fs $(pwd)/zshrc ~/.zshrc

chsh -s /bin/zsh `whoami`
