return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local project_actions = require("telescope._extensions.project.actions")
        require('telescope').setup({
            pickers = {
                find_files = {
                    theme = "dropdown",
                    hidden = true,
                    no_ignore = true,
                    file_ignore_patterns = {
                        "node_modules/"
                    }
                },
                buffers = {
                    theme = "dropdown",
                },
                oldfiles = {
                    theme = "dropdown",
                },
                colorschemes = {
                    theme = "dropdown",
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
                    end
                },
                file_browser = {
                    theme = "ivy",
                    hijack_netrw = true,
                },
                gitmoji = {
                    action = function(entry)
                        vim.fn.setreg('"', entry.value.value)
                        vim.notify("Emoji copied: " .. entry.value.value)
                    end
                },
            },
            
        })
    end
}
