nmap <leader>f :set foldlevel=1<cr>
nmap <leader>F :set foldlevel=99<cr>
nmap <leader>gw :Gw<cr>
nmap <leader>gs :Gst<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>go :Git pull<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>s :Startify<cr>

" C-c and C-v - Copy/Paste в "глобальный клипборд"
if !has('mac')
    vmap <C-C> "+yi
    imap <C-V> <esc>"+gPi
    " В нормальном режиме c-v выделяет строку
    nmap <C-C> ^v$h"+yj
endif

" создаем PhpDoc-комментарии
nmap <c-h> :call PhpDoc()<cr>

" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

" Очищение поиска (отключаем подсветку найденных вариантов)
nmap <leader>/ :let @/=""<bar>echo "search cleared"<cr>

" Funcional keys
map <f2> <esc>:w<cr>
inoremap <f2> <esc>:w<cr>
map <f3> <esc>:CtrlPBuffer<CR>
inoremap <f3> <esc>:CtrlPBuffer<CR>
map <f7> <esc>:bp<cr>
map <f8> <esc>:bn<cr>
map <f4> <esc>:NERDTreeToggle<cr>

" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv

" Выключаем ненавистный режим замены
imap <Ins> <Esc>i

" С-q - закрыть текущий буфер
map <c-q> <Esc>:Bdelete<cr>
map <c-s-q> <Esc>:Bdelete!<cr>

map <c-n> <esc>"=strftime("%d.%m.%Y %X")." georgy.k: "<CR>

" Pretty XML
"command! PrettyXML :silent 1,$!xmllint --format --recover - 2>/dev/null
command! PrettyXML :silent 1,$!XMLLINT_INDENT='    ' xmllint --format --recover - 2>/dev/null
command! PrettyJSON :silent %!json-pretty
command! CTagsCreate :silent !ctags -f ./.tags -h ".php" --langmap=php:.php -R --exclude="var/cache/dev/classes.php" --exclude="\.git" --exclude="*.js" --totals=yes --tag-relative=yes --PHP-kinds=+cf --fields=+S --regex-PHP='/abstract class ([^ ]*)/\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/' 
command! CTagsCreateJava :silent !ctags -f ./.tags --language-force=java -R --exclude="\.svn" --totals=yes --tag-relative=yes --fields=+S  

command! -nargs=1 Title :let &titlestring=<args>

command! SudoWrite :w !sudo tee % > /dev/null

cabbrev lvim
      \ lvim /\<lt><C-R><C-W>\>/gj
      \ *<C-R>=(expand("%:e")=="" ? "" : ".".expand("%:e"))<CR>
      \ <Bar> lw
      \ <C-Left><C-Left><C-Left>


nmap <a-b> :Bp<cr>
nmap <Leader><Space> :VimwikiToggleListItem<cr>
nnoremap <leader>cF :let @*=expand("%:p")<CR>

map <leader>vc <Plug>(vimshell_create)
" autocmd BufReadPost vimwiki nnoremap <Leader>tt <Plug>VimwikiToggleListItem
