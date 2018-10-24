source ~/bin/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle docker
antigen bundle wd
antigen bundle extract
#antigen bundle dirhistory
antigen bundle sudo
antigen bundle vagrant
antigen bundle web-search
antigen bundle mosh
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm
# OS X plugins
if [ `uname` = "Darwin" ]; then
 antigen bundle brew
 antigen bundle osx
fi

if [ -n "$(which apt-get 2>/dev/null)" ]; then
    antigen bundle debian
fi
antigen theme agnoster

antigen apply

source ~/.zsh_paths
source ~/.zsh_aliases
[ -f ~/.zsh_hosts ] && source ~/.zsh_host # This file is host specific/not necessarily required or on github


DEFAULT_USER=`whoami`
if [ -x "$(command -v neofetch)" ]; then
        neofetch
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

