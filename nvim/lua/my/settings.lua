if vim.g.neovide then
    vim.g.neovide_transparency = 0.98
    if jit.os == "OSX" then
        vim.o.guifont = "Fira Code:h12"
    else
        vim.o.guifont = "FiraCode Nerd Font Mono:h10"
    end
end

vim.o.mouse = "a"
vim.o.number = true
vim.o.breakindent = true
vim.o.signcolumn = 'yes'
vim.o.colorcolumn = "80"
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.scrolloff = 8

vim.o.foldmethod = "indent"
vim.o.foldlevel = 99

vim.o.mousehide = true

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.api.nvim_set_hl(0, 'VimwikiHeader1', { fg = '#ff5555' })
vim.api.nvim_set_hl(0, 'VimwikiHeader2', { fg = '#50FA7B' })
vim.api.nvim_set_hl(0, 'VimwikiHeader3', { fg = '#BD93F9' })
vim.api.nvim_set_hl(0, 'VimwikiLink', { fg = '#8BE9FD' })

vim.cmd.colorscheme("catppuccin-frappe")

vim.o.title = true
