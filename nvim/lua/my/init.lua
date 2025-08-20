require("my.settings-pre")

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
require("my.settings")
require("my.dap")

require("my.git")
require("my.php")

require("my.remap")

local auto_open_project = os.getenv("NVIM_PROJECT")
if auto_open_project then
    print("Opening project " .. auto_open_project)
    require('my.utils').open_project(auto_open_project)
end
