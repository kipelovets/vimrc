return {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    config = function()
        local ls = require("luasnip")
        local types = require("luasnip.util.types")

        ls.setup({
            history = true,
            enable_autosnippets = true,
            update_events = "TextChanged,TextChangedI",
            -- delete_check_events = "TextChanged",

            -- for nvim cmp: START
            region_check_events = "InsertEnter",
            delete_check_events = "TextChanged,InsertLeave",
            -- for nvim cmp: END

            ext_opts = {
                [types.choiceNode] = {
                    active = {
                        virt_text = { { "●", "LuasnipChoiceNode" } },
                    },
                },

                -- [types.insertNode] = {
                -- 	active = {
                -- 		virt_text = { { "●", "LuasnipInsertNode" } },
                -- 	},
                -- },
            },
        })

        require("luasnip.loaders.from_snipmate").lazy_load()

        vim.g.nvim_dir = vim.fn.stdpath("config")
        vim.g.project_root_dir = vim.fn.getcwd()

        local snippet_paths = {
            vim.g.nvim_dir .. "/snippets",
            vim.g.project_root_dir .. "/.nvim/snippets",
        }

        require("luasnip.loaders.from_lua").load({
            paths = snippet_paths,
        })

        -- local ls = require("luasnip")

        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local c = ls.choice_node
        local f = ls.function_node
        local d = ls.dynamic_node
        local sn = ls.snippet_node

        local snippets = {}

        local parse_branch = function()
            local branch = require("my.utils").get_branch()
            local _, _, jira, desc = string.find(branch, "%a+/(%w+-%w+)-?([a-zA-Z0-9-]+)")
            return jira, desc
        end

        table.insert(snippets,
            s({
                trig = "commit",
                name = "Conventional commit",
                desc = "Conventional commit",
            }, {
                c(1, {
                    t("fix"),
                    t("feat"),
                    t("build"),
                    t("chore"),
                    t("ci"),
                    t("docs"),
                    t("style"),
                    t("refactor"),
                    t("test"),
                    t("perf"),
                }),
                t("("),
                f(function(args)
                    local jira, _ = parse_branch()
                    return jira
                end, {}),
                t("): "),
                d(2, function()
                    local _, desc = parse_branch()

                    desc = string.gsub(desc, "-", " ")

                    return sn(1, { t(desc) })
                end),
            })
        )

        ls.add_snippets("gitcommit", snippets)
    end,
    dependencies = {
        { 'saadparwaiz1/cmp_luasnip' },
    },
}
