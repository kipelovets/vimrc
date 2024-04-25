return {
    "nvim-telescope/telescope-smart-history.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "kkharji/sqlite.lua",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("telescope").load_extension("smart_history")
    end
}
