local vscode_php_debug_path = vim.fn.stdpath("data") .. "/vscode-php-debug"
if not vim.loop.fs_stat(vscode_php_debug_path) then
    vim.fn.system({
        "git",
        "clone",
        "https://github.com/xdebug/vscode-php-debug.git",
        vscode_php_debug_path,
    })

    vim.fn.system("cd " .. vscode_php_debug_path .. " && npm install && npm run build")
end

return { vscode_php_debug_path = vscode_php_debug_path }
