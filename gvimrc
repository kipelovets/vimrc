macmenu File.Print key=<nop>
macmenu Edit.Find.Find\.\.\. key=<nop>

nmap <D-p> :CtrlP<cr>
nmap <D-f> :NERDTreeFind<cr>
nmap <D-left> :tabprev<cr>
nmap <D-right> :tabnext<cr>

if has('win32')
    set guifont=Consolas:h10:cRUSSIAN::
elseif has('mac')
    set guifont=Consolas:h12
else 
    set guifont=Consolas\ 10
endif

set guioptions-=T
set guioptions-=m
set guioptions-=lrLR
set guioptions-=L
