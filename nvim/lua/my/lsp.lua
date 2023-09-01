local lsp = require('lsp-zero').preset({})

local on_attach = function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })

    local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    local cmp = require("cmp")
    cmp.setup {
        mapping = {
            ['<CR>'] = function(fallback)
                if cmp.visible() then
                    cmp.confirm()
                else
                    fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
                end
            end,
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
        }
    }

    nmap('<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>')
    nmap('<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    nmap('<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    nmap('<leader>dd', '<cmd>Telescope diagnostics<CR>')
end

lsp.on_attach(on_attach)

-- (Optional) Configure lua language server for neovim
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.tsserver.setup({
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
})

lsp.setup()
