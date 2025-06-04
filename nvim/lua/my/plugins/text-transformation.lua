return {
    "chenasraf/text-transform.nvim",
    config = true,
    opts = {
        popup_type = 'select',
        keymap = {
            telescope_popup = {
                -- ["n"] = "<Leader>~",
                -- ["v"] = "<Leader>~",
            },
        },
        replacers = {
            camel_case = { enabled = true },
            const_case = { enabled = false },
            dot_case = { enabled = false },
            kebab_case = { enabled = false },
            pascal_case = { enabled = false },
            snake_case = { enabled = true },
            title_case = { enabled = false },
        },
    }
}
