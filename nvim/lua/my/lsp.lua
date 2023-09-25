local lsp = require('lsp-zero').preset({})
local keybindings = require('my.keybindings')

local on_attach = function(_, bufnr)
    -- see :help lsp-zero-keybindings
    lsp.default_keymaps({ buffer = bufnr })

    local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap(keybindings.rename, vim.lsp.buf.rename, 'Rename')
    nmap(keybindings.code_action, vim.lsp.buf.code_action, 'Code Action')
    nmap(keybindings.format, vim.lsp.buf.format, "Format code")

    nmap(keybindings.goto_definition, vim.lsp.buf.definition, 'Goto Definition')
    nmap(keybindings.goto_references, require('telescope.builtin').lsp_references, 'Goto References')
    nmap(keybindings.symbols, require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
    nmap(keybindings.all_symbols, require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

    nmap(keybindings.doc, vim.lsp.buf.hover, 'Hover Documentation')
    nmap(keybindings.signature, vim.lsp.buf.signature_help, 'Signature Documentation')

    local cmp = require("cmp")
    cmp.setup {
        mapping = {
            [keybindings.cmp_confirm] = function(fallback)
                if cmp.visible() then
                    cmp.confirm({ select = true })
                else
                    fallback()
                end
            end,
            [keybindings.cmp_next] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
            [keybindings.cmp_complete] = cmp.mapping.complete(),
            [keybindings.cmp_abort] = cmp.mapping.abort(),
        }
    }

    nmap(keybindings.diag_open, vim.diagnostic.open_float)
    nmap(keybindings.diag_prev, vim.diagnostic.goto_prev)
    nmap(keybindings.diag_next, vim.diagnostic.goto_next)
    nmap(keybindings.diag_show, '<cmd>Telescope diagnostics<CR>')
end

lsp.on_attach(on_attach)

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.tsserver.setup({
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
})
lspconfig.pylsp.setup({})
lspconfig.sqlls.setup{
    root_dir = lspconfig.util.find_git_ancestor
}

lsp.setup()
