return {
    'olacin/telescope-gitmoji.nvim',
    config = function()
        local telescope = require 'telescope'
        telescope.load_extension('gitmoji')
    end
}
