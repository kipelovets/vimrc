local lsp = require('lsp-zero').preset({})

local on_lsp_attach = require('my.remap').on_lsp_attach

lsp.on_attach(on_lsp_attach)

require("neodev").setup({})

local lspconfig = require('lspconfig')

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
-- lspconfig.ts_ls.setup({
--     on_attach = on_attach,
--     filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
-- })

-----------
--
-- Other languages
--
-----------

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.pylsp.setup({})
lspconfig.sqlls.setup {
    root_dir = lspconfig.util.find_git_ancestor
}
lspconfig.phpactor.setup {
    on_attach = on_lsp_attach,
    init_options = {
        ["language_server_phpstan.enabled"] = true,
        ["language_server_psalm.enabled"] = true,
        ["language_server_php_cs_fixer.enabled"] = true,
        ["symfony.enabled"] = true,
        ["phpunit.enabled"] = true,
        ["logging.enabled"] = true,
        ["logging.level"] = "debug",
    }
}
lspconfig.bashls.setup {}
lspconfig.terraformls.setup {}
lspconfig.eslint.setup {}
lspconfig.lemminx.setup {}

vim.filetype.add {
    pattern = {
        ['api.*%.ya?ml'] = 'yaml.openapi',
    },
}
lspconfig.vacuum.setup {
    cmd = { 'vacuum', 'language-server' },
    filetypes = { 'yaml.openapi', 'json.openapi' },
    -- root_dir = function(fname)
    --     return vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1])
    -- end,
    -- single_file_support = true,
}

lsp.setup()
