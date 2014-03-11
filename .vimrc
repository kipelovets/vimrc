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

call neobundle#rc(b)

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell'
" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle "vim-scripts/Align"
" junegunn/vim-easy-align
NeoBundle "vim-scripts/DirDiff.vim"
NeoBundle "artnez/vim-wipeout" " replacement for BufOnly
NeoBundle 'tpope/vim-sensible'
NeoBundle "tpope/vim-commentary" " NERD_commenter
NeoBundle 'tpope/vim-fugitive'
NeoBundle "tpope/vim-surround"
NeoBundle "moll/vim-bbye" " Bclose
NeoBundle "itchyny/calendar.vim" " mattn/calendar-vim
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

filetype plugin indent on

NeoBundleCheck

source ~/.vim/settings.vim
source ~/.vim/mappings.vim
source ~/.vim/options.vim
