nmap <leader>f :set foldlevel=1<cr>
nmap <leader>F :set foldlevel=99<cr>
nmap <leader>gw :Gw<cr>
nmap <leader>gs :G<cr>
nmap <leader>gc :G commit<cr>
nmap <leader>go :Git pull<cr>
nmap <leader>gp :Git push<cr>
nmap <leader>s :Startify<cr>
nmap <leader>ee :e /Users/gkorshunov/vimwiki/Enums.wiki<cr>

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
"
map <leader>j :%!/opt/homebrew/bin/php -r 'echo json_encode(json_decode(file_get_contents("php://stdin")), JSON_PRETTY_PRINT);'<cr>:set filetype=json<cr>
map <leader>J :%!/opt/homebrew/bin/php -r 'echo json_encode(json_decode(file_get_contents("php://stdin")));'<cr>:set filetype=json<cr>

" map <d-*> :vim 
map <d-/> gcc
map <d-a> ggVG

nnoremap gr :grep <cword> *<CR>

nnoremap <expr> <silent> <s-F3>   (&diff ? "]c:call \<sid>NextDiff()\<cr>" : ":cn\<cr>")

function! s:GotoWinline(w_l)
  normal! H
  while winline() < a:w_l
    normal! j
  endwhile
  " todo: beware of cases where the window is too little
endfunction

" Better ]c, [c jump
function! s:NextDiff()
  if ! &diffopt =~ 'filler' | return | endif

  let ignore_blanks = &diffopt =~ 'iwhite'

  " Assert: called just after a ]c or a [c
  " Forces the cursos to be synchronized in all synced windows
  " let diff_l = line()
  try 
    let foldenable = &foldenable
    set nofoldenable

    let w_l = winline() " problematic with enabled lines (from diff...)
    " echomsg w_l.'|'.line('.').'|'.getline('.')

    let lines = {}
    windo if &diff | call <sid>GotoWinline(w_l) | let lines[winnr()]={'text':getline('.'), 'number':line('.')} | endif
  finally
    let &foldenable = foldenable
  endtry

  " echomsg string(lines)
  if len(lines) < 2 | return | endif

  let indices = repeat([0], len(lines))
  let tLines = values(lines)
  let found = 0
  " infinite loop on two empty texts...
  while ! found
    let c = ''
    let next_idx = []
    let i = 0
    while i != len(indices)
      let crt_line = tLines[i].text
      let n = indices[i]
      if len(crt_line) == n
    let found = 1
    break
      endif

      let c2 = (len(crt_line) == n) ? 'EOL' : crt_line[n]
      if empty(c) 
    let c = c2
      endif

      " checks match
      let n += 1
      if c =~ '\s'
    if (c2 != c) && (ignore_blanks && c2 !~ '\s')
      let found = 1
      break
    else " advance
      while ignore_blanks && (n == len(crt_line) || crt_line[n] =~ '\s')
        let n += 1
      endwhile
    endif
      else
    if c2 != c
      let found = 1
      break
    endif
      endif
      let next_idx += [n]

      let i += 1
    endwhile
    if found | break | endif

    let indices = next_idx
  endwhile

  " now goto the right column
  let windows = keys(lines)
  " Assert len(windows) == len(indices)
  let w = 0
  while w != len(windows)
    " echomsg 'W#'.windows[w].' -> :'(tLines[w].number).'normal! '.(indices[w]+1).'|'
    exe windows[w].'wincmd w'
    silent! exe (tLines[w].number).'normal! 0'.(indices[w]).'l'
    let w += 1
  endwhile
  " echomsg string(indices)
endfunction
