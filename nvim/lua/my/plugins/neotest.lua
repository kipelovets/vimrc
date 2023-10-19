return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-python",
        "DasOhmoff/neotest-jest",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    args = { "--log-level", "DEBUG", "--quiet" },
                    runner = "pytest",
                }),

                require('neotest-jest')({
                    jestCommand = "yarn test",
                }),
            }
        })
    end
}
