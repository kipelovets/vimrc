if vim.g.neovide then
	vim.o.guifont = "Fira Code:h12"
end

vim.o.mouse = "a"
vim.o.number = true
vim.o.breakindent = true
vim.o.signcolumn = 'yes'
vim.o.termguicolors = true
vim.o.termguicolors = true
vim.o.cursorline = true

vim.o.foldmethod="indent"
vim.o.foldlevel=99

vim.o.mousehide = true

vim.o.expandtab = true
vim.o.shiftwidth=4
vim.o.softtabstop=4
vim.o.tabstop=4
vim.o.smartindent = true

vim.cmd("set noswapfile")
vim.cmd("set nobackup")
