return {
    'pwntester/octo.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        -- OR 'ibhagwan/fzf-lua',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        if vim.fn.executable('hg') ~= 1 then
            return
        end
        require "octo".setup()
    end
}
