require("my.lazy")
require("lazy").setup("my.plugins", {
    change_detection = {
        notify = false,
    },
})

require("my.remap")
require("my.settings")
