local on_lsp_attach = function(event)
    local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
    end

    nmap("<leader>cr", vim.lsp.buf.rename, 'Rename')
    vim.keymap.set({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<cr>", { desc = 'Code Action' })
    vim.keymap.set({ "n", "v" }, "<leader>cA", require("actions-preview").code_actions, { desc = 'Code Action menu' })
    nmap("<leader>cf", vim.lsp.buf.format, "Format code")

    nmap("<leader>cd", vim.lsp.buf.definition, 'Goto Definition')
    nmap("<leader>cu", require('telescope.builtin').lsp_references, 'Goto References')
    nmap("<leader>ci", require('telescope.builtin').lsp_implementations, 'Implementations')
    nmap("<leader>cs", require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
    nmap("<leader>cs", require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

    nmap("<c-s-j>", vim.lsp.buf.hover, 'Hover Documentation')
    nmap("<c-s-k>", vim.lsp.buf.signature_help, 'Signature Documentation')

    local cmp = require("cmp")
    cmp.setup {
        mapping = {
            ["<cr>"] = function(fallback)
                if cmp.visible() then
                    cmp.confirm({ select = true })
                else
                    fallback()
                end
            end,
            ["<tab>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
            ["<c-space>"] = cmp.mapping.complete(),
            ["<c-e>"] = cmp.mapping.abort(),
        },
        snippet = {
            expand = function(args)
                require 'luasnip'.lsp_expand(args.body)
            end
        },

        sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        },
    }

    nmap("<leader>do", vim.diagnostic.open_float)
    nmap("[e", ':Lspsaga diagnostic_jump_prev<cr>')
    nmap("]e", ':Lspsaga diagnostic_jump_next<cr>')
    nmap("<leader>dd", '<cmd>Telescope diagnostics<CR>')

    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
    if client:supports_method('textDocument/documentHighlight') then
        vim.cmd([[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]])
        vim.cmd([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
    end
    vim.cmd([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])

    require("workspace-diagnostics").populate_workspace_diagnostics(client, event.buf)
end

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
