let NERDTreeHijackNetrw=0

let g:ctrlp_extensions = ['tag', 'buffertag', 'line', 'mixed', 'funky']
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

let g:dbgPavimPort = 9001
let g:dbgPavimBreakAtEntry = 1
let g:dbgPavimKeyRun = '<f5>'
let g:dbgPavimKeyStepOver = '<f10>'
let g:dbgPavimKeyStepInto = '<f11>'
let g:dbgPavimKeyStepOut = '<f12>'
let g:dbgPavimKeyPropertyGet = '<a-f3>'
let g:dbgPavimKeyContextGet = '<a-f4>'
let g:dbgPavimKeyToggleBp = '<f9>'
let g:dbgPavimKeyToggleBae = '<a-f5>'
let g:dbgPavimKeyRelayout = '<a-f2>'
let g:dbgPavimKeyEval = '<a-f7>'

let g:startify_custom_header =
    \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
let g:startify_list_order = ['sessions', 'bookmarks']
let g:startify_change_to_dir = 1
let g:startify_bookmarks = ['~/.vimrc']

" remove vim-fugitive vim diff buffers on hide
autocmd BufReadPost fugitive://* set bufhidden=delete

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

let g:syntastic_swift_checkers = []
