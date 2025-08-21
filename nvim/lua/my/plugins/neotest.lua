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
            log_level = vim.log.levels.DEBUG,
            discovery = {
                enabled = true,
            },
            adapters = {
                require("neotest-python")({
                    args = { "--log-level", "DEBUG", "--quiet" },
                    runner = "pytest",
                }),

                require('neotest-jest')({
                    jestCommand = "npm test --",
                    jest_test_discovery = true,
                    env = { CI = true },
                    cwd = function(path)
                        return vim.fn.getcwd()
                    end,
                }),

                require("neotest-dotnet"),
            }
        })
    end,
    lazy = true,
    event = { "BufEnter *.test.ts" }
}
