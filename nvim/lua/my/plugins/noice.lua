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
    },
    routes = {
        {
            view = "confirm",
            filter = {
                any = {
                    {
                        event = "msg_show",
                        kind = { "echo", "echomsg", "" },
                        -- before = true
                    },
                },
            },
        },
    }
}
