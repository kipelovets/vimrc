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
    path = path or ""
    path = path:gsub("\\", "/"):gsub("//", "/")
    local pattern = "[^/]+/[^/]+$"
    return string.sub(path, string.find(path, pattern) or 1)
end

return M
