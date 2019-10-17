#!/bin/bash
set -e
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

if [[ $REPLY =~ ^[Yy]$ ]]
then
    curl https://github.com/benrlewis.keys --create-dirs -o ~/.ssh/authorized_keys
fi

#Clone the git repo for the dotfiles
if [ ! -d ~/dotfiles ]; then
  git clone https://github.com/benrlewis/dotfiles ~/dotfiles
fi
cd ~/dotfiles
#Link the dotfiles to where they should be
ln -fs $(pwd)/.tmux.conf ~/.tmux.conf
ln -fs $(pwd)/.tmux.conf.local ~/.tmux.conf.local
ln -fs $(pwd)/vimrc ~/.vimrc
ln -fs $(pwd)/zsh_aliases ~/.zsh_aliases
ln -fs $(pwd)/zsh_paths ~/.zsh_paths
ln -fs $(pwd)/zshrc ~/.zshrc
ln -fs $(pwd)/zsh_power9k ~/.zsh_power9k

vim +PluginInstall +qall
if [ -n "$(which cmake 2>/dev/null)" ]; then
    echo "Running install.sh for YouCompleteMe"
    cd ~/.vim/bundle/YouCompleteMe
    python install.py
else
   echo "CMake not installed, youcompleteme needs it to be compiled"
fi
echo "You will be prompted for your password to switch shells"
chsh -s /bin/zsh `whoami`

echo "Setting up oh-my-tmux"
ln -s -f ~/dotfiles/.tmux/.tmux.conf ~/tmux.conf
ln -s -f ~/dotfiles/.tmux/tmux.conf.local ~/.tmux.conf.local

echo "Installing notes"
curl -L https://rawgit.com/pimterry/notes/latest-release/install.sh | bash
sudo bash -c "curl -L https://rawgit.com/pimterry/notes/latest-release/_notes > /usr/local/share/zsh/site-functions/_notes"
