return {
    'nvim-telescope/telescope-project.nvim',
    config = function()
        local telescope = require 'telescope'
        telescope.load_extension('project')
    end
}
