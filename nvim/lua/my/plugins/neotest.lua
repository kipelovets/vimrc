return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-jest",
        "Issafalcon/neotest-dotnet",
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
                    jest_test_discovery = false,
                }),

                require("neotest-dotnet"),
            }
        })
    end,
    lazy = true,
    event = { "BufEnter *.test.ts" }
}
