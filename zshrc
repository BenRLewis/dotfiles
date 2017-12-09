source ~/bin/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle docker
antigen bundle lukechilds/zsh-nvm

# OS X plugins
if [ "$(uname)" == "Darwin" ]; then
 antigen bundle brew
 antigen bundle osx
fi

antigen theme agnoster

antigen apply

source .zsh_paths
source .zsh_aliases
#Fix PS1 if it's not set
if [[ -z "${PS1}" ]]; then
  export PS1="%{%f%b%k%}$(build_prompt) "
fi

DEFAULT_USER=`whoami`
