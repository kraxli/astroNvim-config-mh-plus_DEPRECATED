local utils = require("user.utils")

return {
	n = {
		["<leader>"] = {
			["c"] = {
				function()
					MiniBufremove.delete()
				end,
				"Bye Buffer",
			},
			["C"] = { "<cmd>bdelete!<cr>", "Close Buffer" },
			["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
			["H"] = { "<cmd>set hlsearch!<cr>", "Toggle Highlight" },
			["<cr>"] = { '<esc>/<++><cr>"_c4l', "Next Template" },
			["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
			["r"] = { "<cmd>SendHere<cr>", "Set REPL" },
			["."] = { "<cmd>cd %:p:h<cr>", "Set CWD" },
			["P"] = {
				function()
					utils.toggle_presence()
				end,
				"Toggle Presence",
			},

			a = {
				name = "Annotate",
				["<cr>"] = {
					function()
						require("neogen").generate()
					end,
					"Current",
				},
				c = {
					function()
						require("neogen").generate({ type = "class" })
					end,
					"Class",
				},
				f = {
					function()
						require("neogen").generate({ type = "func" })
					end,
					"Function",
				},
				t = {
					function()
						require("neogen").generate({ type = "type" })
					end,
					"Type",
				},
				F = {
					function()
						require("neogen").generate({ type = "file" })
					end,
					"File",
				},
			},

			b = {
				name = "Buffer",
				c = { "function() MiniBufremove.delete() end", "Close buffer" },
				-- k = {"<cmd>bd!<cr>", "Kill (del) buffer"},
				q = { "<cmd>bd!<cr>", "Kill (del) buffer" },
				t = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
			},

			f = {
				name = "Telescope",
				["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
				B = { "<cmd>Telescope bibtex<cr>", "BibTeX" },
				e = { "<cmd>Telescope file_browser<cr>", "Explorer" },
				h = { "<cmd>Telescope oldfiles<cr>", "History" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
				M = { "<cmd>Telescope media_files<cr>", "Media" },
				n = { "<cmd>Telescope notify<cr>", "Notifications" },
				p = { "<cmd>Telescope project<cr>", "Projects" },
				r = { "<cmd>Telescope registers<cr>", "Registers" },
				t = { "<cmd>Telescope colorscheme<cr>", "Themes" },
			},

			m = {
				name = "Compiler / Make",
				k = {
					function()
						vim.cmd("silent! write")
						local filename = vim.fn.expand("%:t")
						utils.async_run({ "compiler", vim.fn.expand("%:p") }, function()
							utils.quick_notification("Compiled " .. filename)
						end)
					end,
					"Compile",
				},
				a = {
					function()
						vim.notify("Autocompile Started")
						utils.async_run({ "autocomp", vim.fn.expand("%:p") }, function()
							utils.quick_notification("Autocompile stopped")
						end)
					end,
					"Auto Compile",
				},
				v = {
					function()
						vim.fn.jobstart({ "opout", vim.fn.expand("%:p") })
					end,
					"View Output",
				},
				b = {
					function()
						local filename = vim.fn.expand("%:t")
						utils.async_run({
							"pandoc",
							vim.fn.expand("%"),
							"--pdf-engine=xelatex",
							"--variable",
							"urlcolor=blue",
							"-t",
							"beamer",
							"-o",
							vim.fn.expand("%:r") .. ".pdf",
						}, function()
							utils.quick_notification("Compiled " .. filename)
						end)
					end,
					"Compile Beamer",
				},
				p = {
					function()
						local pdf_path = vim.fn.expand("%:r") .. ".pdf"
						if vim.fn.filereadable(pdf_path) == 1 then
							vim.fn.jobstart({ "pdfpc", pdf_path })
						end
					end,
					"Present Output",
				},
				l = {
					function()
						utils.toggle_qf()
					end,
					"Logs",
				},
				t = { "<cmd>TexlabBuild<cr>", "LaTeX" },
				f = { "<cmd>TexlabForward<cr>", "Forward Search" },
			},

			w = {
				name = "Document", -- Writer: markdown, latex, wiki
				n = { "<cmd>enew<cr>", "New File" },
				s = { "<cmd>setlocal spell!<cr>", "Toggle Spelling" },
				t = { "<cmd>TableModeToggle<cr>", "Toggle Table Mode" },
				p = { "<cmd>setlocal paste!<cr>", "Toggle Paste" },
				b = { "<cmd>read !getbib -c<cr>", "Get Bib" },
				c = {
					function()
						utils.vim_opt_toggle("conceallevel", 2, 0, "Conceal")
					end,
					"Toggle Conceal",
				},
				v = { "<Plug>MarkdownPreviewToggle<cr>", "Markdown preview" },
				w = {
					function()
						utils.vim_opt_toggle("wrap", true, false, "Soft Wrap")
					end,
					"Toggle Soft Wrapping",
				},
				W = {
					function()
						utils.vim_opt_toggle("textwidth", 80, 0, "Hard Wrap")
					end,
					"Toggle Hard Wrapping",
				},
				m = {
					function()
						require("nabla").popup()
					end,
					"Preview Math",
				},
			},

			h = {
				name = "Hop",
				c = { "<cmd>HopChar1<cr>", "Character" },
				C = { "<cmd>HopChar2<cr>", "2 Characters" },
				l = { "<cmd>HopLine<cr>", "Line" },
				p = { "<cmd>HopPattern<cr>", "Pattern" },
				w = { "<cmd>HopWord<cr>", "Word" },
			},

			s = {
				name = "Surf",
				s = { "<cmd>STSSelectMasterNode<cr>", "Surf" },
				S = { "<cmd>STSSelectCurrentNode<cr>", "Surf Node" },
			},

			n = {
				name = "Notes",
				b = {
					function()
						require("zk.commands")("ZkBacklinks")()
					end,
					"Backlink Picker",
				},
				d = {
					function()
						require("zk.commands")("ZkCd")()
					end,
					"Change Directory",
				},
				r = {
					function()
						require("zk.commands")("ZkIndex")()
					end,
					"Refresh Index",
				},
				l = {
					function()
						require("zk.commands")("ZkLinks")()
					end,
					"Link Picker",
				},
				s = {
					function()
						require("zk.commands").get("ZkNotes")({ sort = { "modified" } })
					end,
					"Search",
				},
				n = {
					function()
						require("zk.commands").get("ZkNew")({ dir = "personal", title = vim.fn.input("Title: ") })
					end,
					"New Personal Note",
				},
				N = {
					function()
						require("zk.commands").get("ZkNew")({ dir = "work", title = vim.fn.input("Title: ") })
					end,
					"New Work Note",
				},
				t = {
					function()
						require("zk.commands").get("ZkTags")()
					end,
					"Tags",
				},
				i = { "<Plug>(simple-todo-new-list-item)", "Insert Todo" },
				I = { "<Plug>(simple-todo-new-list-item-start-of-line)", "Convert to Todo" },
				o = { "<Plug>(simple-todo-below)", "Insert Todo Below" },
				O = { "<Plug>(simple-todo-above)", "Insert Todo Above" },
				x = { "<Plug>(simple-todo-mark-as-done)", "Mark Done" },
				X = { "<Plug>(simple-todo-mark-as-undone)", "Mark Undone" },
				["<tab>"] = { "<Plug>(simple-todo-mark-switch)", "Toggle Todo" },
			},
			d = { -- TODO: d??
				name = "Debugger",
				b = {
					function()
						require("dap").toggle_breakpoint()
					end,
					"Toggle Breakpoint",
				},
				B = {
					function()
						require("dap").clear_breakpoints()
					end,
					"Clear Breakpoints",
				},
				c = {
					function()
						require("dap").continue()
					end,
					"Continue",
				},
				i = {
					function()
						require("dap").step_into()
					end,
					"Step Into",
				},
				l = {
					function()
						require("dapui").float_element("breakpoints")
					end,
					"List Breakpoints",
				},
				o = {
					function()
						require("dap").step_over()
					end,
					"Step Over",
				},
				q = {
					function()
						require("dap").close()
					end,
					"Close Session",
				},
				Q = {
					function()
						require("dap").terminate()
					end,
					"Terminate",
				},
				r = {
					function()
						require("dap").repl.toggle()
					end,
					"REPL",
				},
				s = {
					function()
						require("dapui").float_element("scopes")
					end,
					"Scopes",
				},
				t = {
					function()
						require("dapui").float_element("stacks")
					end,
					"Threads",
				},
				u = {
					function()
						require("dapui").toggle()
					end,
					"Toggle Debugger UI",
				},
				w = {
					function()
						require("dapui").float_element("watches")
					end,
					"Watches",
				},
				x = {
					function()
						require("dap.ui.widgets").hover()
					end,
					"Inspect",
				},
			},

			D = { "<cmd>Dashboard<CR>", "Dashboard" },

			l = {
				-- TODO: see what lvim has!
				name = "Lsp",
				a = { "<cmd>Telescope lsp_code_actions<CR>", "Code actions" },
				A = { "<cmd>Telescope lsp_range_code_actions<CR>", "Range code actions" },
				d = { "<cmd>Telescope lsp_definitions<CR>", "Lsp definitions" },
				D = { "<cmd>require('telescope.builtin').diagnostics()", "All diagnostics" },
				z = { "<cmd>Telescope lsp_references<CR>", "References" },
				R = { "<cmd>Telescope lsp_references<CR>", "References" },
				v = { "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Definition vsplit" },
				Dh = { "<cmd>vim.diagnostic.open_float", "Hover diagnostic" },
				-- leaderNormal['lI'] = {'<cmd>Telescope lsp_implementations<CR>', "Lsp implementations"}
			},

			t = {
				name = "Terminal",
				-- p = { [[<cmd>lua require('core.utils').toggle_term_cmd({cmd='ipython', on_open='function(term) vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true}) end'})<CR>]], "iPython" },
				-- p = {[[<cmd>exe v:count1 . "lua require('core.utils').toggle_term_cmd({cmd='ipython', count=vim.v.count})"<CR>]], "iPython" },
				f = { "<Cmd>Telescope termfinder find<CR>", "Terminal list" },
				H = { "<cmd>lua require('core.utils').toggle_term_cmd({cmd='htop'})<CR>", "Htop" },
				l = { [[<cmd>lua require("core.utils").toggle_term_cmd({cmd="lua"})<CR>]], "Lua" },
				p = {
					[[<cmd>lua require('core.utils').toggle_term_cmd({cmd='ipython', hidden=false})<CR>]],
					"iPython",
				},
				t = { '<Cmd>lua require("user.utils").toggle_term()<CR>', "ToggleTerm" },
				x = { [[<cmd>lua require('user.utils').execute_file()<CR>]], "Execute buffer" },
				z = { [[<cmd>lua require "core.utils".toggle_term_cmd({cmd=vim.o.shell})<CR>]], "Shell" },
			},

			-- Git, enhance base functionality
			g = {
				m = { "<cmd>Neogit<CR>", "Magit" }, -- noremap=true
				v = { "<cmd>diffview: diff HEAD", "Diffview" },
				y = {
					"<cmd>lua require('core.utils').toggle_term_cmd({cmd = 'lazygit', count = 1, direction = 'float'})<CR>",
					"Lazygit",
				},
				-- g = {"<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd = 'lazygit', count = 1, direction = 'float'})<CR>", 'Lazygit'},
			},

			u = {
				name = "Utils",
				w = { "<cmd>keeppatterns %substitute/\\s\\+$//e<CR>", "Clear postspace" },
			},
			-- k = {"<cmd>bd!<cr>", "Kill (del) buffer"},
		}, -- end prefix <leader>
		["]"] = {
			f = "Next function start",
			x = "Next class start",
			F = "Next function end",
			X = "Next class end",
			z = "Fix next misspelling",
		},
		["["] = {
			f = "Previous function start",
			x = "Previous class start",
			F = "Previous function end",
			X = "Previous class end",
			z = "Fix previous misspelling",
		},
		g = {
			t = {
				name = "Treesitter",
				v = {
					function()
						require("syntax-tree-surfer").targeted_jump({ "variable_declaration" })
					end,
					"Go to Variables",
				},
				f = {
					function()
						require("syntax-tree-surfer").targeted_jump({ "function" })
					end,
					"Go to Functions",
				},
				i = {
					function()
						require("syntax-tree-surfer").targeted_jump({
							"if_statement",
							"else_clause",
							"else_statement",
							"elseif_statement",
						})
					end,
					"Go to If Statements",
				},
				r = {
					function()
						require("syntax-tree-surfer").targeted_jump({ "for_statement" })
					end,
					"Go to If Statements",
				},
				w = {
					function()
						require("syntax-tree-surfer").targeted_jump({ "white_statement" })
					end,
					"Go to While Statements",
				},
				s = {
					function()
						require("syntax-tree-surfer").targeted_jump({ "switch_statement" })
					end,
					"Go to Switch Statements",
				},
				t = {
					function()
						require("syntax-tree-surfer").targeted_jump({
							"function",
							"if_statement",
							"else_clause",
							"else_statement",
							"elseif_statement",
							"for_statement",
							"while_statement",
							"switch_statement",
						})
					end,
					"Go to Statement",
				},
			},
		},
		["<localleader>"] = {

			-- TODO: commented out commands are not working - check rafi/vim-config for fix
			-- Telescope general pickers
			a = { "<Cmd>Neotree focus<CR>", "Nvimtree toggle" }, -- Nvimtree
			b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
			c = { '<cmd>lua require("telescope.builtin").command_history()<CR>', "Command history" },
			d = { '<cmd>lua require"user.plugins.telescope".pickers.plugin_directories()<CR>', "Directories" },
			e = { "<Cmd>Neotree toggle<CR>", "Nvimtree toggle" }, -- Nvimtree
			f = { '<cmd>lua require("telescope.builtin").find_files()<CR>', "Files" },
			g = { '<cmd>lua require("telescope.builtin").live_grep()<CR>', "Live grep" },
			G = { "<cmd>lua require('user.plugins.telescope').pickers.grep_string_cursor()<cr>", "Grep cursor word" },
			h = { '<cmd>lua require("telescope.builtin").highlights()<CR>', "Highlights" },
			H = { '<cmd>lua require("telescope.builtin").search_history()<CR>', "Search history" },
			j = { '<cmd>lua require("telescope.builtin").jumplist()<CR>', "Jumplist" },
			-- k = {"<cmd>bd!<cr>", "Kill (del) buffer"},
			l = { name = "VimTex" },
			m = { '<cmd>lua require("telescope.builtin").marks()<CR>', "Marks" },
			n = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "Notifications" }, -- require("telescope").load_extension("notify")
			N = { '<cmd>lua require"user.plugins.telescope".pickers.notebook()<CR>', "Notebook" },
			-- o = {'<cmd>lua require("telescope.builtin").vim_options()<CR>', "Vim options"},
			-- p = {'<cmd>lua require("telescope.builtin").projects()<CR>', "Projects"},
			q = { "<cmd>bd!<cr>", "Kill (del) buffer" },
			R = { '<cmd>lua require("telescope.builtin").pickers()<CR>', "Pickers" },
			-- S = {'<cmd>lua require("telescope.builtin").session-lens search_session()<CR>', "Search session"},
			s = { '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', "Search current Buffer" },
			t = {
				'<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>',
				"LSP workspace symbols",
			},
			u = { '<cmd>lua require("telescope.builtin").resume()<CR>', "Resume last" },
			v = { '<cmd>lua require("telescope.builtin").registers()<CR>', "Registers" },
			w = { '<cmd>lua require("telescope.builtin").spell_suggest()<CR>', "Spell suggestions" },
			x = { '<cmd>lua require("telescope.builtin").oldfiles()<CR>', "Files old" },
			-- z = {'<cmd>Zoxide<CR>', "Zoxide"},
			["/"] = {
				'<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>',
				"Search current buffer",
			},

			-- Trouble --
			T = {
				name = "Diagnostics",
				c = { "<cmd>TroubleClose<cr>", "Close" },
				d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document" },
				D = { "<cmd>TroubleToggle lsp_definitions<cr>", "Definitions" },
				i = { "<cmd>TroubleToggle lsp_implementations<cr>", "Implementations" },
				l = { "<cmd>TroubleToggle loclist<cr>", "Location list" },
				q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
				r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
				R = { "<cmd>TroubleRefresh<cr>", "Refresh" },
				t = { "<cmd>TroubleToggle<cr>", "Trouble" },
				T = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "Types" },
				w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace" },
			},
		},
		w = {
			name = "Window", -- optional group name
			g = { "<cmd>call Toggle_background()<CR>", "Toggle background color" }, -- create a binding with label
			b = { "<cmd>buffer#<CR>", "Buffer alternate" },
			o = { "<cmd>only<CR>", "Only this" },
			c = { "<cmd>close<CR>", "Close" },
			d = { "<cmd>bdelete!<CR>", "Buffer delete" },
			q = { "<cmd>quit<CR>", "Quit" },
			w = { "<cmd>save %<CR>", "Save" },
			x = { "<cmd>call utils#window_empty_buffer()<CR>", "Buffer empty" },
			z = { "<cmd>call utils#zoom()<CR>", "Zoom" },

			-- h = { '<cmd>split<CR>', "Split horizontal"},
			-- v = { '<cmd>vsplit<CR>', "Split vertical"},
			--Split current buffer, go to previous window and previous buffer
			h = { "<cmd>split<CR>:wincmd p<CR>:e#<CR>", "Split horizontal" },
			v = { "<cmd>vsplit<CR>:wincmd p<CR>:e#<CR>", "Split vertical" },
			t = { "<cmd>tabnew<CR>", "Tab new" },
			n = { "<cmd>tabnext<CR>", "Tab next" },
			p = { "<cmd>tabprev<CR>", "Tab previous" },

			f = { "<cmd>lcd %:p:h<CR>" },
		},
		-- Telescope LSP related
		l = {
			name = "Lsp",
			a = { "<cmd>Telescope lsp_code_actions<CR>", "Lsp code actions" },
			c = { "<cmd>Telescope lsp_range_code_actions<CR>", "Lsp range code actions" },
			d = { "<cmd>Telescope lsp_definitions<CR>", "Lsp definitions" },
			i = { "<cmd>Telescope lsp_implementations<CR>", "Lsp implementations" },
			r = { "<cmd>Telescope lsp_references<CR>", "Lsp references" },
			t = { "<cmd>ToggleDiag<cr>", "Toggle virtual text" },
			v = { "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Definition vsplit" },
		},
		["q"] = {
			function()
				MiniBufremove.delete()
			end,
			"Bye Buffer",
		},
		["<c-q>"] = {
			function()
				MiniBufremove.delete()
			end,
			"Bye Buffer",
		},
		["<F4>"] = { '=strftime("%Y-%m-%d")<CR>P', "Time stamp" }, -- '=strftime("%H:%M")<CR>P'
	},
	-- insert mode
	i = {
		["<c-d>"] = {
			n = { "<c-r>=strftime('%Y-%m-%d')<cr>", "Y-m-d" },
			x = { "<c-r>=strftime('%m/%d/%y')<cr>", "m/d/y" },
			f = { "<c-r>=strftime('%B %d, %Y')<cr>", "B d, Y" },
			X = { "<c-r>=strftime('%H:%M')<cr>", "H:M" },
			F = { "<c-r>=strftime('%H:%M:%S')<cr>", "H:M:S" },
			d = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", "Y/m/d H:M:S -" },
		},
	},
	-- visual mode
	v = {
		["<leader>"] = {
			h = {
				name = "Hop",
				c = { "<cmd>HopChar1<cr>", "Character" },
				C = { "<cmd>HopChar2<cr>", "2 Characters" },
				l = { "<cmd>HopLine<cr>", "Line" },
				p = { "<cmd>HopPattern<cr>", "Pattern" },
				w = { "<cmd>HopWord<cr>", "Word" },
			},

			n = {
				name = "Notes",
				s = { ":'<,'>lua require('zk.commands').get('ZkMatch')()<cr>", "Search" },
				n = {
					":'<,'>lua require('zk.commands').get('ZkNewFromTitleSelection')({ dir = 'personal' })<cr>",
					"New Personal Note From Title",
				},
				N = {
					":'<,'>lua require('zk.commands').get('ZkNewFromTitleSelection')({ dir = 'work' })<cr>",
					"New Work Note From Title",
				},
				W = {
					":'<,'>lua require('zk.commands').get('ZkNewFromContentSelection')({ dir = 'work', title = vim.fn.input('Title: ') })<cr>",
					"New Work Note From Content",
				},
				C = {
					":'<,'>lua require('zk.commands').get('ZkNewFromContentSelection')({ dir = 'personal', title = vim.fn.input('Title: ') })<cr>",
					"New Personal Note From Content",
				},
				x = { "<Plug>(simple-todo-mark-as-done)", "Mark Done" },
				X = { "<Plug>(simple-todo-mark-as-undone)", "Mark Undone" },
				["<tab>"] = { "<Plug>(simple-todo-mark-switch)", "Toggle Todo" },
			},
			x = {
				name = "Debugger",
				e = {
					function()
						require("dapui").eval()
					end,
					"Evaluate Line",
				},
			},
		},
	},
	-- x-mode (visual)
	x = {
		["<localleader"] = {
			g = { '<cmd>lua require"user.plugins.telescope".pickers.grep_string_visual()<cr>', "Grep selection" },
			G = { '<cmd>lua require"user.plugins.telescope".pickers.grep_string_visual()<cr>', "Grep selection" },
		},
	},
}
