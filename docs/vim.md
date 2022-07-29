# Vim tips and tricks

## Debugging Vim

- https://codeinthehole.com/tips/debugging-vim-by-example/
- https://inlehmansterms.net/2014/10/31/debugging-vim/

### General Debugging with Verbose

```vim
" set verbose command
set verbosefile=verbose.log
set verbose=13

" set verbose on startup
vim -V9 file.text
```

## General tips and tricks

File is blocked for saving? Try:
```viml
  set buftype=
```

- am I now a bit faster? Yes   

- [ ] adsf 

# Alternatives / HowTo

open external applcation:

```lua
  commandsOpen = {unix="xdg-open", mac="open"}
  if vim.fn.has "mac" == 1 then osKey = "mac" elseif vim.fn.has "unix" == 1 then osKey = "unix" end
  local openDir = [[<cmd>lua os.execute(commandsOpen[osKey] .. ' ' .. vim.fn.shellescape(vim.fn.fnamemodify(vim.fn.expand('<sfile>'), ':p'))); vim.cmd "redraw!"<cr>]]
  keymap("n", "<F6>", openDir, {})
```

