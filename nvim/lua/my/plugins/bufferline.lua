local M = {
    "akinsho/bufferline.nvim",
    enabled = true,
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons", "tiagovla/scope.nvim" },
    event = "VimEnter",
}

function M.config()
    require("bufferline").setup({
        options = {
            mode = "buffers", -- set to "tabs" to only show tabpages instead
            numbers = "none",
            close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
            left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
            middle_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
            right_mouse_command = "vertical sbuffer %d", -- can be a string | function, see "Mouse actions"
            indicator = {
                icon = "▎", -- this should be omitted if indicator style is not 'icon'
                style = "icon",
            },
            buffer_close_icon = "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            max_name_length = 25,
            max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
            truncate_names = true,  -- whether or not tab names should be truncated
            tab_size = 22,
            diagnostics = false,
            color_icons = true,       -- whether or not to add the filetype icon highlights
            show_buffer_icons = true, -- disable filetype icons for buffers
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = true,
            show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
            persist_buffer_sort = true,   -- whether or not custom sorted buffers should persist
            separator_style = "thick",
            enforce_regular_tabs = false,
            always_show_bufferline = true,
            sort_by = "insert_after_current",
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "NeoTree",
                    text_align = "center",
                    separator = true,
                },
                {
                    filetype = "NvimTree",
                    text = "NvimTree",
                    text_align = "center",
                    separator = true,
                },
            },
            custom_filter = function(buf, buf_nums)
                local ft = vim.bo[buf].filetype
                if ft == "help" or ft == "qf" or ft == "fugitive" then
                    return false
                end
                return true
            end,
            groups = {
                options = {
                    toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
                },
                items = {
                    {
                        name = "Wiki", -- Mandatory
                        -- highlight = {underline = true, sp = "blue"}, -- Optional
                        priority = 1, -- determines where it will appear relative to other groups (Optional)
                        icon = "󰖬", -- Optional
                        matcher = function(buf) -- Mandatory
                            return buf.path ~= nil and buf.path:match('%.wiki')
                        end,
                    },
                }
            }
        },
    })
end

return M
