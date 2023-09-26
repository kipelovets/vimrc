require("my.lazy")
require("lazy").setup("my.plugins", {
    change_detection = {
        notify = false,
    },
})
require("my.dap")
require("my.settings")
require("my.remap")
