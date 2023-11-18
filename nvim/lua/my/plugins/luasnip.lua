return {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    config = function ()
        require("luasnip.loaders.from_snipmate").lazy_load()
    end,
    dependencies = {
        { 'saadparwaiz1/cmp_luasnip' },
    },
}
