local M = {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = { "BufReadPost", "BufNewFile" },
}

local is_git_repo = function()
    local path = vim.loop.cwd() .. "/.git"
    local ok, _ = vim.loop.fs_stat(path)
    if not ok then
        return false
    else
        return true
    end
end

function M.config()
    local custom = require("lualine.themes.catppuccin")

    local lualine = require("lualine")

    vim.api.nvim_create_autocmd("RecordingEnter", {
        callback = function()
            lualine.refresh({
                place = { "statusline" },
            })
        end,
    })

    vim.api.nvim_create_autocmd("RecordingLeave", {
        callback = function()
            local timer = vim.loop.new_timer()
            timer:start(
                50,
                0,
                vim.schedule_wrap(function()
                    lualine.refresh({
                        place = { "statusline" },
                    })
                end)
            )
        end,
    })

    lualine.setup({
        options = {
            theme = custom,
            globalstatus = true,
            section_separators = "",
            component_separators = "",
            disabled_filetypes = {
                statusline = { "alpha" },
                winbar = { "neo-tree", "OverseerList", "alpha", "dap-repl" },
            },
            refresh = {
                statusline = 1000,
                tabline = 2000,
                winbar = 500,
            },
        },
        sections = {
            lualine_a = {
                {
                    "mode",
                    padding = 2,
                    separator = { right = "" },
                },
                {
                    "macro-recording",
                    fmt = function()
                        local recording_register = vim.fn.reg_recording()
                        if recording_register == "" then
                            return ""
                        else
                            return "Recording @" .. recording_register
                        end
                    end
                }
            },
            lualine_b = {
                {
                    function()
                        return " "
                    end,
                    cond = is_git_repo,
                    -- color = colours.status_icon,
                    separator = { right = "" },
                },
                {
                    "branch",
                    icon = "",
                    padding = { left = 0, right = 2 },
                    -- color = { fg = require("colours").textLight, bg = colours.status },
                    on_click = function()
                        require("telescope.builtin").git_branches()
                    end,
                },
                {
                    "diff",
                    symbols = { added = " ", modified = " ", removed = " " },
                    -- color = { bg = colours.status },
                    padding = { left = 0, right = 2 },
                    on_click = function()
                        require("telescope.builtin").git_status()
                    end,
                    separator = { left = "", right = "" },
                },
            },
            lualine_c = {
                {
                    function()
                        return "⚐"
                    end,
                    -- color = colours.status_icon,
                    separator = { right = "" },
                    cond = function()
                        if #vim.diagnostic.get(0, { severity = { min = vim.diagnostic.severity.HINT } }) > 0 then
                            return true
                        else
                            return false
                        end
                    end,
                },
                {
                    "diagnostics",
                    -- color = { bg = colours.status },
                    padding = { left = 1, right = 2 },
                    on_click = function()
                        vim.cmd("TroubleToggle")
                    end,
                    separator = { left = "", right = "" },
                },
            },
            lualine_x = {
                {
                    "filetype",
                    colored = false,
                    -- color = { fg = colours.textLight, bg = colours.status },
                    separator = { left = "" },
                    icon = { align = "left" },
                    on_click = function()
                        vim.ui.input({
                            prompt = "Enter new filetype: ",
                            default = vim.bo.filetype,
                            completion = "filetype",
                        }, function(input)
                            if input ~= nil and input ~= "" then
                                vim.cmd("set filetype=" .. input)
                            end
                        end)
                    end,
                },
            },
            lualine_y = {
                {
                    separator = { left = "" },
                    function()
                        local msg = "No active LSP"
                        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                        local clients = vim.lsp.get_active_clients()
                        if next(clients) == nil then
                            return msg
                        end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return client.name
                            end
                        end
                        return msg
                    end,
                    -- color = { fg = colours.teAlice KlayxtLight, bg = colours.status },
                    padding = { left = 1, right = 2 },
                    icon = " ",
                    on_click = function()
                        vim.cmd("LspInfo")
                    end,
                },
            },
            lualine_z = {
                {
                    function()
                        return ""
                    end,
                    -- color = colours.status_icon,
                    separator = { left = "" },
                },
                {
                    "location",
                    padding = { left = 1, right = 0 },
                    fmt = function(str, _)
                        local loc = vim.split(str, ":")
                        return string.format("%d : %d/%d", loc[2], loc[1], vim.api.nvim_buf_line_count(0))
                    end,
                    on_click = function()
                        vim.ui.input({
                            prompt = "Go to line: ",
                            default = vim.fn.line("."),
                        }, function(input)
                            if input ~= nil and input ~= "" then
                                vim.cmd("normal! " .. input .. "G")
                            end
                        end)
                    end,
                },
                {
                    "progress",
                    padding = 1,
                    fmt = function(str, _)
                        return string.format(": %s", str)
                    end,
                },
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = { { "filetype", color = { fg = "grey" }, colored = false } },
            lualine_y = {},
            lualine_z = {},
        },
        extensions = {
            "lazy",
            "man",
            "neo-tree",
            "nvim-dap-ui",
            "quickfix",
            "toggleterm",
            "trouble",
            "overseer",
        },
    })
end

return M
