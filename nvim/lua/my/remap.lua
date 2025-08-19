local os_specific_shortcut = require("my.shortcuts")

local nmap = function(shortcut, command, desc)
    vim.keymap.set("n", os_specific_shortcut(shortcut), command, { desc = desc, remap = false, silent = true })
end
local vmap = function(shortcut, command, desc)
    vim.keymap.set("v", os_specific_shortcut(shortcut), command, { desc = desc, remap = false, silent = true })
end
local tmap = function(shortcut, command, desc)
    vim.keymap.set("t", os_specific_shortcut(shortcut), command, { desc = desc, remap = false, silent = true })
end

local map = function(modes, shortcut, command, desc)
    vim.keymap.set(modes, os_specific_shortcut(shortcut), command, { desc = desc, remap = false, silent = true })
end


if vim.g.neovide then
    nmap("<d-n>", "<cmd>silent exec '!neovide &'<cr>")
    nmap("<d-c-f>", "<cmd>let g:neovide_fullscreen = !g:neovide_fullscreen<cr>")
end

-- keeping cursor in the center
nmap("<c-d>", "<C-d>zz")
nmap("<c-u>", "<C-u>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- paste without replacing the buffer contents
vim.keymap.set("x", "<leader>p", [["_dP]])
-- system clipboard
vim.keymap.set({ "n", "v" }, "<d-c>", [["+y]])
vim.keymap.set({ "n", "i" }, "<d-v>", [[<Esc>"+p]])
nmap("<d-c>", '^v$h"+yj')
nmap("<d-d>", "yyp")
nmap("<d-a>", "ggVG")
nmap("<leader>yl", "<cmd>let @+=expand('%').':'.line('.') | echo 'Copied '.@+<cr>",
    "Copy filename & line number to clipboard")
nmap("<leader>yg", function()
    local utils  = require("my.utils")
    local branch = utils.get_branch()
    vim.fn.setreg("+", branch)
    print("Copied: " .. branch)
end, "Copy Git branch to clipboard")
nmap("<leader>yc", "<cmd>PhpCopyClassName<cr>", "Copy PHP class name to clipboard")


nmap("<leader><leader>", function()
    -- cleanup search
    vim.api.nvim_command(':let @/=""')
    -- cleanup notifications
    require("noice").cmd("dismiss")

    -- cleanup popup windows
    local wins = vim.api.nvim_list_wins()
    for _, win in ipairs(wins) do
        if vim.api.nvim_win_get_config(win).relative ~= '' then
            vim.api.nvim_win_close(win, false)
        end
    end

    -- close DAP ui
    require 'dapui'.close()
    vim.cmd("DapVirtualTextForceRefresh")

    -- close NvimTree
    -- require'nvim-tree.api'.tree.close()

    -- close SymbolsOutline
    -- vim.cmd("SymbolsOutlineClose")

    -- close quickfix
    -- vim.cmd("cclose")
end, "Clear search & popups")

nmap(";", ":%s/\\<<c-r><c-w>\\>/<c-r><c-w>/g<Left><Left>", "Rename word under cursor in buffer")

-- Git

nmap("<leader>gs", "<cmd>Neogit<cr>", "Git status")
nmap("<leader>gO", "<cmd>OpenInGHFileLines<cr>", "Open in GitHub")
nmap("<leader>gf", "<cmd>Flog<cr>", "Git log")
nmap("<leader>gF", "<cmd>Flog -all<cr>", "Git log all")
nmap("<leader>gff", "<cmd>Flog -path=%<cr>", "Git log current file")
nmap("[g", "<cmd>lua require'gitsigns'.prev_hunk()<cr>", "Goto previous hunk")
nmap("]g", "<cmd>lua require'gitsigns'.next_hunk()<cr>", "Goto next hunk")
nmap('<leader>gp', "<cmd>lua require'gitsigns'.preview_hunk()<cr>", "Preview hunk")
nmap('<leader>gd', "<cmd>lua require'gitsigns'.diffthis()<cr>", "Diff this")

-- Buffers

map({ "n", "i", "v" }, "<d-s>", "<cmd>w<cr><esc>", "Save")

nmap("<d-left>", "<cmd>BufferLineCyclePrev<cr>", "Buffer: previous")
nmap("<c-s-tab>", "<cmd>BufferLineCyclePrev<cr>", "Buffer: previous")
nmap("<d-right>", "<cmd>BufferLineCycleNext<cr>", "Buffer: next")
nmap("<c-tab>", "<cmd>BufferLineCycleNext<cr>", "Buffer: next")
nmap("<d-s-right>", "<cmd>BufferLineMoveNext<cr>", "Buffer: move right")
nmap("<d-s-left>", "<cmd>BufferLineMovePrev<cr>", "Buffer: move left")
nmap("<d-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer: select #1")
nmap("<d-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", "Buffer: select #2")
nmap("<d-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", "Buffer: select #3")
nmap("<d-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", "Buffer: select #4")
nmap("<d-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", "Buffer: select #5")
nmap("<d-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", "Buffer: select #6")
nmap("<d-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", "Buffer: select #7")
nmap("<d-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", "Buffer: select #8")
nmap("<d-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", "Buffer: select #9")

nmap('<leader>q', "<cmd>:tabclose<cr>", "Tab close")
nmap('<d-}>', "<cmd>:tabnext<cr>", "Tab next")
nmap('<d-{>', "<cmd>:tabprev<cr>", "Tab prev")
nmap('<d-z>', "<cmd>ZenMode<cr>", "Zen mode")

nmap("<d-t>", "<cmd>enew<cr>", "Tab: new")
nmap("<c-q>", "<Plug>(smartq_this)", "Buf: close")
nmap("<leader>wq", function()
    vim.cmd("BufferLineCycleNext")
    vim.cmd("bd #")
end, "Buf: close")

nmap("<c-w><s-o>", "<cmd>Wipeout<cr>", "Buf: close others")
nmap("<c-s-q>", "<cmd>%bd<cr>", "Buf: close all")

-- Telescope

nmap("<leader>fp", "<cmd>Telescope project theme=dropdown<cr>", "Telescope: projects")

local builtin = require("telescope.builtin")
nmap("<d-p>", builtin.find_files, "Telescope: files")
vmap("<d-p>", function()
    local utils = require('my.utils')
    local lines = utils.get_visual_selection()
    print(vim.inspect(lines))
    builtin.find_files({ default_text = lines })
end, "Telescope: files")

nmap("<d-s-p>", function()
    builtin.find_files({ no_ignore = true })
end, "Telescope: files (no ignore)")
vmap("<d-s-p>", function()
    local utils = require('my.utils')
    local lines = utils.get_visual_selection()
    print(vim.inspect(lines))
    builtin.find_files({ default_text = lines, no_ignore = true })
end, "Telescope: files")

nmap("<d-s-f>", function()
    local dir = vim.fn.input("Directory to grep: ", "./", "dir")
    local file_glob = vim.fn.input("File glob pattern: ", "*")
    builtin.live_grep({ search_dirs = { dir }, glob_pattern = file_glob })
end, "Telescope: find in specific dir / glob pattern")
vmap("<d-s-f>", function()
    local utils = require('my.utils')
    local lines = utils.get_visual_selection()
    print(vim.inspect(lines))

    local dir = vim.fn.input("Directory to grep: ", "./", "dir")
    local file_glob = vim.fn.input("File glob pattern: ", "*")
    builtin.live_grep({ search_dirs = { dir }, glob_pattern = file_glob, default_text = lines })
end, "Telescope: find selected text in specific dir / glob pattern")

nmap("<d-f>", builtin.live_grep, "Telescope: find in files")
vmap("<d-f>", function()
    local utils = require('my.utils')
    local lines = utils.get_visual_selection()
    print(vim.inspect(lines))
    builtin.live_grep({ default_text = lines })
end, "Telescope: find selected text")

nmap("<leader>fb", builtin.buffers, "Telescope: open buffers")
nmap("<leader>fH", builtin.help_tags, "Telescope: help tags")
nmap("<leader>fo", function()
    builtin.oldfiles({ only_cwd = true })
end, "Telescope: oldfiles in cwd")
nmap("<leader>fO", builtin.oldfiles, "Telescope: oldfiles across all dirs")
nmap("<leader>fc", function()
    builtin.colorscheme { enable_preview = true, preview = true }
end, "Telescope: colorschemes")
nmap("<leader>fd", "<cmd>Telescope file_browser<cr>", "Telescope: file browser")
nmap("<leader>fg", "<cmd>Telescope gitmoji theme=dropdown<cr>", "Telescope: gitmoji")
nmap("<leader>fe", "<cmd>Telescope emoji theme=dropdown<cr>", "Telescope: emoji")
nmap("<leader>ft", "<cmd>Telescope treesitter<cr>", "Telescope: treesitter document symbols")
nmap("<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", "Telescope: LSP document symbols")
nmap("<leader>fa", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Telescope: LSP workspace symbols")
nmap("<leader>fC", "<cmd>Telescope commands<cr>", "Telescope: VIM commands")
nmap("<leader>fM", "<cmd>Telescope marks<cr>", "Telescope: VIM marks")
nmap("<leader>fR", "<cmd>Telescope registers<cr>", "Telescope: VIM registers")

-- Terminal

nmap("<leader>`", "<cmd>ToggleTerm<cr>", "Terminal: open")
nmap("<c-`>1", "<cmd>1ToggleTerm<cr>", "Terminal: open #1")
nmap("<c-`>2", "<cmd>2ToggleTerm<cr>", "Terminal: open #2")
nmap("<c-`>3", "<cmd>3ToggleTerm<cr>", "Terminal: open #3")
tmap('<d-k>', [[<C-\><C-N>:lua ClearTerm(0)<CR>]], "Terminal: clear")
tmap('<d-s-k>', [[<C-\><C-N>:lua ClearTerm(1)<CR>]], "Terminal: clear and reset")

function _G.my_set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "q", "<cmd>ToggleTerm<cr>", opts)
    vim.keymap.set("t", "<c-`>1", "<cmd>1ToggleTerm<cr>")
    vim.keymap.set("t", "<c-`>2", "<cmd>2ToggleTerm<cr>")
    vim.keymap.set("t", "<c-`>3", "<cmd>3ToggleTerm<cr>")
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<c-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<c-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<c-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<c-l>", [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set("t", "<c-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua my_set_terminal_keymaps()")


function ClearTerm(reset)
    vim.opt_local.scrollback = 1

    vim.api.nvim_command("startinsert")
    if reset == 1 then
        vim.api.nvim_feedkeys("reset", 't', false)
    else
        vim.api.nvim_feedkeys("clear", 't', false)
    end
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<cr>', true, false, true), 't', true)

    vim.opt_local.scrollback = 10000
end

-- Presentation

local font = require("my.font")
nmap("<d-=>", font.increase_font, "Font: increase")
nmap("<d-->", font.decrease_font, "Font: decrease")
nmap("<d-0>", font.reset_font, "Font: reset")
nmap("<leader><s-p>", font.present, "Start presentation")

-- Debugging

nmap("<f5>", function() require("dap").continue() end, "DAP: start listening / continue")
nmap("<f10>", function() require("dap").step_over() end, "DAP: step over")
nmap("<f11>", function() require("dap").step_into() end, "DAP: step into")
nmap("<f12>", function() require("dap").step_out() end, "DAP: step out")
nmap("<leader>db", function() require("dap").toggle_breakpoint() end, "DAP: toggle breakpoint")
nmap("<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end,
    "DAP: set breakpoint with condition")
nmap("<Leader>dl", function() require("dap").run_last() end, "DAP: run last")
vim.keymap.set({ "n", "v" }, "<Leader>dh", function() require("dap.ui.widgets").hover() end, {
    desc =
    "DAP: hover widgets"
})
vim.keymap.set({ "n", "v" }, "<Leader>dp", function() require("dap.ui.widgets").preview() end, { desc = "DAP: preview" })

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

nmap("<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", "Test: Attach")
nmap("<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Test: Run File")
nmap("<leader>tF", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test: Debug File")
nmap("<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", "Test: Run Last")
nmap("<leader>tL", "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Test: Debug Last")
nmap("<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", "Test: Run Nearest")
nmap("<leader>tN", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test: Debug Nearest")
nmap("<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Test: Output")
nmap("<leader>to", "<cmd>lua require('neotest').output_panel.open()<cr>", "Test: Output panel")
nmap("<leader>tS", "<cmd>lua require('neotest').run.stop()<cr>", "Test: Stop")
nmap("<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", "Test: Summary")

-- Misc

nmap("<leader>t", "<cmd>NvimTreeFindFile<cr>", "NvimTree: open on current file")
nmap("<leader>T", "<cmd>NvimTreeToggle<cr>", "NvimTree: toggle")

nmap("<leader>so", "<cmd>SymbolsOutline<cr>", "Symbols outline")

vim.keymap.set(
    { "n", "x" },
    "<leader>rr",
    function() require("refactoring").select_refactor() end,
    { desc = "Refactor" }
)

vim.keymap.set({ "i" }, "<c-t>", "<Plug>luasnip-expand-or-jump<cr>", { desc = "Luasnip: expand or jump" })
vim.api.nvim_set_keymap("i", "<a-down>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<a-down>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<a-up>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<a-up>", "<Plug>luasnip-prev-choice", {})

nmap("<leader>cF", "<cmd>Neoformat<cr>", "Format with Neoformat")
nmap("<leader>j",
    ':%!/opt/homebrew/bin/php -r \'echo json_encode(json_decode(file_get_contents("php://stdin")), JSON_PRETTY_PRINT);\'<cr>:set filetype=json<cr>',
    "JSON pretty format")
nmap("<leader>J",
    ':%!/opt/homebrew/bin/php -r \'echo json_encode(json_decode(file_get_contents("php://stdin")));\'<cr>:set filetype=json<cr>',
    "JSON compact format")

nmap("[<cr>", "<cmd>Hi {<cr>", "Higlight: previous")
nmap("]<cr>", "<cmd>Hi }<cr>", "Highlight: next")

nmap("<c-s-space>", "<cmd>VimwikiToggleListItem<cr>", "Vimwiki: toggle checkbox")
nmap("<leader>x", "<cmd>VimwikiToggleListItem<cr>", "Vimwiki: toggle checkbox")

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

-- markbar is disabled due to problems with ShaDa
-- nmap ('<Leader>m', '<plug>ToggleMarkbar')

-- Windows

nmap("<c-h>", "<cmd>wincmd h<cr>", "Window: left")
nmap("<c-l>", "<cmd>wincmd l<cr>", "Window: right")
nmap("<c-j>", "<cmd>wincmd j<cr>", "Window: down")
nmap("<c-k>", "<cmd>wincmd k<cr>", "Window: up")
nmap("<c-+>", "<cmd>res +1<cr>", "Windows: upsize")
nmap("<c-_>", "<cmd>res -1<cr>", "Windows: upsize")

-- PHP
nmap("gsd", "<cmd>GoToSymfonyDefinition<CR>", "[G]o to [S]ymfony [D]efinition")
vim.keymap.set("v", "gss", require("my.php").open_service)

-- Marks
local recall = require("recall")

vim.keymap.set("n", "<leader>mm", recall.toggle, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>mn", recall.goto_next, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>mp", recall.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>mc", recall.clear, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fm", ":Telescope recall<CR>", { noremap = true, silent = true })

-- Harpoon

local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>fh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)

vim.api.nvim_set_keymap('n', '<leader>D', '', {
    noremap = true,
    callback = function()
        for _, client in ipairs(vim.lsp.buf_get_clients()) do
            require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
        end
    end
})

nmap("<leader>cc", "<cmd>TtCamel<cr>", "Convert to camelCase")
nmap("<leader>sc", "<cmd>TtSnake<cr>", "Convert to snake_case")


nmap("<leader>jv", ":JiraView<cr>", "View Jira issue")
nmap("<leader>jo", ":JiraOpen<cr>", "Open Jira issue in browser")
nmap("<leader>jl", function() require("my.utils").copy_issue() end, "List jiras assigned to me")
