local keybindings = {}

keybindings.rename = '<leader>rn'
keybindings.code_action = '<leader>ca'
keybindings.format = '<leader>f'
keybindings.goto_definition = 'gd'
keybindings.goto_references = 'gr'
keybindings.symbols = '<leader>ds'
keybindings.all_symbols = '<leader>ws'
keybindings.doc = 'K'
keybindings.signature = '<C-k>'
keybindings.cmp_confirm = '<CR>'
keybindings.cmp_complete = '<C-Space>'
keybindings.cmp_abort = '<C-e>'
keybindings.cmp_next = '<Tab>'
keybindings.diag_open = '<leader>do'
keybindings.diag_prev = '<leader>d['
keybindings.diag_next = '<leader>d]'
keybindings.diag_show = '<leader>dd'

if jit.os == "OSX" then
    keybindings.neovide = "<D-n>"
    keybindings.copy = "<D-c>"
    keybindings.paste = "<D-v>"
    keybindings.copy_line = '<D-c>'
    keybindings.duplicate = '<D-d>'
    keybindings.select_all = '<D-a>'
    keybindings.save = "<D-s>"
    keybindings.prev_tab = '<D-left>'
    keybindings.next_tab = '<D-right>'
    keybindings.new_tab = '<D-t>'
    keybindings.find_files = '<D-p>'
else
    keybindings.neovide = "<C-n>"
    keybindings.copy = "<C-c>"
    keybindings.paste = "<C-v>"
    keybindings.copy_line = '<C-c>'
    keybindings.duplicate = '<C-S-d>'
    keybindings.select_all = '<C-a>'
    keybindings.save = "<C-s>"
    keybindings.prev_tab = '<C-{>'
    keybindings.next_tab = '<C-}>'
    keybindings.new_tab = '<C-t>'
    keybindings.find_files = '<C-p>'
end

return keybindings
