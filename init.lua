
IS_WINDOWS = (vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1)

return {
  updater = { skip_prompts = true },
  colorscheme = "duskfox",
  lsp = require "user.lsp",
  polish = function()
    vim.filetype.add {
      pattern = {
        ["/tmp/neomutt.*"] = "markdown",
      },
    }
    require "user.autocmds"
    require "user.commands"
  end,
}
