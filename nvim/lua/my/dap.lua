local path = require("plenary.path")

local vscode_php_debug_path = vim.fn.stdpath("data") .. path.path.sep .. "vscode-php-debug"
local M = { vscode_php_debug_path = vscode_php_debug_path }

if vim.loop.fs_stat(vscode_php_debug_path) then
    return M
end

vim.defer_fn(function()
    print("vscode-php-debug: cloning")
    vim.fn.system("git clone https://github.com/xdebug/vscode-php-debug.git " .. vscode_php_debug_path)

    print("vscode-php-debug: installing dependencies ")
    vim.cmd("redraw!")
    vim.fn.system("cd " .. vscode_php_debug_path .. " && npm install")

    print("vscode-php-debug: building")
    vim.cmd("redraw!")
    vim.fn.system("cd " .. vscode_php_debug_path .. " && npm run build")

    print("vscode-php-debug: done!")
end, 100)


return M
