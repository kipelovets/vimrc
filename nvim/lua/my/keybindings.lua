local keybindings = {}

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
