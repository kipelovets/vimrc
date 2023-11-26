require("my.lazy")
require("lazy").setup("my.plugins", {
    change_detection = {
        notify = false,
    },
    git = {
        timeout = 300,
    },
    install = {
        colorscheme = { "catppuccin-frappe" },
    },
    ui = {
        border = "double",
        title = "Lazy",
    }
})
require("my.dap")
require("my.settings")
require("my.remap")
