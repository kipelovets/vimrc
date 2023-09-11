local M = {}

M.play = function()
    local buf = vim.api.nvim_create_buf(false, true)
    if buf == 0 then
        error "failed to create game buffer!"
    end

    local width = 100
    local height = 10
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = math.max(
            0,
            math.floor((vim.api.nvim_get_option "lines" - height) / 2) - 1
        ),
        col = math.floor((vim.api.nvim_get_option "columns" - width) / 2),
        style = "minimal",
        border = "single",
    })

    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
    vim.api.nvim_win_set_option(win, "wrap", false)

    local function enable_modification(enable)
        vim.api.nvim_buf_set_option(buf, "modifiable", enable)
    end

    enable_modification(true)
    vim.api.nvim_buf_set_lines(buf, 0, 2, false, { "Hello", "World!" })
    enable_modification(false)
end

return M
