set nocompatible
filetype off

" Installing NeoBundle if not present
let b = expand('~/.vim/bundle/')
let n = expand(b . 'neobundle.vim')
if !isdirectory(n)
    if !isdirectory(b) 
        silent !mkdir ~/.vim/bundle
    endif
	execute '!git clone --depth=1 https://github.com/Shougo/neobundle.vim.git ' . shellescape(n, 1)
endif
let &rtp.=(empty(&rtp)?'':',').n

call neobundle#begin(b)

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle "vim-scripts/Align"
NeoBundle "blueshirts/darcula"
NeoBundle "vim-scripts/DirDiff.vim"
NeoBundle "artnez/vim-wipeout" " replacement for BufOnly
NeoBundle 'tpope/vim-sensible'
NeoBundle "tpope/vim-commentary" " NERD_commenter
NeoBundle 'tpope/vim-fugitive'
NeoBundle "tpope/vim-surround"
NeoBundle "moll/vim-bbye" " Bclose
NeoBundle "mattn/calendar-vim"
NeoBundle "brookhong/DBGPavim" " debugger.py
NeoBundle "stephpy/vim-phpdoc"
NeoBundle "mhinz/vim-startify"
NeoBundle "scrooloose/nerdtree"
NeoBundle "scrooloose/syntastic"
NeoBundle "vimwiki/vimwiki"
NeoBundle "gcmt/taboo.vim" " tabname
NeoBundle 'kien/ctrlp.vim'
NeoBundle "bronson/vim-visual-star-search" 
NeoBundle "altercation/vim-colors-solarized"
NeoBundle "bling/vim-airline"
NeoBundle "evindor/vim-rusmode"
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'gregsexton/gitv'
NeoBundle 'stephpy/vim-yaml'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'crater2150/vim-theme-chroma'
NeoBundle 'machakann/vim-colorscheme-tatami'
NeoBundle 'vim-scripts/habiLight'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'keith/swift.vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-colorscheme-switcher'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

source ~/.vim/settings.vim
source ~/.vim/mappings.vim
source ~/.vim/options.vim
source ~/.vim/filetype.vim
