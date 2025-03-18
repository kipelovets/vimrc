local shortcuts = {}

shortcuts.rename = '<leader>cr'
shortcuts.code_action = '<leader>ca'
shortcuts.format = '<leader>cf'
shortcuts.goto_definition = '<leader>cd'
shortcuts.goto_references = '<leader>cu'
shortcuts.implementations = '<leader>ci'
shortcuts.symbols = '<leader>cs'
shortcuts.all_symbols = '<leader>cS'
shortcuts.doc = 'K'
shortcuts.signature = '<C-k>'
shortcuts.cmp_confirm = '<CR>'
shortcuts.cmp_complete = '<C-Space>'
shortcuts.cmp_abort = '<C-e>'
shortcuts.cmp_next = '<Tab>'
shortcuts.diag_open = '<leader>do'
shortcuts.diag_prev = '[e'
shortcuts.diag_next = ']e'
shortcuts.diag_show = '<leader>dd'

if jit.os == "OSX" then
    shortcuts.neovide = "<D-n>"
    shortcuts.copy = "<D-c>"
    shortcuts.paste = "<D-v>"
    shortcuts.copy_line = '<D-c>'
    shortcuts.duplicate = '<D-d>'
    shortcuts.select_all = '<D-a>'
    shortcuts.save = "<D-s>"
    shortcuts.prev_tab = '<D-left>'
    shortcuts.next_tab = '<D-right>'
    shortcuts.tab_move_right = '<D-S-right>'
    shortcuts.tab_move_left = '<D-S-left>'
    shortcuts.new_tab = '<D-t>'
    shortcuts.find_files = '<D-p>'
    shortcuts.maximize = '<d-c-f>'
    shortcuts.find = '<d-f>'
    shortcuts.find_ex = '<d-s-f>'
elseif jit.os == "Linux" then
    shortcuts.neovide = "<C-n>"
    shortcuts.copy = "<C-c>"
    shortcuts.paste = "<C-v>"
    shortcuts.copy_line = '<C-c>'
    shortcuts.duplicate = '<C-S-d>'
    shortcuts.select_all = '<C-a>'
    shortcuts.save = "<C-s>"
    shortcuts.prev_tab = '<a-left>'
    shortcuts.next_tab = '<a-right>'
    shortcuts.tab_move_right = '<a-S-right>'
    shortcuts.tab_move_left = '<a-S-left>'
    shortcuts.new_tab = '<C-t>'
    shortcuts.find_files = '<C-p>'
    shortcuts.maximize = '<f11>'
    shortcuts.find = '<c-f>'
    shortcuts.find_ex = '<a-s-f>'
else
    shortcuts.neovide = "<C-n>"
    shortcuts.copy = "<C-c>"
    shortcuts.paste = "<C-v>"
    shortcuts.copy_line = '<C-c>'
    shortcuts.duplicate = '<C-S-d>'
    shortcuts.select_all = '<C-a>'
    shortcuts.save = "<C-s>"
    shortcuts.prev_tab = '<C-left>'
    shortcuts.next_tab = '<C-right>'
    shortcuts.tab_move_right = '<C-S-right>'
    shortcuts.tab_move_left = '<C-S-left>'
    shortcuts.new_tab = '<C-t>'
    shortcuts.find_files = '<C-p>'
    shortcuts.maximize = '<f11>'
    shortcuts.find = '<c-f>'
    shortcuts.find_ex = '<c-s-f>'
end

return shortcuts
