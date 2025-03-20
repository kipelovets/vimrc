-- Inspired by:
-- https://github.com/sho-87/dotfiles/blob/master/nvim/lua/plugins/modules/alpha.lua
-- https://gist.github.com/fbontin/03daa7bb8e79d97241c2cf26bbacdfa7

local M = {
    "goolord/alpha-nvim",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
}

local utils = require("my.utils")

local gwent = {
    [[ ██████╗ ██╗    ██╗███████╗███╗   ██╗████████╗]],
    [[██╔════╝ ██║    ██║██╔════╝████╗  ██║╚══██╔══╝]],
    [[██║  ███╗██║ █╗ ██║█████╗  ██╔██╗ ██║   ██║   ]],
    [[██║   ██║██║███╗██║██╔══╝  ██║╚██╗██║   ██║   ]],
    [[╚██████╔╝╚███╔███╔╝███████╗██║ ╚████║   ██║   ]],
    [[ ╚═════╝  ╚══╝╚══╝ ╚══════╝╚═╝  ╚═══╝   ╚═╝   ]],
}

local function get_extension(fn)
    fn = fn or ""
    local match = fn:match("^.+(%..+)$")
    local ext = ""
    if match ~= nil then
        ext = match:sub(2)
    end
    return ext
end

local function get_icon(fn)
    local nwd = require("nvim-web-devicons")
    local ext = get_extension(fn)
    return nwd.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn)
    fn = fn or ""
    local dashboard = require("alpha.themes.dashboard")
    short_fn = short_fn or fn
    local ico_txt
    local fb_hl = {}

    local ico, hl = get_icon(fn)
    if hl then
        table.insert(fb_hl, { hl, 0, #ico })
    end
    ico_txt = ico .. "  "
    local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <CR>")
    local fn_start = short_fn:match(".*[/\\]")
    if fn_start ~= nil then
        table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt })
    end
    file_button_el.opts.hl = fb_hl
    return file_button_el
end

local function mru(start, items_number)
    local tbl = {
        { type = "text", val = "Recent Files", opts = { hl = "SpecialComment", position = "center" } },
    }
    local counter = 0
    for i, fname in pairs(vim.v.oldfiles) do
        if counter >= items_number then
            break
        end
        if vim.fn.filereadable(fname) == 1 then
            local short_fn = utils.shorten_path(fname)
            local shortcut = tostring(counter + start)

            local file_button_el = file_button(fname, shortcut, short_fn)
            tbl[counter] = file_button_el
            counter = counter + 1
        end
    end

    return tbl
end

function M.config()
    local theme = require("alpha.themes.theta")
    local dashboard = require("alpha.themes.dashboard")
    local project_list = require("telescope._extensions.project.utils").get_projects("recent")

    -- Links / tools
    local links = {
        type = "group",
        val = {
            dashboard.button("p", "🚧 Projects", "<cmd>Telescope project theme=dropdown<CR>"),
            dashboard.button("d", "📁 Explore", "<cmd>Telescope file_browser<CR>"),
            dashboard.button("e", "✏️  Empty buffer", "<cmd>Alpha<CR>"),
        },
        position = "center",
    }

    local function make_header(header_lines)
        local lines = {}
        for _, line in ipairs(header_lines) do
            table.insert(lines, {
                type = "text",
                val = line,
                opts = {
                    hl = "Gwent",
                    position = "center"
                },
            })
        end

        vim.api.nvim_set_hl(0, 'Gwent', { fg = '#038742' })

        return {
            type = "group",
            val = lines,
            opts = { position = "center" },
        }
    end

    -- MRU
    local function get_mru(max_shown)
        return { type = "group", val = mru(10, max_shown), opts = {} }
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

            local project_path = project.path:gsub("\\", "/")
            local display_path = utils.shorten_path(project_path)

            local letter = "" .. i
            local project_name = display_path:match("/[^/]+$")
            if project_name == nil then
                project_name = display_path
            end
            project_name = project_name:gsub("/", "")

            local cmd = "<cmd>lua require('my.utils').cd('" .. project_path .. "', '" .. project_name .. "')<cr>"

            -- create button element
            local file_button_el = dashboard.button(
                letter,
                icon .. display_path,
                cmd
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

    local header

    if jit.os == "OSX" then
        require("alpha.term")
        header = {
            type = "terminal",
            -- command = "bash ~/.config/nvim/gwent-logo.sh",
            -- width = 80,
            -- height = 20,
            -- command = "bash ~/.config/nvim/larian-logo.sh",
            -- width = 54,
            -- height = 40,
            command = "bash ~/.config/nvim/larian-warsaw-logo.sh",
            width = 58,
            height = 40,
            opts = {
                position = "center",
                hl = "String",
            },
        }
    else
        header = make_header(gwent)
    end

    -- Layout
    theme.config.layout = {
        { type = "padding", val = 4 },
        header,
        { type = "padding", val = 4 },
        links,
        { type = "padding", val = 2 },
        get_projects(5),
        { type = "padding", val = 2 },
        get_mru(7),
    }
    require("alpha").setup(theme.config)
end

return M
