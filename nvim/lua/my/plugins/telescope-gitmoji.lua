return {
    "https://github.com/kipelovets/telescope-gitmoji.nvim.git",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("telescope").load_extension("gitmoji")
    end
}
