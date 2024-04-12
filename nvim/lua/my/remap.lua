local nmap = function(shortcut, command, desc)
    vim.keymap.set("n", shortcut, command, { desc = desc })
end

local keybindings = require("my.keybindings")

if vim.g.neovide then
    nmap(keybindings.neovide, ":silent exec '!neovide'<cr>")
end

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
nmap(keybindings.duplicate, "yyp")
nmap(keybindings.select_all, "ggVG")
-- delete into black hole
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

nmap("<leader>/", function()
    vim.api.nvim_command(':let @/=""')
    require("noice").cmd("dismiss")

    local wins = vim.api.nvim_list_wins()
    for _, win in ipairs(wins) do
        if vim.api.nvim_win_get_config(win).relative ~= '' then
            vim.api.nvim_win_close(win, false)
        end
    end
end, "Clear search & popups")

-- Git

nmap("<leader>gw", ":Gw<cr>", "Git write")
nmap("<leader>gs", ":G<cr>", "Git status")
nmap("<leader>gc", ":G commit<cr>", "Git commit")
nmap("<leader>go", ":Git pull<cr>", "Git pull")
nmap("<leader>gp", ":Git push<cr>", "Git push")
nmap("<leader>gf", ":Flog<cr>", "Git log")
nmap("<leader>gF", ":Flog -all<cr>", "Git log all")
nmap("[g", ":lua require'gitsigns'.prev_hunk()<cr>", "Goto previous hunk")
nmap("]g", ":lua require'gitsigns'.next_hunk()<cr>", "Goto next hunk")

-- Buffers

vim.keymap.set({ "n", "i", "v" }, keybindings.save, "<esc>:w<cr>", { desc = "Save" })

nmap(keybindings.prev_tab, ":BufferLineCyclePrev<cr>", "Tab: previous")
nmap(keybindings.next_tab, ":BufferLineCycleNext<cr>", "Tab: next")
nmap(keybindings.tab_move_right, ":BufferLineMoveNext<cr>", "Tab: move right")
nmap(keybindings.tab_move_left, ":BufferLineMovePrev<cr>", "Tab: move left")
nmap("<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", "Tab: select #1")
nmap("<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", "Tab: select #2")
nmap("<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", "Tab: select #3")
nmap("<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", "Tab: select #4")
nmap("<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", "Tab: select #5")
nmap("<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", "Tab: select #6")
nmap("<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", "Tab: select #7")
nmap("<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", "Tab: select #8")
nmap("<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", "Tab: select #9")

nmap(keybindings.new_tab, ":enew<cr>", "Tab: new")
nmap("<c-q>", "<Plug>(smartq_this)", "Tab: close")

-- Telescope

nmap("<leader>fp", ":Telescope project theme=dropdown<cr>", "Telescope: projects")

local builtin = require("telescope.builtin")
nmap(keybindings.find_files, builtin.find_files, "Telescope: files")
nmap("<leader>fg", builtin.live_grep, "Telescope: grep")
nmap("<leader>fG", function()
    local dir = vim.fn.input("Directory to grep: ", "./", "dir")
    local file_glob = vim.fn.input("File glob pattern: ", "*")
    builtin.live_grep({ search_dirs = { dir }, glob_pattern = file_glob })
end, "Telescope: grep in specific dir / glob pattern")

nmap("<leader>fb", builtin.buffers, "Telescope: open buffers")
nmap("<leader>fh", builtin.help_tags, "Telescope: help tags")
nmap("<leader>fo", function()
    builtin.oldfiles({ only_cwd = true })
end, "Telescope: oldfiles in cwd")
nmap("<leader>fO", builtin.oldfiles, "Telescope: oldfiles across all dirs")
nmap("<leader>fc", function()
    builtin.colorscheme { enable_preview = true, preview = true }
end, "Telescope: colorschemes")
nmap("<leader>fd", ":Telescope file_browser<cr>", "Telescope: file browser")
nmap("<leader>fe", ":Telescope gitmoji theme=dropdown<cr>", "Telescope: gitmoji")
nmap("<leader>ft", ":Telescope treesitter<cr>", "Telescope: treesitter document symbols")
nmap("<leader>gb", ":Telescope git_branches<cr>", "Telescope: git branches")
nmap("<leader>fs", ":Telescope lsp_document_symbols<cr>", "Telescope: LSP document symbols")
nmap("<leader>fa", ":Telescope lsp_dynamic_workspace_symbols<cr>", "Telescope: LSP workspace symbols")
nmap("<leader>fC", ":Telescope commands<cr>", "Telescope: VIM commands")
nmap("<leader>fm", "<cmd>Telescope marks<cr>", "Telescope: VIM marks")

