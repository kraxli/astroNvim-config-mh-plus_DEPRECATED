
IS_WINDOWS = (vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1)

-- to search for a spell-directory in lua/user:
vim.cmd [[set runtimepath+=~/.config/nvim/lua/user]]

require("user.local.settings")

return{}
