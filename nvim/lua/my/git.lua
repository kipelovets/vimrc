vim.api.nvim_create_user_command('DiffBranch', function()
    local branches = { 'develop', 'master', 'main' }
    local branch = nil
    for _, v in ipairs(branches) do
        local res = vim.fn.system { 'git', 'rev-parse', '--verify', 'refs/heads/' .. v }
        if nil == string.find(res, "fatal: Needed a single revision") then
            branch = v
            break
        end
    end
    if nil == branch then
        vim.notify("Base branch not found", vim.log.levels.ERROR)
        return
    end
    local output = vim.fn.system { 'git', 'merge-base', branch, 'HEAD' }
    output = output:gsub("%s+", "")
    vim.cmd("Git diff " .. output .. " HEAD")
end, {})