-- <c-d>/<c-u> - scroll preview

-- Terminal

nmap("<c-`>", ":ToggleTerm<cr>", "Terminal: open")
nmap("<c-`>1", ":1ToggleTerm<cr>", "Terminal: open #1")
nmap("<c-`>2", ":2ToggleTerm<cr>", "Terminal: open #2")
nmap("<c-`>3", ":3ToggleTerm<cr>", "Terminal: open #3")

-- Presentation

local font = require("my.font")
nmap('<D-=>', font.increase_font, "Font: increase")
nmap('<D-->', font.decrease_font, "Font: decrease")
nmap('<D-0>', font.reset_font, "Font: reset")
nmap('<leader>p', font.present, "Start presentation")

-- Debugging

nmap('<F5>', function() require('dap').continue() end, "DAP: start listening / continue")
nmap('<F10>', function() require('dap').step_over() end, "DAP: step over")
nmap('<F11>', function() require('dap').step_into() end, "DAP: step into")
nmap('<F12>', function() require('dap').step_out() end, "DAP: step out")
nmap('<Leader>db', function() require('dap').toggle_breakpoint() end, "DAP: toggle breakpoint")
nmap('<Leader>dl', function() require('dap').run_last() end, "DAP: run last")
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function() require('dap.ui.widgets').hover() end, {
    desc =
    "DAP: hover widgets"
})
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function() require('dap.ui.widgets').preview() end, { desc = "DAP: preview" })

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

-- Testing

nmap("<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", "Attach")
nmap("<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File")
nmap("<leader>tF", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File")
nmap("<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last")
nmap("<leader>tL", "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last")
nmap("<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest")
nmap("<leader>tN", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest")
nmap("<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output")
nmap("<leader>tS", "<cmd>lua require('neotest').run.stop()<cr>", "Stop")
nmap("<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary")

-- Misc

nmap("<leader>t", ":NvimTreeFindFile<cr>", "NvimTree: open on current file")
nmap("<leader>T", ":NvimTreeToggle<cr>", "NvimTree: toggle")

nmap("<leader>so", ":SymbolsOutline<cr>", "Symbols outline")

nmap("<leader>s", ":Alpha<cr>", "Open Alpha start page")

vim.keymap.set(
    { "n", "x" },
    "<leader>rr",
    function() require("refactoring").select_refactor() end,
    { desc = "Refactor" }
)

vim.keymap.set({ "i" }, "<c-t>", "<Plug>luasnip-expand-or-jump", { desc = "Luasnip: expand or jump" })

nmap("<leader>j",
    ':%!/opt/homebrew/bin/php -r \'echo json_encode(json_decode(file_get_contents("php://stdin")), JSON_PRETTY_PRINT);\'<cr>:set filetype=json<cr>',
    "JSON pretty format")
nmap("<leader>J",
    ':%!/opt/homebrew/bin/php -r \'echo json_encode(json_decode(file_get_contents("php://stdin")));\'<cr>:set filetype=json<cr>',
    "JSON compact format")

nmap("[<cr>", "<cmd>Hi {<cr>", "Higlight: previous")
nmap("]<cr>", "<cmd>Hi }<cr>", "Highlight: next")

vim.keymap.set("n", "g:", function()
    -- get current buffer and window
    local buf = vim.api.nvim_get_current_buf()
    local win = vim.api.nvim_get_current_win()
    -- create a new split for the repl
    vim.cmd("split")
    -- spawn repl and set the context to our buffer
    require("neorepl").new {
        lang = "vim",
        buffer = buf,
        window = win,
    }
    -- resize repl window and make it fixed height
    vim.cmd("resize 10 | setl winfixheight")
end, { desc = "NeoRepl" })
