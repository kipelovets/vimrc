return {
    'https://github.com/kipelovets/telescope-gitmoji.nvim.git',
    config = function()
        local telescope = require 'telescope'
        telescope.load_extension('gitmoji')
    end
}
