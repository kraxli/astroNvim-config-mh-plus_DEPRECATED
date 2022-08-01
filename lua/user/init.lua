
IS_WINDOWS = (vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1)

-- add a directory to runtimerpath:
-- vim.opt.rtp:append("~/.config/astronvim/lua/user")

require("user.local.settings")

return{}
