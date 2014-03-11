" Basic options
set vb t_vb=

set hidden

" опции diff-режима: 
"   filler - показывать пустые строки для синхронизации просматриваемых файлов
"   iwhite - игнорировать изменения в количестве пробельных символов
"   vertical - всегда использовать вертикальное разделение окон
set diffopt=filler,iwhite,vertical
" опции omnicomplete: показывать предпросмотр с параметрами, показывать меню,
" показывать меню даже если только один вариант
set completeopt=preview,menu,menuone

if has('gui_running')
    " в GUI-режиме устанавливаем правильный шрифт 
    if has('win32')
        set guifont=Consolas:h10:cRUSSIAN::
    elseif has('mac')
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
    else 
        set guifont=Consolas\ 10
    endif
   " выключаем меню и панель инструментов
   set guioptions-=T
   set guioptions-=m
   set guioptions-=lrLR
   set guioptions-=L
   colorscheme base16-mocha
else
   set t_Co=256
   " Выключаем control-flow в терминале, чтобы можно было использовать <c-q>, <c-s>
   colorscheme wombat256
   exec "silent !stty -ixon -ixoff"
endif

autocmd BufNewFile,Bufread *.xsl,*.html,*.phtml setlocal et ts=2 sw=2 sts=2

" приоритет кодировок
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
" Кодировка текста по умолчанию
set termencoding=utf-8
set encoding=utf-8 

" выключаем подсветку строки курсора, она тормозит :(
set cursorline
"set cursorline
"hi CursorLine guibg=#4e4c4e 

" Включаем нумерацию строк
set nu

" Фолдинг по отсупам, по умолчанию выключен
set foldmethod=indent
set foldlevel=99

set hlsearch

" Поддержка мыши
set mouse=a
set mousemodel=popup
" Скрывать указатель мыши, когда печатаем
set mousehide

" Сделать строку команд высотой в одну строку
set ch=1

" Влючить подстветку синтаксиса
syntax on

" Преобразование Таба в пробелы
set expandtab

" Размер табулации по умолчанию
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Включаем "умные" отспупы ( например, автоотступ после {)
set smartindent

set nobackup
set noswapfile

set wildignore=*.o,*.obj,.git,.svn,*.jpg,*.png,*.gif
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

set background=dark
