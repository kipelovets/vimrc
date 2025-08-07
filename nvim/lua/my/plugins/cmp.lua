return {
    'hrsh7th/nvim-cmp',
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
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
                    elseif luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end,
                ['<s-tab>'] = function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end,
                ["<c-y>"] = cmp.mapping.complete(),
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
    end
}
