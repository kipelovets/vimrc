return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local project_actions = require("telescope._extensions.project.actions")
        local actions = require("telescope.actions")
        require('telescope').setup({
            pickers = {
                find_files = {
                    theme = "dropdown",
                    hidden = true,
                    no_ignore = false,
                    file_ignore_patterns = {
                        "^.git/",
                        "^node_modules/",
                    },
                    path_display = { "truncate" },
                },
                buffers = {
                    theme = "dropdown",
                    mappings = {
                        i = {
                            ["<c-d>"] = actions.delete_buffer,
                        },
                    },
                    path_display = { "truncate" },
                },
                oldfiles = {
                    theme = "dropdown",
                },
                colorschemes = {
                    theme = "dropdown",
                },
                git_branches = {
                    pattern = "refs/heads/**",
                },
            },
            extensions = {
                project = {
                    theme = "dropdown",
                    order_by = "asc",
                    search_by = "title",
                    sync_with_nvim_tree = true,
                    on_project_selected = function(prompt_bufnr)
                        project_actions.change_working_directory(prompt_bufnr, false)
                    end,
                },
                file_browser = {
                    theme = "ivy",
                    hijack_netrw = true,
                    mappings = {
                        n = {
                            ["<esc>"] = "close",
                        },
                    },
                },
                gitmoji = {
                    action = function(entry)
                        vim.fn.setreg('"', entry.value.value)
                        vim.notify("Emoji copied: " .. entry.value.value)
                    end,
                },
            },
            defaults = {
                history = {
                    path = '~/.local/share/nvim/databases/telescope_history.sqlite3',
                    limit = 100,
                },
                mappings = {
                    i = {
                        ["<s-down>"] = require('telescope.actions').cycle_history_next,
                        ["<s-up>"] = require('telescope.actions').cycle_history_prev,
                    },
                },
            },
        })
    end
}
