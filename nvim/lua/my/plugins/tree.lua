return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        local function grep_at_current_tree_node()
            local node = require('nvim-tree.api').tree.get_node_under_cursor()
            if not node then return end
            require('telescope.builtin').live_grep({ search_dirs = { node.absolute_path } })
        end

        local function on_attach(bufnr)
            local api = require('nvim-tree.api')
            api.config.mappings.default_on_attach(bufnr)
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end
            vim.keymap.set('n', '<D-f>', grep_at_current_tree_node, opts('Find in dir'))
        end

        require("nvim-tree").setup({
            hijack_cursor = true,
            update_focused_file = {
                enable = false, -- focus tree on opened file
                update_root = false,
                ignore_list = { "vimwiki", "help" },
            },
            sync_root_with_cwd = true,
            reload_on_bufenter = true,
            respect_buf_cwd = true,
            select_prompts = true,
            filters = {
                git_ignored = false,
                custom = { "^\\.git$", "^\\.idea$" },
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                    resize_window = false,
                },
            },
            view = {
                preserve_window_proportions = true,
                width = {
                    min = 30,
                    max = 200,
                    padding = 1,
                },
            },
            on_attach = on_attach,
        })

        -- Make :bd and :q behave as usual when tree is visible
        vim.api.nvim_create_autocmd({ 'BufEnter', 'QuitPre' }, {
            nested = false,
            callback = function(e)
                local tree = require('nvim-tree.api').tree

                -- Nothing to do if tree is not opened
                if not tree.is_visible() then
                    return
                end

                -- How many focusable windows do we have? (excluding e.g. incline status window)
                local winCount = 0
                for _, winId in ipairs(vim.api.nvim_list_wins()) do
                    if vim.api.nvim_win_get_config(winId).focusable then
                        winCount = winCount + 1
                    end
                end

                -- We want to quit and only one window besides tree is left
                if e.event == 'QuitPre' and winCount == 2 then
                    vim.api.nvim_cmd({ cmd = 'qall' }, {})
                end

                -- :bd was probably issued an only tree window is left
                -- Behave as if tree was closed (see `:h :bd`)
                if e.event == 'BufEnter' and winCount == 1 then
                    -- Required to avoid "Vim:E444: Cannot close last window"
                    vim.defer_fn(function()
                        -- close nvim-tree: will go to the last buffer used before closing
                        tree.toggle({ find_file = true, focus = true })
                        -- re-open nivm-tree
                        tree.toggle({ find_file = true, focus = false })
                    end, 10)
                end
            end
        })
    end
}
