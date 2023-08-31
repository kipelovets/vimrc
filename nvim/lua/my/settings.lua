if vim.g.neovide then
	-- vim.o.guifont = "Source Code Pro:h10"
end

vim.o.mouse = "a"
vim.o.number = true
vim.o.breakindent = true
vim.o.signcolumn = 'yes'
vim.o.termguicolors = true
vim.o.termguicolors = true
vim.o.cursorline = true

-- let g:startify_custom_header =
--     \ map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
-- let g:startify_list_order = ['sessions', 'bookmarks']
-- let g:startify_change_to_dir = 1
-- let g:startify_bookmarks = ['~/.vimrc']


vim.o.foldmethod="indent"
vim.o.foldlevel=99

vim.o.mousehide = true

vim.o.expandtab = true
vim.o.shiftwidth=4
vim.o.softtabstop=4
vim.o.tabstop=4
vim.o.smartindent = true

vim.o.nobackup = true
vim.o.noswapfile = true
