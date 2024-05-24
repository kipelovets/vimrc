vim.api.nvim_create_user_command('DiffBranch', function()
    local output = vim.fn.system { 'git', 'merge-base', 'develop', 'HEAD' }
    vim.cmd("Git diff " .. output .. " HEAD")
end, {})
