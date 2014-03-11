" выключаем NERDTree для :e <dirname>
let NERDTreeHijackNetrw=0

let g:ctrlp_extensions = ['tag', 'buffertag', 'line', 'mixed']
let g:ctrlp_working_path_mode = 'rw'

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
