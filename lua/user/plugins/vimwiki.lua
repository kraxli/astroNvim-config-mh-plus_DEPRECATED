

-- vim.api.nvim_set_var("vimwiki_list", "[{ 'diary_header': 'Diary', 'diary_link_fmt': '%Y-%m/%d', 'auto_toc': 1, 'path': '~/docs/wiki/', 'syntax': 'markdown', 'ext': '.md', 'links_space_char': '_'}, { 'path': '~/docs/books/', 'syntax': 'markdown', 'ext': '.md', 'links_space_char': '_'}]")
vim.cmd("let g:vimwiki_list = [ { 'diary_header': 'Diary', 'diary_link_fmt': '%Y-%m/%d', 'auto_toc': 1, 'path': '~/docs/wiki/', 'syntax': 'markdown', 'ext': '.md', 'links_space_char': '_'}, { 'path': '~/docs/books/', 'syntax': 'markdown', 'ext': '.md', 'links_space_char': '_'}, ]")

vim.cmd([[
    let nested_syntax = {'py': 'python', 'sh': 'bash', 'json': 'javascript'}
    let vimwiki_list_zettel = { 'path': exists('g:dir_zettelk') && g:dir_zettelk != '' ? g:dir_zettelk : '~/Dropbox/PKD/', 'ext':'.md', 'syntax':'markdown', 'links_space_char': '-', 'nested_syntaxes': nested_syntax, }
    let g:vimwiki_list = add(g:vimwiki_list, vimwiki_list_zettel)
]])

vim.g.vimwiki_conceallevel = 2
vim.g.vimwiki_folding = 'custom'
vim.g.vimwiki_use_calendar = 1
vim.g.vimwiki_hl_headers = 1
vim.g.vimwiki_hl_cb_checked = 1
vim.g.vimwiki_autowriteall = 0

