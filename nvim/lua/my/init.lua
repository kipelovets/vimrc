require("my.lazy")
require("my.dap")
require("lazy").setup("my.plugins", {
    change_detection = {
        notify = false,
    },
})

require("my.settings")
require("my.remap")
