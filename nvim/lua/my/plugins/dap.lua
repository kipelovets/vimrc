return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            { "rcarriga/nvim-dap-ui" },
            { "theHamsta/nvim-dap-virtual-text" },
            { "nvim-telescope/telescope-dap.nvim" },
        },
        config = function()
            local dap = require("dap")
            local dap_config = require("my.dap")
            dap.adapters.php = {
                type = 'executable',
                command = 'node',
                args = { dap_config.vscode_php_debug_path .. '/out/phpDebug.js' }
            }

            dap.configurations.php = {
                {
                    type = 'php',
                    request = 'launch',
                    name = 'Listen for Xdebug',
                    port = 9000,
                    pathMappings = {
                        ["/data/application"] = "${workspaceFolder}"
                    }
                }
            }

            local dapui = require("dapui")
            dapui.setup {}
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            require("nvim-dap-virtual-text").setup {
                commented = true,
            }

            require('telescope').load_extension('dap')
        end
    },
}
