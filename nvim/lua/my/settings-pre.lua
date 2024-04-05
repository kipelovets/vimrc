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

-- TODO: fix
vim.cmd("syntax match MyConclusion /Conclusion/")
vim.cmd("hi MyConclusion guifg=red")
