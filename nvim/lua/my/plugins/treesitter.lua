return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "vim", "vimdoc", "typescript", "php", "go", "javascript", "html", "bash",
                "tsx" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
        vim.opt.runtimepath:append("~/.local/share/nvim/lazy/nvim-treesitter/parser/")
    end
}
