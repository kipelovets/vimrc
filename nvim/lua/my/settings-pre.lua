vim.g.mapleader = " "

vim.g.vimwiki_conceallevel = 0
vim.g.vimwiki_list = {
    {
        path = '~/vimwiki',
        ext = 'wiki',
        syntax = 'default',
        diary_rel_path  = '/diary',
    }
}
vim.g.vimwiki_url_maxsave = 0
vim.g.vimwiki_hl_headers = 1
vim.g.vimwiki_hl_cb_checked = 1
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_listsyms = ' ○◐●✓'
vim.g.vimwiki_listsym_rejected = '✗'
vim.g.nested_syntaxes = {
    bash = "bash",
    php = "php",
    typescript = "typescript",
    java = "java",
    sql = "sql",
}

-- vim.g.sqlite_clib_path = vim.fn.stdpath("data") .. "/sqlite3.dll"

vim.o.shada = "!,'1000,<0,s1000"
vim.g.markbar_persist_mark_names = false
