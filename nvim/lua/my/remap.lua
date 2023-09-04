local nmap = function(shortcut, command)
    vim.keymap.set("n", shortcut, command)
end

local keybindings = require('my.keybindings')

if vim.g.neovide then
    nmap(keybindings.neovide, ":silent exec '!neovide'<cr>")
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
vim.keymap.set({ "n", "v" }, keybindings.copy, [["+y]])
vim.keymap.set({ "n", "i" }, keybindings.paste, [[<Esc>"+p]])
nmap(keybindings.copy_line, '^v$h"+yj')
nmap(keybindings.duplicate, 'yyp')
nmap(keybindings.select_all, 'ggVG')
-- delete into black hole
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])


nmap("<leader>gw", ":Gw<cr>")
nmap("<leader>gs", ":G<cr>")
nmap("<leader>gc", ":G commit<cr>")
nmap("<leader>go", ":Git pull<cr>")
nmap("<leader>gp", ":Git push<cr>")

nmap('<leader>/', ':let @/=""<bar>echo "search cleared"<cr>')

vim.keymap.set({ "n", "i" }, keybindings.save, "<esc>:w<cr>")

nmap(keybindings.prev_tab, ':bp<cr>')
nmap(keybindings.next_tab, ':bn<cr>')

nmap(keybindings.new_tab, ':enew<cr>')
nmap('<C-q>', ':bd<cr>')

local telescope = require("telescope")
nmap('<leader>fp', telescope.extensions.project.project)

local builtin = require('telescope.builtin')
nmap(keybindings.find_files, builtin.find_files)
nmap('<leader>ff', builtin.find_files)
nmap('<leader>fg', builtin.live_grep)
nmap('<leader>fb', builtin.buffers)
nmap('<leader>fh', builtin.help_tags)
nmap('<leader>fo', builtin.oldfiles)
nmap('<leader>fc', builtin.colorscheme)
nmap('<leader>fd', ':Telescope file_browser<cr>')
nmap('<leader>fe', ':Telescope gitmoji<cr>')

nmap('<leader>t', ':NvimTreeOpen<cr>')
nmap('<leader>T', ':NvimTreeToggle<cr>')

nmap('<leader>s', ':Alpha<cr>')

vim.keymap.set(
    {"n", "x"},
    "<leader>rr",
    function() require('refactoring').select_refactor() end
)

vim.keymap.set({"i"}, "<Tab>", '<Plug>luasnip-expand-or-jump')
