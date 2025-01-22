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

require("neodev").setup({ })

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.tsserver.setup({
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
})
lspconfig.pylsp.setup({})
lspconfig.sqlls.setup {
    root_dir = lspconfig.util.find_git_ancestor
}
lspconfig.phpactor.setup {}
lspconfig.bashls.setup {}
lspconfig.terraformls.setup {}

lsp.setup()
