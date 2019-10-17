source ~/bin/antigen/antigen.zsh
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_MODE=nerdfont-complete
antigen use oh-my-zsh
antigen theme bhilburn/powerlevel9k powerlevel9k
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
antigen bundle thefuck
export NVM_LAZY_LOAD=true
NVM_SYMLINK_CURRENT=true
antigen bundle lukechilds/zsh-nvm
setopt EXTENDED_GLOB
# OS X plugins
if [ `uname` = "Darwin" ]; then
 antigen bundle brew
 antigen bundle osx
fi

if [ -n "$(which apt-get 2>/dev/null)" ]; then
    antigen bundle debian
fi
#antigen theme agnoster

antigen apply
export EDITOR=vim
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

source ~/.zsh_paths
source ~/.zsh_aliases
source ~/.zsh_power9k

[ -f ~/.zsh_host ] && source ~/.zsh_host # This file is host specific/not necessarily required or on github


DEFAULT_USER=`whoami`
if [ -x "$(command -v neofetch)" ]; then
        neofetch
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
eval "$(direnv hook zsh)"
