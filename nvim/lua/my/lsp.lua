local lsp = require('lsp-zero').preset({})
local shortcuts = require('my.shortcuts')

local on_attach = function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap(shortcuts.rename, vim.lsp.buf.rename, 'Rename')
    vim.keymap.set({ "n", "v" }, shortcuts.code_action, ":Lspsaga code_action<cr>", { desc = 'Code Action' })
    vim.keymap.set({ "n", "v" }, "<leader>cA", require("actions-preview").code_actions, { desc = 'Code Action menu' })
    nmap(shortcuts.format, vim.lsp.buf.format, "Format code")

    nmap(shortcuts.goto_definition, vim.lsp.buf.definition, 'Goto Definition')
    nmap(shortcuts.goto_references, require('telescope.builtin').lsp_references, 'Goto References')
    nmap(shortcuts.implementations, require('telescope.builtin').lsp_implementations, 'Implementations')
    nmap(shortcuts.symbols, require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
    nmap(shortcuts.all_symbols, require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

    nmap(shortcuts.doc, vim.lsp.buf.hover, 'Hover Documentation')
    nmap(shortcuts.signature, vim.lsp.buf.signature_help, 'Signature Documentation')

    local cmp = require("cmp")
    cmp.setup {
        mapping = {
            [shortcuts.cmp_confirm] = function(fallback)
                if cmp.visible() then
                    cmp.confirm({ select = true })
                else
                    fallback()
                end
            end,
            [shortcuts.cmp_next] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
            [shortcuts.cmp_complete] = cmp.mapping.complete(),
            [shortcuts.cmp_abort] = cmp.mapping.abort(),
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

    nmap(shortcuts.diag_open, vim.diagnostic.open_float)
    nmap(shortcuts.diag_prev, ':Lspsaga diagnostic_jump_prev<cr>')
    nmap(shortcuts.diag_next, ':Lspsaga diagnostic_jump_next<cr>')
    nmap(shortcuts.diag_show, '<cmd>Telescope diagnostics<CR>')

    if client.supports_method('textDocument/documentHighlight') then
        vim.cmd([[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]])
        vim.cmd([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
    end
    vim.cmd([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])

    require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
end

lsp.on_attach(on_attach)

require("neodev").setup({})

local lspconfig = require('lspconfig')

-- local vue_language_server_path = '/opt/homebrew/bin/vue-language-server'
-- local mason_registry = require('mason-registry')
-- local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
-- lspconfig.ts_ls.setup({
--     on_attach = on_attach,
--     filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--     init_options = {
--         plugins = {
--             {
--                 name = '@vue/typescript-plugin',
--                 location = vue_language_server_path,
--                 languages = { 'vue' },
--             },
--         },
--     },
-- })
lspconfig.volar.setup {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
}
lspconfig.pylsp.setup({})
lspconfig.sqlls.setup {
    root_dir = lspconfig.util.find_git_ancestor
}
lspconfig.phpactor.setup {
    on_attach = on_attach,
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
