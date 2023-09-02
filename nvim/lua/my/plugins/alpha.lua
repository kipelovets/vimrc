# Inspired by https://github.com/sho-87/dotfiles/blob/master/nvim/lua/plugins/modules/alpha.lua

local M = {
	"goolord/alpha-nvim",
	enabled = true,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
}


local panda = {
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣆⠀⢀⣀⣀⣤⣤⣤⣶⣦⣤⣤⣄⣀⣀⠀⢠⣾⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀   ]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀   ]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀    ]],
	[[ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀    ]],
	[[⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⢿⣿⠟⠀⠀⠀⠀⠀⣀⣤⣤⣤⡀⠀⠀⠀⠀⠀⢀⣤⣤⣤⣄⡀⠀⠀⠀⠀⠘⣿⡿⠿⠃⠀⠀⠀⠀⠀⠀⠀⠀   ]],
	[[⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀⠀⠀⣠⣾⣿⣿⠛⣿⡇⠀⠀⠀⠀⠀⢸⣿⣿⠛⣿⣿⣦⠀⠀⠀⠀⠸⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀    ]],
	[[⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠁⠀⠀⠀⠀⣿⣿⣿⣿⣿⡟⢠⣶⣾⣿⣿⣷⣤⢹⣿⣿⣿⣿⣿⡇⠀⠀⣀⣤⣿⣷⣴⣶⣦⣀⡀⠀⠀⠀⠀   ]],
	[[⠀⠀⠀⠀ ⠀⠀⠀⢀⣠⣤⣤⣤⣇⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⠀⠘⠻⣿⣿⣿⡿⠋⠀⢹⣿⣿⣿⣿⡇⠀⣿⣿⣿⡏⢹⣿⠉⣿⣿⣿⣷⠀⠀⠀   ]],
	[[⠀⠀⠀ ⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠹⣿⣿⠿⠋⠀⢤⣀⢀⣼⡄⠀⣠⠀⠈⠻⣿⣿⠟⠀⢸⣿⣇⣽⣿⠿⠿⠿⣿⣅⣽⣿⡇⠀⠀   ]],
	[[⠀⠀⠀⠀ ⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣟⠁⠀⠀⠀⠈⣿⣿⣿⡇⠀⠀⠀  ]],
	[[⠛⠛⠛⠛⠛⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛]],
	[[⠀⠀⠀⠀⠀⠀⠘⠛⠻⢿⣿⣿⣿⣿⣿⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀    ]],
}


function M.config()
	local theme = require("alpha.themes.theta")
    local project_list = require("telescope._extensions.project.utils").get_projects("recent")
	local path_ok, plenary_path = pcall(require, "plenary.path")
	if not path_ok then
		return
	end

	math.randomseed(os.time())

	-- Header
	local function get_header(headers)
		local header_text = headers[math.random(#headers)]
		local lines = {}
		for i, line in ipairs(header_text) do
			local tbl = {
				type = "text",
				val = line,
				opts = {
					hl = "HeaderGradient" .. i,
					shrink_margin = false,
					position = "center",
				},
			}
			table.insert(lines, tbl)
		end

		return {
			type = "group",
			val = lines,
			opts = { position = "center" },
		}
	end

	-- Links / tools
	local dashboard = require("alpha.themes.dashboard")
	local links = {
		type = "group",
		val = {
			dashboard.button("p", "📋 Projects", "<cmd>Telescope project<CR>"),
		},
		position = "center",
	}

	-- MRU
	local function get_mru(max_shown)
		local tbl = {
			{ type = "text", val = "Recent Files", opts = { hl = "SpecialComment", position = "center" } },
		}

		local mru_list = theme.mru(10, "", max_shown)
		for _, file in ipairs(mru_list.val) do
			table.insert(tbl, file)
		end

		return { type = "group", val = tbl, opts = {} }
	end

	-- Projects
	local function get_projects(max_shown)
		local tbl = {
			{ type = "text", val = "Recent Projects", opts = { hl = "SpecialComment", position = "center" } },
		}

		for i, project in ipairs(project_list) do
			if i > max_shown then
				break
			end

			local icon = "📁 "

			-- create shortened path for display
			local target_width = 35
			local display_path = project.path:gsub("/", "\\"):gsub("\\\\", "\\")
			if #display_path > target_width then
				display_path = plenary_path.new(display_path):shorten(1, { -2, -1 })
				if #display_path > target_width then
					display_path = plenary_path.new(display_path):shorten(1, { -1 })
				end
			end

			local letter = "" .. i
			local project_name = display_path:match("[/\\][%w%s%.%-]*$")
			if project_name == nil then
				project_name = display_path
			end
			project_name = project_name:gsub("[/\\]", "")

			-- create button element
			local file_button_el = dashboard.button(
				letter,
				icon .. display_path,
				"<cmd>lua require('telescope.builtin').find_files( { cwd = '"
					.. project.path:gsub("\\", "/")
					.. "' }) <cr>"
			)

			-- create hl group for the start of the path
			local fb_hl = {}
			table.insert(fb_hl, { "Comment", 0, #icon + #display_path - #project_name })
			file_button_el.opts.hl = fb_hl

			table.insert(tbl, file_button_el)
		end

		return {
			type = "group",
			val = tbl,
			opts = {},
		}
	end

	-- Layout
	theme.config.layout = {
		{ type = "padding", val = 4 },
		get_header({ panda }),
		{ type = "padding", val = 1 },
		links,
		{ type = "padding", val = 2 },
		get_projects(5),
		{ type = "padding", val = 2 },
		get_mru(7),
	}
	require("alpha").setup(theme.config)
end

return M
