return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            { "nvim-neotest/nvim-nio"},
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
                    stopOnEntry = true,
                    pathMappings = {
                        ["/var/www/html"] = "${workspaceFolder}"
                    }
                }
            }

            local dapui = require("dapui")
            dapui.setup {}
            dap.listeners.after.event_initialized["dapui_config"] = function()
                require("nvim-tree.api").tree.close()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                print("terminated")
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                print("exited")
                dapui.close()
            end

            require("nvim-dap-virtual-text").setup {
                commented = true,
            }

            require('telescope').load_extension('dap')

            -- local DEBUGGER_PATH = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug"
            -- require("dap-vscode-js").setup {
            --     node_path = "node",
            --     debugger_path = DEBUGGER_PATH,
            --     -- debugger_cmd = { "js-debug-adapter" },
            --     adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
            -- }

            for _, language in ipairs { "typescript", "javascript" } do
                require("dap").configurations[language] = {
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Launch file",
                        program = "${file}",
                        cwd = "${workspaceFolder}",
                    },
                    {
                        type = "pwa-node",
                        request = "attach",
                        name = "Attach",
                        processId = require("dap.utils").pick_process,
                        cwd = "${workspaceFolder}",
                    },
                    {
                        type = "pwa-node",
                        request = "launch",
                        name = "Debug Jest Tests",
                        -- trace = true, -- include debugger info
                        runtimeExecutable = "node",
                        runtimeArgs = {
                            "./node_modules/jest/bin/jest.js",
                            "--runInBand",
                        },
                        rootPath = "${workspaceFolder}",
                        cwd = "${workspaceFolder}",
                        console = "integratedTerminal",
                        internalConsoleOptions = "neverOpen",
                    },
                }
            end
        end
    },
    { "mxsdev/nvim-dap-vscode-js", module = { "dap-vscode-js" } },
    -- {
    --     "microsoft/vscode-js-debug",
    --     opt = true,
    --     build = {
    --         "npm install --legacy-peer-deps",
    --         "npx gulp vsDebugServerBundle",
    --         jit.os == "Windows" and "Ren dist out" or "mv dist out",
    --     }
    -- },
}
