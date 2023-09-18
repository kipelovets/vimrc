local M = {}

M.cd = function(path)
    local _utils = require("telescope._extensions.project.utils")
    print("CD -> " .. path)
    _utils.change_project_dir(path)
    vim.cmd("Alpha")
    local api = require("nvim-tree.api")
    api.tree.open()
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

return M
