if vim.g.neovide then
	vim.o.guifont = "FiraCode Nerd Font Mono:h10"
end

vim.o.mouse = "a"
vim.o.number = true
vim.o.breakindent = true
vim.o.signcolumn = 'yes'
vim.o.colorcolumn = "80"
vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.scrolloff = 8

vim.o.foldmethod="indent"
vim.o.foldlevel=99

vim.o.mousehide = true

vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.cmd.colorscheme("kanagawa")
