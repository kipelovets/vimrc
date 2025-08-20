local M = {}

local table_merge = function(first_table, second_table)
    for k, v in pairs(second_table) do first_table[k] = v end
    return first_table
end

M.cd = function(path, name, close_alpha)
    print("CD -> " .. path)
    local _utils = require("telescope._extensions.project.utils")
    _utils.change_project_dir(path)
    if close_alpha then
        vim.cmd("Alpha")
    end
    vim.o.titlestring = name
end

M.format_project_name = function(project)
    local project_path = project.path:gsub("\\", "/")
    local display_path = M.shorten_path(project_path)

    local project_name = display_path:match("/[^/]+$")
    if project_name == nil then
        project_name = display_path
    end
    project_name = project_name:gsub("/", "")

    return project_name
end

M.open_project = function(name)
    local project_list = require("telescope._extensions.project.utils").get_projects("recent")
    for i, project in ipairs(project_list) do
        local project_name = M.format_project_name(project)
        local project_path = project.path:gsub("\\", "/")

        if project_name == name then
            local _utils = require("telescope._extensions.project.utils")
            _utils.change_project_dir(project_path)
            vim.o.titlestring = name
            return
        end
    end
    print("Project not found: " .. name)
end

M.list_projects = function()
    local project_list = require("telescope._extensions.project.utils").get_projects("recent")
    for i, project in ipairs(project_list) do
        print(M.format_project_name(project))
    end
end
vim.api.nvim_create_user_command('PrintProjects', M.list_projects, {})

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

M.get_visual_selection = function()
    local lines = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.fn.mode() })

    return table.concat(lines, "\n")
end

M.get_branch = function()
    local fhead = io.open(".git/HEAD")
    if fhead then
        local head = fhead:read()
        fhead:close()
        local branch = head:match('ref: refs/heads/(.+)$')
        if not branch then
            branch = head:sub(1, 6)
        end

        return branch
    end

    return ""
end

M.list_issues = function()
    local config = {
        domain = vim.env.JIRA_DOMAIN,
        user = vim.env.JIRA_USER,
        token = vim.env.JIRA_API_TOKEN,
        key = vim.env.JIRA_PROJECT_KEY,
        api_version = 3,
        auth_type = "Basic",
    }

    local Utils = require("jira.utils")
    local curl = require("plenary.curl")

    local headers = {
        ["Content-Type"] = "application/json",
    }
    if config.auth_type == "Bearer" then
        headers["Authorization"] = "Bearer " .. config.token
    else
        headers["Authorization"] = "Basic " .. Utils.b64encode(config.user .. ":" .. config.token)
    end
    local response =
        curl.get(
            "https://" ..
            config.domain ..
            "/rest/api/" .. config.api_version .. "/search/jql?jql=assignee=currentUser()&fields=summary,key", {
                headers = headers,
            })
    if response.status < 400 then
        local respData = vim.fn.json_decode(response.body)
        local result = {}
        for _, issue in ipairs(respData.issues) do
            table.insert(result, { key = issue.key, summary = issue.fields.summary })
        end

        return result
    else
        print("Non 200 response: " .. response.status)
    end
end

M.copy_issue = function(opts)
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local conf = require("telescope.config").values
    local actions = require "telescope.actions"
    local action_state = require "telescope.actions.state"

    opts = table_merge(
        require("telescope.themes").get_dropdown {},
        opts or {}
    )

    pickers.new(opts, {
        prompt_title = "Your jiras",
        finder = finders.new_table {
            results = M.list_issues(),
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry.key .. " " .. entry.summary,
                    ordinal = entry.summary,
                }
            end
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                -- print(vim.inspect(selection))
                -- vim.api.nvim_put({ selection.value.key }, "", false, true)
                vim.fn.setreg("+", selection.value.key)
                print("Copied: " .. selection.value.key)
            end)
            return true
        end,
    }):find()
end

return M
