return {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "stevearc/dressing.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    build = function() require("gitlab.server").build(true) end,
    config = function()
        require("gitlab").setup({
            discussion_tree = {
                draft_mode = true,
                tree_type = "by_file_name",
            },
            discussion_signs = {
                severity = vim.diagnostic.severity.WARN,
                virtual_text = true,
                priority = 100,
            },
        })
    end,
}
