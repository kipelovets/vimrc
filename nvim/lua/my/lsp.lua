local lsp = require('lsp-zero').preset({})
local os_specific_shortcut = require('my.shortcuts')

local on_attach = function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
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
