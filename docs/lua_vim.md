

## get file name and file path

in `vim`:

```vim
  let g:local_source_dir = vim.fn.fnamemodify(expand('<sfile>'), ':h').'/local/'
  if filereadable(g:local_source_dir . 'init.vim')
    execute 'lua require("user.local.settings)' 
    " . g:local_source_dir . 'init.vim'
  endif
```

in `lua`

```lua
  -- path:
  vim.fn.fnamemodify(expand('<sfile>'), ':h').'/local/'
  
  -- full file name:
  vim.fn.expand('%')
  
```

## vim modes

```lua
  local mode = vim.api.nvim_get_mode().mode
```

