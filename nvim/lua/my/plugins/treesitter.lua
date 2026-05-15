return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = 'main',
    config = function()
        require('nvim-treesitter').install { "lua", "vim", "vimdoc", "typescript", "php", "go", "javascript", "html", "bash", "tsx" }
    end
}
