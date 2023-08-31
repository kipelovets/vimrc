vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without replacing the buffer contents
vim.keymap.set("x", "<leader>p", [["_dP]])
-- clipboard 
vim.keymap.set({"n", "v"}, "<D-c>", [["+y]])
vim.keymap.set({"n", "i"}, "<D-v>", [[<Esc>"+p]])
-- delete into black hole
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


vim.keymap.set("n", "<leader>gw", ":Gw<cr>")
vim.keymap.set("n", "<leader>gs", ":G<cr>")
vim.keymap.set("n", "<leader>gc", ":G commit<cr>")
vim.keymap.set("n", "<leader>go", ":Git pull<cr>")
vim.keymap.set("n", "<leader>gp", ":Git push<cr>")
vim.keymap.set("n", "<leader>s", ":Dashboard<cr>")

local nmap = function (shortcut, command)
	vim.keymap.set("n", shortcut, command)
end

nmap('<D-c>', '^v$h"+yj')
nmap('<leader>/', ':let @/=""<bar>echo "search cleared"<cr>')

vim.keymap.set({"n", "i"}, "<D-s>", "<esc>:w<cr>")

nmap('<D-left>', ':tabprev<cr>')
nmap('<D-right>', ':tabnext<cr>')
