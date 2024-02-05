return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        messages = {
            enabled = true,
            view = "mini"
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    }
}
