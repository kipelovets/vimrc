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
require("my.commands")


local auto_open_project = os.getenv("NVIM_PROJECT")
if auto_open_project then
    print("Opening project " .. auto_open_project)
    require('my.utils').open_project(auto_open_project)
end

require("my.remap").setup()

vim.cmd.packadd("cfilter")

--- diagnostic settings from https://tduyng.com/blog/neovim-basic-setup/
local map = vim.keymap.set

local palette = {
  err = "#51202A",
  warn = "#3B3B1B",
  info = "#1F3342",
  hint = "#1E2E1E",
}

vim.api.nvim_set_hl(0, "DiagnosticErrorLine", { bg = palette.err, blend = 20 })
vim.api.nvim_set_hl(0, "DiagnosticWarnLine", { bg = palette.warn, blend = 15 })
vim.api.nvim_set_hl(0, "DiagnosticInfoLine", { bg = palette.info, blend = 10 })
vim.api.nvim_set_hl(0, "DiagnosticHintLine", { bg = palette.hint, blend = 10 })

vim.api.nvim_set_hl(0, "DapBreakpointSign", { fg = "#FF0000", bg = nil, bold = true })
vim.fn.sign_define("DapBreakpoint", {
  text = "●", -- a large dot; change as desired
  texthl = "DapBreakpointSign", -- the highlight group you just defined
  linehl = "", -- no full-line highlight
  numhl = "", -- no number-column highlight
})

local sev = vim.diagnostic.severity

vim.diagnostic.config({
  -- keep underline & severity_sort on for quick scanning
  underline = true,
  severity_sort = true,
  update_in_insert = false, -- less flicker
  float = {
    border = "rounded",
    source = true,
  },
  -- keep signs & virtual text, but tune them as you like
  signs = {
    text = {
      [sev.ERROR] = " ",
      [sev.WARN] = " ",
      [sev.INFO] = " ",
      [sev.HINT] = "󰌵 ",
    },
  },
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  -- NEW in 0.11 — dim whole line
  linehl = {
    [sev.ERROR] = "DiagnosticErrorLine",
    [sev.WARN] = "DiagnosticWarnLine",
    [sev.INFO] = "DiagnosticInfoLine",
    [sev.HINT] = "DiagnosticHintLine",
  },
})
