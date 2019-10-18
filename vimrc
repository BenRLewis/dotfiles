set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'
Bundle 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'tomtom/tcomment_vim'
Plugin 'itchyny/lightline.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Bundle 'c3m3gyanesh/p4-syntax-highlighter-collection', {'rtp': 'vim'}
Plugin 'fatih/vim-go'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
set bs=2 
set background=dark
set autoindent
set mouse=a
colorscheme solarized
set tabstop=4
set softtabstop=4
set expandtab
set number
set showcmd
set cursorline
filetype plugin indent on
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
set autowrite
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent
set title
set laststatus=2

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
