return {
    { 'rose-pine/neovim',               lazy = false, priority = 1000, name = 'rose-pine' },
    { 'uloco/bluloco.nvim',             lazy = false, priority = 1000, dependencies = { 'rktjmp/lush.nvim' }, },
    { "folke/tokyonight.nvim",          lazy = false, priority = 1000, },
    { "oxfist/night-owl.nvim",          lazy = false, priority = 1000, },
    { "bluz71/vim-nightfly-colors",     lazy = false, priority = 1000, },
    { "catppuccin/nvim",                lazy = false, priority = 1000, name = 'catppuccin' },
    { "rebelot/kanagawa.nvim",          lazy = false, priority = 1000, },
    { 'Rigellute/shades-of-purple.vim', lazy = false, priority = 1000, },
    { 'kepano/flexoki-neovim',          lazy = false, priority = 1000, },
    { 'maxmx03/solarized.nvim',         lazy = false, priority = 1000, },
    { 'projekt0n/github-nvim-theme',    lazy = false, priority = 1000, },
    {
        'maxmx03/fluoromachine.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            glow = true,             -- false
            theme = 'fluoromachine', -- fluoromachine, retrowave, delta
            transparent = false,     -- false
        },
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = true,
        opts = {
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "",  -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {},
            dim_inactive = true,
            transparent_mode = false,
        }
    },
    {
        "baliestri/aura-theme",
        lazy = false,
        priority = 1000,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
        end
    },
    { "EdenEast/nightfox.nvim",        lazy = false, priority = 1000 },
    { 'fcpg/vim-fahrenheit',           lazy = false, priority = 1000 },
    { 'fcpg/vim-farout',               lazy = false, priority = 1000 },
    { 'sainnhe/everforest',            lazy = false, priority = 1000 },
    { 'zenbones-theme/zenbones.nvim',  lazy = false, priority = 1000 },
    { 'wadackel/vim-dogrun',           lazy = false, priority = 1000 },
    { 'sainnhe/sonokai',               lazy = false, priority = 1000 },
    {
        'jpwol/thorn.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            background = "cold"
        }
    },
}
