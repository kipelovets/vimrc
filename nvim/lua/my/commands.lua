vim.api.nvim_create_user_command('SudoWrite', function()
    vim.cmd("w !sudo tee % > /dev/null")
end, {})
