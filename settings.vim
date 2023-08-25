syntax on
set hlsearch
set hidden

colorscheme retrobox " darcula sorbet
set background=dark

set vb t_vb=
set diffopt=filler,iwhite,vertical
set completeopt=preview,menu,menuone

if !has('gui_running')
   set t_Co=256
   colorscheme wombat256
   exec "silent !stty -ixon -ixoff"
endif

autocmd BufNewFile,Bufread *.xsl,*.html,*.phtml setlocal et ts=2 sw=2 sts=2

set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
set termencoding=utf-8
set encoding=utf-8 

set cursorline
set nu

set foldmethod=indent
set foldlevel=99

set mouse=a
set mousemodel=popup
set mousehide

set ch=1

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent

set nobackup
set noswapfile

set wildignore=*.o,*.obj,.git,.svn,*.jpg,*.png,*.gif
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0


set tags=.tags
set conceallevel=0

" https://spec.draculatheme.com/#sec-Color-Palette
hi VimwikiHeader1 guifg=#FF5555
hi VimwikiHeader2 guifg=#50FA7B
hi VimwikiHeader3 guifg=#BD93F9
hi VimwikiLink guifg=#8BE9FD
