vim.api.nvim_create_augroup("autocomp", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", {
  desc = "Stop running auto compiler",
  group = "autocomp",
  pattern = "*",
  callback = function() vim.fn.jobstart { "autocomp", vim.fn.expand "%:p", "stop" } end,
})

vim.api.nvim_create_augroup("dapui", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  desc = "Make q close dap floating windows",
  group = "dapui",
  pattern = "dap-float",
  callback = function() vim.keymap.set("n", "q", "<cmd>close!<cr>") end,
})

vim.api.nvim_create_augroup("mini", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "TermOpen", "FileType alpha" }, {
  desc = "Disable indent scope for conent types",
  group = "mini",
  callback = function()
    vim.b.miniindentscope_disable = vim.tbl_contains({ "help", "terminal", "nofile", "prompt", "alpha" }, vim.bo.buftype)
  end,
})

-- -------------------------------------------------------
-- kraxli:
-- -------------------------------------------------------

vim.api.nvim_create_augroup("TextYankPost", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text while yanking",
  group = "TextYankPost",
  pattern = "*",
  callback = function() require("vim.highlight").on_yank({higroup="IncSearch", timeout=150}) end,  -- higroup = 'Visual'
})
-- autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup="IncSearch", timeout=150})   -- higroup = 'Visual'


local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- augroup("_terminal", {})
-- autocmd("TermEnter term://*toggleterm#*",{
--   desc="ToggleTerm with <c-t> in terminal mode",
--   group='_terminal',
--   command='tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>',
-- })

augroup("FloatingWindow", { clear = true})
autocmd("TermEnter term://*toggleterm#*",{
  desc="Close floating window",
  group='FloatingWindow',
  -- pattern = "*",
  -- command='tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>',
  command = "nnoremap <silent><buffer> q :close<CR>",
})

vim.cmd [[

  augroup _general_settings
  autocmd!
  
  "
  autocmd FileType toggleterm,qf,help,man,lspinfo,TelescopePrompt nnoremap <silent><buffer> q :close!<CR>
  autocmd FileType toggleterm,qf,help,man,lspinfo,TelescopePrompt nnoremap <silent><buffer> <localleader>c :close!<CR>
  " set file types
  autocmd BufRead,BufEnter,BufWinEnter,BufNew,VimEnter *.md,*.wiki setlocal filetype=vimwiki.markdown
  autocmd FileType vimwiki.markdown,vimwiki,markdown,text set foldmethod=expr foldexpr=MkdFoldSimple()
  autocmd FileType vimwiki.markdown,vimwiki,markdown,text setl spell spelllang=en " ,de

  
  augroup end
  
  " augroup _alpha
  "   autocmd!
  "   autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  " augroup end

]]

