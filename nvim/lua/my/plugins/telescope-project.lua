return {
    "nvim-telescope/telescope-project.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local project_actions = require("telescope._extensions.project.actions")
        local t = require("telescope");
        t.setup{
            extensions = {
                project = {
                    order_by = "asc",
                    search_by = "title",
                    sync_with_nvim_tree = false,
                    on_project_selected = function(prompt_bufnr)
                        project_actions.change_working_directory(prompt_bufnr, false)
                        vim.o.titlestring = project_actions.get_selected_title(prompt_bufnr)
                    end,
                },
            }
        }
        t.load_extension("project")
    end
}
