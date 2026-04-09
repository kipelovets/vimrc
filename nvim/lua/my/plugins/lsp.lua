return {
    -- LSP Support
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
        local on_lsp_attach = require('my.remap').on_lsp_attach

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = on_lsp_attach,
        })

        -----------
        --
        -- Vue/Nuxt
        --
        -----------

        -- lspconfig.volar.setup {
        --     filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        --     init_options = {
        --         vue = {
        --             hybridMode = false,
        --         },
        --     },
        -- }

        -----------
        --
        -- React
        --
        -----------

        -- local lspconfig = require('lspconfig')
        --
        vim.lsp.config('ts_ls', {
            filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        })
        vim.lsp.enable('ts_ls')

        -----------
        --
        -- Other languages
        --
        -----------

        vim.lsp.config('lua_ls', {
            cmd = { 'lua-language-server' },
            filetypes = { 'lua' },
        })
        vim.lsp.enable('lua_ls')

        vim.lsp.config('expert', {
            cmd = { 'expert', '--stdio' },
            root_markers = { 'mix.exs', '.git' },
            filetypes = { 'elixir', 'eelixir', 'heex' },
        })
        vim.lsp.enable('expert')

        -- lspconfig.pylsp.setup({})
        -- lspconfig.sqlls.setup {
        --     root_dir = lspconfig.util.find_git_ancestor
        -- }
        vim.lsp.config('phpactor', {
            cmd = { 'phpactor', 'language-server' },
            init_options = {
                ["language_server_phpstan.enabled"] = true,
                ["language_server_psalm.enabled"] = true,
                ["language_server_php_cs_fixer.enabled"] = true,
                ["symfony.enabled"] = true,
                ["phpunit.enabled"] = true,
                ["logging.enabled"] = true,
                ["logging.level"] = "debug",
            },
            filetypes = { 'php' },
            workspace_required = false,
        })
        vim.lsp.enable('phpactor')
        -- lspconfig.bashls.setup {}
        -- lspconfig.terraformls.setup {}
        -- lspconfig.eslint.setup {}
        -- lspconfig.lemminx.setup {}
        --
        -- vim.filetype.add {
        --     pattern = {
        --         ['api.*%.ya?ml'] = 'yaml.openapi',
        --     },
        -- }
        -- lspconfig.vacuum.setup {
        --     cmd = { 'vacuum', 'language-server' },
        --     filetypes = { 'yaml.openapi', 'json.openapi' },
        -- }
    end,
}
