return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        local function grep_at_current_tree_node()
            local node = require('nvim-tree.lib').get_node_at_cursor()
            if not node then return end
            require('telescope.builtin').live_grep({ search_dirs = { node.absolute_path } })
        end

        local function on_attach(bufnr)
            local api = require('nvim-tree.api')
            api.config.mappings.default_on_attach(bufnr)
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end
            vim.keymap.set('n', '<c-f>', grep_at_current_tree_node, opts('Find in dir'))
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
    end
}
