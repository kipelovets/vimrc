return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup {}

        function _G.my_set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<c-`>", "<cmd>ToggleTerm<cr>", opts)
            vim.keymap.set("t", "<c-`>1", "<cmd>1ToggleTerm<cr>")
            vim.keymap.set("t", "<c-`>2", "<cmd>2ToggleTerm<cr>")
            vim.keymap.set("t", "<c-`>3", "<cmd>3ToggleTerm<cr>")
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
        end

        vim.cmd("autocmd! TermOpen term://* lua my_set_terminal_keymaps()")
    end
}
