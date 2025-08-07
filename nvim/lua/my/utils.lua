local M = {}

M.cd = function(path, name)
    local _utils = require("telescope._extensions.project.utils")
    print("CD -> " .. path)
    _utils.change_project_dir(path)
    vim.cmd("Alpha")
    vim.o.titlestring = name
end

M.shorten_path = function(path)
    local target_length = 35
    path = path or ""
    path = path:gsub("\\", "/"):gsub("//", "/")
    local pattern = "[^/]+/[^/]+$"
    local result = string.sub(path, string.find(path, pattern) or 1)
    if #result > target_length then
        result = result:gsub("[^/]+/", "")
        if #result > target_length then
            result = result:sub(0, target_length - 3) .. "..."
        end
    end
    return result
end

M.get_visual_selection = function()
    local lines = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.fn.mode() })

    return table.concat(lines, "\n")
end

M.get_branch = function ()
    local fhead = io.open(".git/HEAD")
    if fhead then
        local head = fhead:read()
        fhead:close()
        local branch = head:match('ref: refs/heads/(.+)$')
        if not branch then
            branch = head:sub(1, 6)
        end

        return branch
    end

    return ""
end

return M
