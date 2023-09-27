local nmap = function(shortcut, command, desc)
    vim.keymap.set("n", shortcut, command, { desc = desc })
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
nmap("<leader>gf", ":Flog<cr>")

nmap('<leader>/', ':let @/=""<bar>echo "search cleared"<cr>')

vim.keymap.set({ "n", "i", "v" }, keybindings.save, "<esc>:w<cr>")

nmap(keybindings.prev_tab, ':BufferLineCyclePrev<cr>')
nmap(keybindings.next_tab, ':BufferLineCycleNext<cr>')
nmap('<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>')
nmap('<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>')
nmap('<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>')
nmap('<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>')
nmap('<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>')
nmap('<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>')
nmap('<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>')
nmap('<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>')
nmap('<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>')

nmap(keybindings.new_tab, ':enew<cr>')
nmap('<C-q>', ':bd<cr>')

nmap('<leader>fp', ":Telescope project theme=dropdown<cr>")

local builtin = require('telescope.builtin')
nmap(keybindings.find_files, builtin.find_files)
nmap('<leader>ff', builtin.find_files)
nmap('<leader>fg', builtin.live_grep)
nmap('<leader>fb', builtin.buffers)
nmap('<leader>fh', builtin.help_tags)
nmap('<leader>fo', function()
    builtin.oldfiles({ only_cwd = true })
end)
nmap('<leader>fO', builtin.oldfiles)
nmap('<leader>fc', function()
    builtin.colorscheme { enable_preview = true, preview = true }
end)
nmap('<leader>fd', ':Telescope file_browser<cr>')
nmap('<leader>fe', ':Telescope gitmoji theme=dropdown<cr>')
nmap('<leader>ft', ':Telescope treesitter<cr>')
nmap('<leader>gb', ':Telescope git_branches<cr>')
nmap('<leader>fs', ':Telescope lsp_document_symbols<cr>')
nmap('<leader>fa', ':Telescope lsp_dynamic_workspace_symbols<cr>')

nmap('<leader>t', ':NvimTreeOpen<cr>')
nmap('<leader>T', ':NvimTreeToggle<cr>')

nmap('<leader>s', ':Alpha<cr>')

vim.keymap.set(
    { "n", "x" },
    "<leader>rr",
    function() require('refactoring').select_refactor() end
)

vim.keymap.set({ "i" }, "<c-t>", '<Plug>luasnip-expand-or-jump')

nmap('<c-`>', ':ToggleTerm<cr>')
function _G.my_set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', '<c-`>', '<cmd>ToggleTerm<cr>', opts)
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua my_set_terminal_keymaps()')

nmap('<leader>j',
    ':%!/opt/homebrew/bin/php -r \'echo json_encode(json_decode(file_get_contents("php://stdin")), JSON_PRETTY_PRINT);\'<cr>:set filetype=json<cr>')
nmap('<leader>J',
    ':%!/opt/homebrew/bin/php -r \'echo json_encode(json_decode(file_get_contents("php://stdin")));\'<cr>:set filetype=json<cr>')

local font = require("my.font")
vim.keymap.set({ 'n' }, '<D-=>', font.increase_font)
vim.keymap.set({ 'n' }, '<D-->', font.decrease_font)
vim.keymap.set({ 'n' }, '<D-0>', font.reset_font)
vim.keymap.set({ 'n' }, '<leader>p', font.present)

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function() require('dap.ui.widgets').hover() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function() require('dap.ui.widgets').preview() end)

nmap("<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor")
nmap("<leader>dE", "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input")
nmap("<leader>dC", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint")
nmap("<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI")
nmap("<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect")
nmap("<leader>de", "<cmd>lua require'dapui'.eval()<cr>", "Evaluate")
nmap("<leader>dg", "<cmd>lua require'dap'.session()<cr>", "Get Session")
nmap("<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables")
nmap("<leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes")
nmap("<leader>dp", "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause")
nmap("<leader>dq", "<cmd>lua require'dap'.close()<cr>", "Quit")
nmap("<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl")
nmap("<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", "Terminate")
