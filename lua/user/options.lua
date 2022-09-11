---------------------------------------------------------
-- general
---------------------------------------------------------
-- IS_WINDOWS = (vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1)

-- variables specific to this repo
CONFIGS = {}
CONFIGS.toggleterm = {
	filetype2exclude = { "alpha" },
	default = { repl = "zsh" },
	python = { repl = "ipython", exe_file_terminal = "ipython", exe_file_opt = "-i", exe_cmd = [[\%run]] },
	-- lua = {repl = 'lua5.1'},
}

-------------------------------------------------------
-- colors:
-------------------------------------------------------
-- local colorscheme = "onehalfdark" -- 'default_theme' --'onehalflight' , 'onehalfdark'
-- vim.cmd(string.format("colorscheme %s", colorscheme))
-- vim.g.toggle_colorschemes = {light='onehalflight' , dark='onehalfdark'}
-- vim.o.background = 'light'

-- see also: https://github.com/LunarVim/LunarVim/blob/f1779fddcc34a8ad4cd0af0bc1e3a83f42844dbe/lua/lvim/config/settings.lua

return {
	g = {
		maplocalleader = ",",
	},
	wo = {
		number = true,
	},
	opt = {
		conceallevel = 0, -- to enable conceal set 2
		foldenable = false,
		foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
		foldmethod = "expr",
		linebreak = true, -- linebreak soft wrap at words
		list = true, -- show whitespace characters
		listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
		shortmess = vim.opt.shortmess + { I = true },
		showbreak = "↪ ",
		-- spellfile = "~/.config/nvim/lua/user/spell/spellfile.utf-8.add",
		thesaurus = "~/.config/nvim/lua/user/spell/mthesaur.txt",
		-- dictionary = {"~/.config/nvim/lua/user/spell/de.utf-8.spl"},
		wrap = true, -- soft wrap lines
		relativenumber = false, -- Show relative numberline
		number = true,
		timeoutlen = 300, --- Time out on mappings
		ttimeoutlen = 10, --- Time out on key codes
		updatetime = 200, --- Idle time to write swap and trigger CursorHold
		redrawtime = 2000, --- Time in milliseconds for stopping display redraw
		clipboard = "unnamedplus", -- allows neovim to access the system clipboard
		colorcolumn = "99999", -- fixes indentline for now
		fileencoding = "utf-8", -- the encoding written to a file
		foldlevel = 99,
		hidden = true, -- required to keep multiple buffers and open multiple buffers
		hlsearch = true, -- highlight all matches on previous search pattern
		ignorecase = true, -- ignore case in search patterns
		smartcase = true,
	},
}

-- vim.o.cmdheigs=2
-- vim.opt.completeopt = { "menuone", "noselect" }
