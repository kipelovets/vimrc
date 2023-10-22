return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            hijack_cursor = true,
            update_focused_file = {
                enable = true,
                update_root = false,
                ignore_list = { "vimwiki", "help" }
            },
            sync_root_with_cwd = true,
            reload_on_bufenter = true,
            respect_buf_cwd = true,
            select_prompts = true,
            filters = {
                git_ignored = false,
                custom = { "^\\.git$", "^\\.idea$" }
            }

        })
    end
}
