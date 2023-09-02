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

local create_gradient = function(start, finish, steps)
	local r1, g1, b1 =
		tonumber("0x" .. start:sub(2, 3)), tonumber("0x" .. start:sub(4, 5)), tonumber("0x" .. start:sub(6, 7))
	local r2, g2, b2 =
		tonumber("0x" .. finish:sub(2, 3)), tonumber("0x" .. finish:sub(4, 5)), tonumber("0x" .. finish:sub(6, 7))

	local r_step = (r2 - r1) / steps
	local g_step = (g2 - g1) / steps
	local b_step = (b2 - b1) / steps

	local gradient = {}
	for i = 1, steps do
		local r = math.floor(r1 + r_step * i)
		local g = math.floor(g1 + g_step * i)
		local b = math.floor(b1 + b_step * i)
		table.insert(gradient, string.format("#%02x%02x%02x", r, g, b))
	end

	return gradient
end

-- string padding
local pad_string = function(str, len, align)
	local str_len = #str
	if str_len >= len then
		return str
	end

	local pad_len = len - str_len
	local pad = string.rep(" ", pad_len)

	if align == "left" then
		return str .. pad
	elseif align == "right" then
		return pad .. str
	elseif align == "center" then
		local left_pad = math.floor(pad_len / 2)
		local right_pad = pad_len - left_pad
		return string.rep(" ", left_pad) .. str .. string.rep(" ", right_pad)
	end
end

function M.config()
	local theme = require("alpha.themes.theta")
    local project_list = require("telescope._extensions.project.utils").get_projects("recent")
	local path_ok, plenary_path = pcall(require, "plenary.path")
	if not path_ok then
		return
	end

	math.randomseed(os.time())

	-- Header
	local function apply_gradient_hl(text)
		local gradient = create_gradient("#DCA561", "#658594", #text)

		local lines = {}
		for i, line in ipairs(text) do
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

			-- create hl group
			vim.api.nvim_set_hl(0, "HeaderGradient" .. i, { fg = gradient[i] })
		end

		return {
			type = "group",
			val = lines,
			opts = { position = "center" },
		}
	end

	local function get_header(headers)
		local header_text = headers[math.random(#headers)]
		return apply_gradient_hl(header_text)
	end

	-- Footer
	local function get_footer(quotes, width)
		local quote_text = quotes[math.random(#quotes)]

		local max_width = width or 35

		local tbl = {}
		for _, text in ipairs(quote_text) do
			local padded_text = pad_string(text, max_width, "right")
			table.insert(tbl, { type = "text", val = padded_text, opts = { hl = "Comment", position = "center" } })
		end

		return {
			type = "group",
			val = tbl,
			opts = {},
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
