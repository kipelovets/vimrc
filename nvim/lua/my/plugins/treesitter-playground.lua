return {
    "nvim-treesitter/playground",
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        require "nvim-treesitter.configs".setup {
            query_linter = {
                enable = true,
                use_virtual_text = true,
                lint_events = { "BufWrite", "CursorHold" },
            },
        }
    end
}
