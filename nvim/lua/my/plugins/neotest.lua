return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-python",
    },
    config = function()
        require("neotest").setup({
            require("neotest-python")({
                args = { "--log-level", "DEBUG", "--quiet" },
                runner = "pytest",
            }),
            require("plenary"),
        })
    end
}
