vim.api.nvim_create_user_command('PhpCopyClassName', function()
    local bufnr = vim.api.nvim_get_current_buf()
    local language_tree = vim.treesitter.get_parser(bufnr, "php")
    local syntax_tree = language_tree:parse()
    local root = syntax_tree[1]:root()

    local get_node = function (sexpr)
        local query = vim.treesitter.query.parse('php', sexpr)
        for _, capture in query:iter_captures(root, bufnr, 0, -1) do
            return vim.treesitter.get_node_text(capture, bufnr)
        end
        return ""
    end

    local ns = get_node'(namespace_definition (namespace_name) @ns)'
    local class = get_node'(class_declaration name:(name) @ns)'
    local result = ns .. '\\' .. class
    vim.fn.setreg('"', result)
    print("Classname copied: " .. result)
end, {})
