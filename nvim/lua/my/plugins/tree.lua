return {
    "nvim-tree/nvim-tree.lua",
    config = function()
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
            },
        })
    end
}
