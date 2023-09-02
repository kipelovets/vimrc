local M = {}

local _utils = require("telescope._extensions.project.utils")
M.cd = function(path)
    print("CD -> " .. path)
    _utils.change_project_dir(path)
    vim.cmd("Alpha")
    local api = require("nvim-tree.api")
    api.tree.open()
end

return M
