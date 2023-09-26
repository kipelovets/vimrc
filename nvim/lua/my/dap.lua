local Job = require("plenary.job")

local vscode_php_debug_path = vim.fn.stdpath("data") .. "/vscode-php-debug"
local M = { vscode_php_debug_path = vscode_php_debug_path }

if vim.loop.fs_stat(vscode_php_debug_path) then
    return M
end

print("vscode-php-debug: cloning into " .. vscode_php_debug_path)
Job:new({
    command = "git",
    args = {
        "clone",
        "https://github.com/xdebug/vscode-php-debug.git",
        vscode_php_debug_path,
    },
    on_exit = function(j, return_val)
        print(return_val)
        print(vim.json.encode(j:result()))
    end,
}):start()

-- print("vscode-php-debug: installing dependencies ")
-- vim.fn.system("cd " .. vscode_php_debug_path .. " && npm install")
-- print("vscode-php-debug: building")
-- vim.fn.system("cd " .. vscode_php_debug_path .. " && npm run build")


return M
