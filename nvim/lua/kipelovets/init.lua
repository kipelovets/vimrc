require("kipelovets.remap")
print("hello!!!")
require("kipelovets.settings")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function ()
			local builtin = require('telescope.builtin')
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
	{ 'rose-pine/neovim', name = 'rose-pine' },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "lua", "vim", "vimdoc", "typescript", "php", "go", "javascript", "html", "bash" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
			})
			vim.opt.runtimepath:append("~/.local/share/nvim/lazy/nvim-treesitter/parser/")
		end
	},
	{"tpope/vim-fugitive", keys = {{"<leader>gs", "<cmd>Git status<CR>"}}},
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
		}
	},
	{"vimwiki/vimwiki"},
--	{
--		'glepnir/dashboard-nvim',
--		event = 'VimEnter',
--		config = function()
--			require('dashboard').setup {
--				-- config
--			}
--		end,
--		dependencies = { {'nvim-tree/nvim-web-devicons'}}
--	},
})

vim.cmd('colorscheme rose-pine')

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
