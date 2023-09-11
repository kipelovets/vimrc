local M = {}


local font_size_step = 1.25
local presentation_font_size = 2.0

M.increase_font = function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * font_size_step
end

M.decrease_font = function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor / font_size_step
end

M.reset_font = function()
    vim.g.neovide_scale_factor = 1.0
end

M.present = function()
    vim.cmd("NvimTreeClose")
    vim.g.neovide_scale_factor = presentation_font_size
    vim.defer_fn(function ()
        vim.cmd("PresentingStart")
    end, 300)
end

M.reset_font()

return M
