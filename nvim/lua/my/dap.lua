local path = require("plenary.path")

local M = {
    vscode_php_debug_path = vim.fn.stdpath("data") .. path.path.sep .. "vscode-php-debug" 
}

if not vim.loop.fs_stat(M.vscode_php_debug_path) then
    vim.defer_fn(function()
        print("vscode-php-debug: cloning")
        vim.fn.system("git clone https://github.com/xdebug/vscode-php-debug.git " .. M.vscode_php_debug_path)

        print("vscode-php-debug: installing dependencies ")
        vim.cmd("redraw!")
        vim.fn.system("cd " .. M.vscode_php_debug_path .. " && npm install")

        print("vscode-php-debug: building")
        vim.cmd("redraw!")
        vim.fn.system("cd " .. M.vscode_php_debug_path .. " && npm run build")

        print("vscode-php-debug: done!")
    end, 100)
end

M.vscode_js_debug_path = vim.fn.stdpath("data") .. path.path.sep .. "vscode-js-debug"
if not vim.loop.fs_stat(M.vscode_js_debug_path) then
    vim.defer_fn(function()
        print("vscode-js-debug: cloning")
        vim.fn.system("git clone https://github.com/microsoft/vscode-js-debug.git " .. M.vscode_js_debug_path)

        print("vscode-js-debug: installing dependencies ")
        vim.cmd("redraw!")
        vim.fn.system("cd " .. M.vscode_js_debug_path .. " && npm install")

        print("vscode-js-debug: done!")
    end, 100)
end

return M
