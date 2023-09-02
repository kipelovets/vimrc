local nmap = function (shortcut, command)
	vim.keymap.set("n", shortcut, command)
end

if vim.g.neovide then
    nmap("<D-n>", ":silent exec '!neovide'<cr>")
end

-- keeping cursor where it was when merging lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keeping cursor in the center
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- paste without replacing the buffer contents
vim.keymap.set("x", "<leader>p", [["_dP]])
-- system clipboard 
vim.keymap.set({"n", "v"}, "<D-c>", [["+y]])
vim.keymap.set({"n", "i"}, "<D-v>", [[<Esc>"+p]])
nmap('<D-c>', '^v$h"+yj')
nmap('<D-d>', 'yyp')
nmap('<D-a>', 'ggVG')
-- delete into black hole
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

nmap("<leader>f", vim.lsp.buf.format)

nmap("<leader>gw", ":Gw<cr>")
nmap("<leader>gs", ":G<cr>")
nmap("<leader>gc", ":G commit<cr>")
nmap("<leader>go", ":Git pull<cr>")
nmap("<leader>gp", ":Git push<cr>")
nmap("<leader>s", ":Dashboard<cr>")

nmap('<leader>/', ':let @/=""<bar>echo "search cleared"<cr>')

vim.keymap.set({"n", "i"}, "<D-s>", "<esc>:w<cr>")

nmap('<D-left>', ':bp<cr>')
nmap('<D-right>', ':bn<cr>')

nmap('<D-t>', ':enew<cr>')
nmap('<C-q>', ':bd<cr>')

local telescope = require("telescope")
nmap('<leader>fp', telescope.extensions.project.project)

local builtin = require('telescope.builtin')
nmap('<D-p>', builtin.find_files)
nmap('<leader>ff', builtin.find_files)
nmap('<leader>fg', builtin.live_grep)
nmap('<leader>fb', builtin.buffers)
nmap('<leader>fh', builtin.help_tags)
nmap('<leader>fo', builtin.oldfiles)
nmap('<leader>fc', builtin.colorscheme)

nmap('<leader>t', ':Neotree reveal<cr>')
nmap('<leader>T', ':Neotree close<cr>')

nmap('<leader>s', ':Alpha<cr>')
