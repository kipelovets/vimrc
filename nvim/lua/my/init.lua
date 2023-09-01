require("my.remap")
require("my.settings")

require("my.lazy")

require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function ()
			local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<D-p>', builtin.find_files, {})
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},
	{
		'nvim-telescope/telescope-project.nvim',
		config = function ()
			local telescope = require'telescope'
			telescope.load_extension('project')
			vim.keymap.set('n', '<leader>fp', telescope.extensions.project.project, {})
		end
	},
	{ 'rose-pine/neovim', name = 'rose-pine',
		config = function ()
			vim.cmd('colorscheme rose-pine')
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "lua", "vim", "vimdoc", "typescript", "php", "go", "javascript", "html", "bash", "tsx" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
			vim.opt.runtimepath:append("~/.local/share/nvim/lazy/nvim-treesitter/parser/")
		end
	},
	{"tpope/vim-fugitive"},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		},
		config = function ()
			require("my.lsp")
		end
	},
	{"vimwiki/vimwiki"},
	{ 'numToStr/Comment.nvim', opts = {} },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function ()
			vim.keymap.set('n', '<leader>t', ':Neotree reveal<cr>', {})
			vim.keymap.set('n', '<leader>T', ':Neotree close<cr>', {})
			require("neo-tree").setup({
				use_libuv_file_watcher=true,
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
			})
		end
	},
	{
		'glepnir/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup ({
				shortcut_type = "number"
			})
		end,
		dependencies = { {'nvim-tree/nvim-web-devicons'}}
	},
})

