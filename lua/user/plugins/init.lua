return {
	["declancm/cinnamon.nvim"] = { disable = true },
	["famiu/bufdelete.nvim"] = { disable = true },
	-- ["goolord/alpha-nvim"] = { disable = true },
	["lukas-reineke/indent-blankline.nvim"] = { disable = true },
	["max397574/better-escape.nvim"] = { disable = true },
	["numToStr/Comment.nvim"] = { disable = true },
	["EdenEast/nightfox.nvim"] = require("user.plugins.nightfox"),
	["danymat/neogen"] = require("user.plugins.neogen"),
	["dhruvasagar/vim-table-mode"] = require("user.plugins.vim-table-mode"),
	["echasnovski/mini.nvim"] = require("user.plugins.mini"),
	["ethanholz/nvim-lastplace"] = require("user.plugins.nvim-lastplace"),
	["folke/zen-mode.nvim"] = require("user.plugins.zen-mode"),
	["hrsh7th/cmp-calc"] = require("user.plugins.cmp-calc"),
	["hrsh7th/cmp-emoji"] = require("user.plugins.cmp-emoji"),
	["jbyuki/nabla.nvim"] = require("user.plugins.nabla"),
	["jc-doyle/cmp-pandoc-references"] = require("user.plugins.cmp-pandoc-references"),
	["jose-elias-alvarez/typescript.nvim"] = require("user.plugins.typescript"),
	["kdheepak/cmp-latex-symbols"] = require("user.plugins.cmp-latex-symbols"),
	["lukas-reineke/headlines.nvim"] = require("user.plugins.headlines"),
	["mfussenegger/nvim-dap"] = require("user.plugins.dap"),
	["mickael-menu/zk-nvim"] = require("user.plugins.zk"),
	["mtikekar/nvim-send-to-term"] = require("user.plugins.nvim-send-to-term"),
	["nanotee/sqls.nvim"] = require("user.plugins.sqls"),
	["nvim-telescope/telescope-bibtex.nvim"] = require("user.plugins.telescope-bibtex"),
	["nvim-telescope/telescope-file-browser.nvim"] = require("user.plugins.telescope-file-browser"),
	["nvim-telescope/telescope-hop.nvim"] = require("user.plugins.telescope-hop"),
	["nvim-telescope/telescope-media-files.nvim"] = require("user.plugins.telescope-media-files"),
	["nvim-telescope/telescope-project.nvim"] = require("user.plugins.telescope-project"),
	["nvim-treesitter/nvim-treesitter-textobjects"] = require("user.plugins.nvim-treesitter-textobjects"),
	["p00f/clangd_extensions.nvim"] = require("user.plugins.clangd_extensions"),
	["phaazon/hop.nvim"] = require("user.plugins.hop"),
	["rcarriga/nvim-dap-ui"] = require("user.plugins.dapui"),
	["vitalk/vim-simple-todo"] = require("user.plugins.vim-simple-todo"),
	-- ["wakatime/vim-wakatime"] = require "user.plugins.vim-wakatime",
	["ziontee113/syntax-tree-surfer"] = require("user.plugins.syntax-tree-surfer"),

	------------------------------------------------------------------
	-- General
	------------------------------------------------------------------
	{ "nvim-treesitter/nvim-treesitter-refactor" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{
		"romainl/vim-cool", -- disables search highlighting when you are done
		event = { "CursorMoved", "InsertEnter" },
	},
	{
		"andweeb/presence.nvim",
		config = function()
			require("user.plugins.presence").config()
		end,
	},
	{
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("user.plugins.todo_comments").config()
		end,
		event = "BufRead",
	},
	-- Scrollbar.
	{
		"dstein64/nvim-scrollview",
		cond = vim.fn.exists("g:fvim_loaded") ~= 1,
		-- disable = vim.fn.exists('g:fvim_loaded'),
		event = "BufRead",
		config = function()
			require("user/plugins/nvim-scroll")
		end,
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				auto_open = false,
				auto_close = true,
				padding = false,
				height = 10,
				use_diagnostic_signs = true,
			})
		end,
		cmd = { "Trouble", "TroubleToggle" },
	},
	{
		"kevinhwang91/nvim-bqf",
		config = function()
			require("user.plugins.bqf").config()
		end,
		event = "BufRead",
	},
	{
		"machakann/vim-sandwich",
		keys = { "s" },
		event = "BufReadPost",
		config = function()
			require("user.plugins.sandwich")
		end,
	},
	-- alternative: machakann/vim-sandwich
	{
		"appelgriebsch/surround.nvim",
		disable = 1,
		keys = { "s" },
		event = "BufReadPost",
		config = function()
			require("user.plugins.surround-nvim")
		end,
	},
	-- {
	-- "gfeiyou/command-center.nvim",
	-- requires = { "nvim-telescope/telescope.nvim" }
	-- },

	------------------------------------------------------------------
	-- Cmp / comple
	------------------------------------------------------------------

	-- {
	--   "tzachar/cmp-tabnine",
	--   run = "./install.sh",
	--   requires = "hrsh7th/nvim-cmp",
	--   after = "nvim-cmp",
	--   config = function()
	--     local tabnine = require "cmp_tabnine.config"
	--     tabnine:setup {
	--       max_lines = 1000,
	--       max_num_results = 10,
	--       sort = true,
	--     }
	--   end,
	--   opt = true,
	--   event = "InsertEnter",
	-- },
	-- {
	--   "hrsh7th/cmp-cmdline",
	--   after = "nvim-cmp",
	--   event = "InsertEnter",
	-- },

	------------------------------------------------------------------
	-- Telescope
	------------------------------------------------------------------
	{
		"tknightz/telescope-termfinder.nvim",
		config = function()
			require("telescope").load_extension("termfinder")
		end,
	},
	------------------------------------------------------------------
	-- Git / diff
	------------------------------------------------------------------
	{
		"sindrets/diffview.nvim",
		opt = true,
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		module = "diffview",
		keys = "<leader>gd",
		setup = function()
			-- require("which-key").register { ["<leader>gd"] = "diffview: diff HEAD" }
		end,
		config = function()
			require("diffview").setup({
				enhanced_diff_hl = true,
				key_bindings = {
					file_panel = { q = "<Cmd>DiffviewClose<CR>" },
					view = { q = "<Cmd>DiffviewClose<CR>" },
				},
			})
		end,
	},
	{
		"tpope/vim-fugitive",
		cmd = "Git",
	},
	{
		"TimUntersberger/neogit",
		requires = { "nvim-lua/plenary.nvim", "diffview.nvim" },
		cmd = "Neogit",
		-- config = function ()
		--   require('config.plugins.neogit')
		-- end
	},
	-- {
	--   'chentau/marks.nvim',
	--   requires = "gitsigns.nvim",
	--   event = "FileType",
	--   config = function ()
	--     require('user.plugins.marks')
	--   end
	-- },

	------------------------------------------------------------------
	-- LSP / DAP
	------------------------------------------------------------------

	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		-- event = { "BufRead", "BufNew" },
		config = function()
			require("lsp_signature").setup()
			-- require("user.plugins.lsp_signature").config()
		end,
	},
	{
		"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
		event = "BufReadPost", -- FileType BufRead
		cmd = { "ToggleDiag" },
	},
	-- simple-diagnostics removes the noise of every line error, and only show the current line error.
	{
		"casonadams/simple-diagnostics.nvim",
		config = function()
			vim.diagnostic.config({
				virtual_text = false,
				underline = true,
				float = { source = "always" },
				severity_sort = true,
				signs = true,
				update_in_insert = false,
			})
		end,
		setup = function()
			require("simple-diagnostics").setup({
				show_virtual_text = true,
				show_message_area = false,
			})
		end,
	},

	-- R support
	{ "jalvesaq/Nvim-R", ft = { "r", "R", "rmd" }, command = { "StartR" } },

	-- cwd to the project's root directory
	{
		"ahmedkhalf/lsp-rooter.nvim",
		event = "BufRead",
		config = function()
			require("lsp-rooter").setup()
		end,
	},

	-- lua in Neovim debug support
	{
		"jbyuki/one-small-step-for-vimkind",
		ft = { "lua" },
		-- setup = function() require("config.plugins.dap") end,
	},
	{
		"Pocco81/dap-buddy.nvim",
		-- run = vim.fn.stdpath('data') ..'/site/pack/packer/opt/dap-buddy.nvim/make',
		after = "nvim-dap",
		-- config = function()
		--   require("plugins/dap")
		-- end,
		disable = true,
	},

	-- -------------------------------------------------------
	-- Coding
	-- -------------------------------------------------------

	-- TODO: improve / refine setup and harpoon integration
	-- see also: is0n/jaq-nvim and numToStr/FTerm.nvim
	{
		"CRAG666/code_runner.nvim",
		cmd = { "RunCode", "RunFile", "RunClose", "RunProject", "CRFiletype", "CRProjects" },
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("user.plugins.code_runner")
		end,
	},

	-- TODO: activate
	{
		"michaelb/sniprun",
		run = "bash ./install.sh",
		disable = true,
	},

	-- kassio/neoterm
	-- skywind3000/asyncrun.vim
	-- dccsillag/magma-nvim
	-- rafcamlet/nvim-luapad
	-- https://www.maxwellrules.com/misc/nvim_jupyter.html ??

	-- -------------------------------------------------------
	-- Colorschemes
	-- -------------------------------------------------------
	{ "Th3Whit3Wolf/one-nvim" }, -- lazy by nature
	{ "sonph/onehalf", rtp = "vim" },
	{ "NLKNguyen/papercolor-theme" },
	{ "sainnhe/edge" },
	{ "sainnhe/everforest" },

	-- -------------------------------------------------------
	-- Markdown, Note taking, Writing
	-- -------------------------------------------------------
	{
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		-- run = "cd app && npm install",  -- does not seem to work on windows
		ft = "markdown",
		config = function()
			require("user.plugins.vim-markdown").markdown_preview()
		end,
	},
	{
		"renerocksai/calendar-vim", -- TODO: lazy loading ft or cmd
		cmd = { "Calendar" },
		config = function()
			require("user.plugins.calendar-vim")
		end,
	},
	-- { 'mracos/mermaid.vim', ft = {'markdown', 'vimwiki', 'mermaid'} },
	{ "chazmcgarvey/vim-mermaid", ft = { "markdown", "vimwiki", "mermaid" } },
	{
		"godlygeek/tabular",
		ft = { "markdown", "vimwiki" },
	},
	-- {
	--   'preservim/vim-markdown',
	--   ft = {'markdown'},
	--   config = function()
	--     require("user.plugins.vim-markdown")
	--   end,
	-- },

	-- TODO:
	{
		"renerocksai/telekasten.nvim",
		ft = { "markdown", "vimwiki", "text" },
		cmd = { "Telekasten", "Tk" },
		keys = { "<leader>z" },
		config = function()
			vim.cmd([[
        command! Tk :Telekasten
      ]])
			require("user.plugins.telekasten")
		end,
	},
	{
		"lervag/vimtex",
		ft = "tex",
		setup = function()
			require("user.plugins.vimtex")
		end,
	},
	{
		"ekickx/clipboard-image.nvim",
		cmd = "PasteImg",
		ft = { "markdown", "text", "vimwiki" },
		config = function()
			require("user.plugins.clipboard-image")
		end,
	},

	{
		"nvim-orgmode/orgmode",
		ft = { "org" },
		after = "nvim-treesitter",
		config = function()
			require("user.plugins.orgmode")
			-- require('orgmode').setup{}
		end,
		disable = true,
	},
	{
		"nvim-neorg/neorg",
		config = function()
			require("neorg").setup({})
		end,
	},

	-- TODO: vimwiki
	{
		"vimwiki/vimwiki",
		-- map = { "n: <Plug>" },
		ft = { "vimwiki", "markdown", "vimwiki.markdown" },
		cmd = { "VimwikiIndex", "VimwikiUISelect" },
		setup = function()
			require("user.plugins.vimwiki")
		end,
		disable = true,
	},

	{
		"ixru/nvim-markdown",
		config = function()
			require("user.plugins.vim-markdown").nvim_markdown()
		end,
	},

	-- {
	--   'masukomi/vim-markdown-folding',
	--   ft = { 'vimwiki', 'markdown', 'vimwiki.markdown' },
	--   setup = function()
	--     -- NestedMarkdownFolds()
	--     -- vim.cmd([[
	--       -- " autocmd FileType vimwiki.markdown,vimwiki,markdown,text set foldmethod=expr foldexpr=NestedMarkdownFolds()
	--     -- ]])
	--   end
	-- },

	-- { 'anuvyklack/pretty-fold.nvim',
	--    requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
	--    config = function()
	--       require('pretty-fold').setup()
	--       require('pretty-fold.preview').setup()
	--    end
	-- },

	-- #######################################################
	-- LUNARVIM / ABZCODING
	-- #######################################################
	{
		"andymass/vim-matchup",
		event = "BufReadPost",
		config = function()
			vim.g.matchup_enabled = 1
			vim.g.matchup_surround_enabled = 1
			vim.g.matchup_matchparen_deferred = 1
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		ft = { "typescript", "javascript", "lua", "c", "cpp", "go", "python", "java", "php" },
		event = "BufRead",
		config = function()
			require("refactoring").setup({})
		end,
	},
}
