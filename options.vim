" выключаем NERDTree для :e <dirname>
let NERDTreeHijackNetrw=0

let g:ctrlp_extensions = ['tag', 'buffertag', 'line', 'mixed']
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_use_caching = 1

let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:dbgPavimKeyRun = '<F8>'
let g:dbgPavimKeyStepOver = '<F10>'
let g:dbgPavimKeyStepInto = '<F11>'
let g:dbgPavimKeyStepOut = '<F12>'
let g:dbgPavimKeyPropertyGet = '<a-F3>'
let g:dbgPavimKeyContextGet = '<a-F4>'
let g:dbgPavimKeyToggleBp = '<F9>'
let g:dbgPavimKeyToggleBae = '<F5>'
let g:dbgPavimKeyRelayout = '<a-F2>'

let g:startify_custom_header =
    \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
let g:startify_list_order = ['sessions', 'dir', 'files', 'bookmarks']
let g:startify_change_to_dir = 1

let g:neosnippet#enable_snipmate_compatibility = 1
" let g:neosnippet#snippets_directory = '~/.vim/snippets'
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
