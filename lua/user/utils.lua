if vim.fn.has('win64') or vim.fn.has('win32') then
  xdg_config = os.getenv("XDG_CONFIG_HOME") or '~/AppData/Local'
  xdg_cache = os.getenv("$XDG_CACHE_HOME") or '~/AppData/Local/'
  --  vim.fn.stdpath('data')
  --  vim.fn.stdpath('config')
else
  xdg_config = os.getenv("XDG_CONFIG_HOME") or '~/.config'
  xdg_cache = os.getenv("XDG_CONFIG_CACHE") or '~/.config'
end

M = {}

function M.quick_notification(msg) vim.notify(msg, "info", { title = "AstroNvim", timeout = 0 }) end

function M.vim_opt_toggle(opt, on, off, name)
  local is_off = vim.opt[opt]:get() == off
  vim.opt[opt] = is_off and on or off
  M.quick_notification(name .. " " .. (is_off and "Enabled" or "Disabled"))
end

function M.async_run(cmd, on_finish)
  local lines = { "" }

  local function on_event(_, data, event)
    if (event == "stdout" or event == "stderr") and data then vim.list_extend(lines, data) end

    if event == "exit" then
      vim.fn.setqflist({}, " ", {
        title = table.concat(cmd, " "),
        lines = lines,
        efm = "%f:%l:%c: %t%n %m",
      })
      if on_finish then on_finish() end
    end
  end

  vim.fn.jobstart(cmd, {
    on_stdout = on_event,
    on_stderr = on_event,
    on_exit = on_event,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

function M.toggle_qf()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
      break
    end
  end
  if qf_exists then
    vim.cmd "cclose"
  elseif not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  end
end

-- OPEN file, url, or directory with an external app:
--      local openAll = [[<cmd>lua cword = vim.fn.expand("<cWORD>"); if string.len(cword) ~= 0 then arg = vim.fn.shellescape(cword); else arg = vim.fn.shellescape(vim.fn.fnamemodify(vim.fn.expand("<sfile>"), ":p")) end; print(arg); os.execute(commandsOpen[osKey] .. ' ' .. arg); vim.cmd "redraw!"<cr>]]
--      local openFileUrl = [[<cmd>lua os.execute(commandsOpen[osKey] .. " " .. vim.fn.shellescape(vim.fn.expand("<cWORD>"))); vim.cmd "redraw!"<cr>]]
M.openExtApp = function()

  -- powershell:
  -- https://stackoverflow.com/questions/55244727/powershell-equivalent-of-batch-command-start-to-open-window-with-mapped-drive
  -- !! https://stackoverflow.com/questions/320509/is-it-possible-to-open-a-windows-explorer-window-from-powershell
  --    local function is_pwsh(shell)
  --        return string.find(shell, "pwsh") or string.find(shell, "powershell")
  --    end
  
  local has_win = (vim.fn.has("win32") == 1 or vim.fn.has("win64"))
  local has_powershell = string.match(vim.env.SHELL, 'powershell') or string.match(vim.env.SHELL, 'pwsh') -- posh? , vim.o.shell

  local commandsOpen = {unix="xdg-open", mac="open", win="start", pwsh="Invoke-Item"}  -- or ii as alias for Invoke-Item / is is it pwsh instead of posh?
  local osKey = ''
  if vim.fn.has "mac" == 1 then osKey = "mac"
    elseif vim.fn.has "unix" == 1 then osKey = "unix"
    elseif has_powershell then osKey = 'pwsh'
    elseif has_win == 1 and has_powershell ~= 1 then osKey = "win"
  end

  local cword = vim.fn.expand("<cWORD>")

  local arg, nrepl = nil, nil
  if string.len(cword) ~= 0 then
    arg, nrepl = string.gsub(cword, "^www.", "http://www.", 1)
    if nrepl == 0 then arg = vim.fn.shellescape(arg) end
  else
    -- arg = vim.fn.shellescape(cword)
    -- arg = vim.fn.shellescape(vim.fn.fnamemodify(vim.fn.expand("<sfile>"), ":p"))
    arg = vim.fn.fnamemodify(vim.fn.expand("<sfile>"), ":p")
  end

  if (arg == nil or arg == '' ) then arg = '.' end

  os.execute(commandsOpen[osKey] .. ' ' .. arg)
  vim.cmd("redraw!")
end


local get_terminal = function (filetype_shell, exe_type)

  local filetype = vim.bo.filetype
  local terminal = filetype_shell[filetype][exe_type] or filetype

  return terminal

end

local get_count = function(terminal)

  local terminal_info = require("core.utils").user_terminals[terminal]

  local count = 1  -- default for count
  local term_exists = false

  if vim.v.count > 0 then
    count = vim.v.count
  elseif terminal_info ~= nil then
    count = terminal_info.id
    term_exists = true
  end

  return count, term_exists
end


M.excecute_code = function(selection_type)

  local terminal = get_terminal(KXNV.toggleterm, 'repl')
  local count = get_count(terminal)
  require('toggleterm').send_lines_to_terminal(selection_type, true, count)

end


M.toggle_term = function()
  local filetype = vim.bo.filetype
  local terminal = get_terminal(KXNV.toggleterm, 'exe_file_terminal')
  local count, _ = get_count(terminal)
  require'toggleterm'.toggle_command('', count)
end

M.execute_file = function()

  local filetype = vim.bo.filetype
  local terminal = get_terminal(KXNV.toggleterm, 'exe_file_terminal')
  local count, term_exists = get_count(terminal)
  local file_name = vim.api.nvim_buf_get_name(0)

  if IS_WINDOWS then
    local shellslash = vim.opt.shellslash:get()
    vim.opt.shellslash = true
  end

  print(term_exists) -- TODO: ! clean
  local term_cmd = ''

  if term_exists then -- TODO: ! not working see function get_count()
    term_cmd = [[cmd=']] .. KXNV.toggleterm[filetype].exe_cmd .. [[ "]] .. file_name .. [["']]
    print(1)
  elseif KXNV.toggleterm[filetype].exe_file_opt ~= nil then
  -- and term_details.cmd_opt ~= ' ' and term_details.cmd_opt ~= '' then
    local cmd_opt = KXNV.toggleterm[filetype].exe_file_opt .. ' ' .. file_name -- TODO: is shellescape the problem?
    term_cmd = terminal .. ' ' .. cmd_opt
  else
    term_cmd = KXNV.toggleterm['default'].repl
  end
  -- require('toggleterm').exec_command(term_cmd, count)
  local term_details = { cmd = term_cmd, count = count }
  require("core.utils").toggle_term_cmd(term_details)
  -- is fnameescape({string}) required?

  if IS_WINDOWS then
    vim.opt.shellslash = shellslash
  end

end


M.cache_reset = function ()
  -- use vim.fn.stdpath('cache')
  local remove_cmd

  if vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1 then
    remove_cmd = 'del'
  else
    remove_cmd = 'rm -rf'
    os.execute(remove_cmd .. ' ' .. xdg_cache .. '/nvim' .. xdg_config .. ' /nvim/lua/packer_compiled.lua')
    print('nvim cache has been removed and will be reset')
  end

  require('packer').compile()

end


-- local function hasKey(table, key)
--     return table[key] ~= nil
-- end
--
--
-- local function isarray(t)
--   return #t > 0 and next(t, #t) == nil
-- end

-- see /home/dave/.local/share/lunarvim/site/pack/packer/opt/which-key.nvim functions register and map
-- M.key_map_generator = function (key_table, options)
--
--   local keymap = vim.api.nvim_set_keymap
-- table.concat({'a', 'b'})
--   for k, v in pairs(key_table) do
--     print(v)
--     -- type(v)=='table'
--     if isarray(v) then
--
--     else
--     end
--   end
--
-- end

return M
