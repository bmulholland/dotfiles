local wk = require("which-key")

vim.g.mapleader = " " -- Space is my leader

wk.register({
	["<leader>"] = {
		-- Navigate between files
		-- (From https://wincent.com/wiki/rails.vim_cheatsheet)
		-- in a model the "alternate" is the spec and the "related" is the schema
		-- in a controller (method) the "alternate" is the spec and the "related" is the view
		-- in a view the "alternate" is the spec and the "related" is the controller (method)
		-- Easily switch between file and its spec using rails.vim's alternate file functionality
		A = { ":AV<CR>", "Open rails alternate in VSplit" },
		a = { ":A<CR>", "Open rails alternate" },
		b = {
			name = "+ buffers",
			b = { ":lua require('telescope.builtin').buffers()<CR>", "List buffers" },
			q = { ":bufdo bwipeout<CR>", "Close all buffers" },
		},
		["ca"] = { ":CodeActionMenu<CR>", "LSP code action" },
		d = {
			a = { ":DashWord<CR>", "Look up command in Dash" },
			["ef"] = { ":lua require('telescope.builtin').lsp_definitions()<CR>", "Go to definition" },
			o = { ":TodoTelescope<CR>", "Show todos" },
			p = {
				name = "Debug",
				s = {
					name = "Step",
					c = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
					v = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
					i = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },
					o = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
				},
				h = {
					name = "Hover",
					h = { "<cmd>lua require('dap.ui.variables').hover()<CR>", "Hover" },
					v = { "<cmd>lua require('dap.ui.variables').visual_hover()<CR>", "Visual Hover" },
				},
				u = {
					name = "UI",
					h = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "Hover" },
					f = {
						"local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>",
						"Float",
					},
				},
				r = {
					name = "Repl",
					o = { "<cmd>lua require('dap').repl.open()<CR>", "Open" },
					l = { "<cmd>lua require('dap').repl.run_last()<CR>", "Run Last" },
				},
				b = {
					name = "Breakpoints",
					c = {
						"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
						"Breakpoint Condition",
					},
					m = {
						"<cmd>lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
						"Log Point Message",
					},
					t = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle" },
				},
				c = { "<cmd>lua require('dap').scopes()<CR>", "Scopes" },
				i = { "<cmd>lua require('dap').toggle()<CR>", "Toggle" },
			},
		},
		e = { ":lua require('telescope.builtin').treesitter()<CR>", "Open treesitter" },
		g = {
			r = { ":lua require('telescope.builtin').live_grep()<CR>", "Grep code" },
			t = {
				name = "+ git",
				b = { ":lua require('plugins.telescope').my_git_bcommits()<CR>", "List commits for this buffer" },
				c = { ":lua require('plugins.telescope').my_git_commits()<CR>", "List all commits" },
				g = { ":Neogit<CR>", "Neogit" },

				s = { '<cmd>lua require"gitsigns".stage_hunk()<CR>', "Stage hunk" },
				u = { '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "Un-stage hunk" },
				r = { '<cmd>lua require"gitsigns".reset_hunk()<CR>', "Reset hunk" },
				R = { '<cmd>lua require"gitsigns".reset_buffer()<CR>', "Reset buffer" },
				p = { '<cmd>lua require"gitsigns".preview_hunk()<CR>', "Preview hunk" },
				b = { '<cmd>lua require"gitsigns".blame_line(true)<CR>', "Blame line" },
			},
		},
		h = { ":lua vim.lsp.buf.hover()<CR>", "open LSP hover" },
		m = { ":lua require('telescope.builtin').marks()<CR>", "List marks" },
		n = { ":NvimTreeToggle<cr>", "Open a file explorer" },
		l = { ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Fuzzy find in buffer" },
		o = { ":%!python -m json.tool<CR>", "Pretty print JSON" },
		["prj"] = { ":Telescope projects<CR>", "Open projects" },
		q = { ":bd<CR>", "Close current buffer" },
		["ref"] = { ":lua require('telescope.builtin').lsp_references()<CR>", "List references" },
		["rf"] = {
			name = "+ refactor",
			["ap"] = { ":RAddParameter<CR>", "Add parameter (ruby)" },
			["em"] = { ":RExtractMethod<CR>", "Extract method (ruby)" },
			["rn"] = { ':lua require("renamer").rename()<CR>', "Rename symbol" },
		},
		["rs"] = {
			name = "+ tests",
			n = { ":w<CR>:lua require('neotest').run.run()<CR>", "Run nearest test" },
			f = { ":w<CR>:lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Run file's tests" },
			d = { ":d<CR>:lua require('neotest').run.run(){strategy = 'dap'})<CR>", "Run nearest (DAP)" },
			s = { ":d<CR>:lua require('neotest').run.stop()<CR>", "Stop nearest" },
		},
		s = { ":lua vim.lsp.buf.document_symbol()<CR>", "List symbols in current docx" },
		t = { ":lua require('plugins.telescope').project_files()<CR>", "Open project's files" },
		T = { ":TroubleToggle<cr>", "Toggle Trouble" },
		-- w = { ":w<CR>", "Save file" },
		x = {
			name = "+ trouble",
			d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document diagnostics" },
			l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
			w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace diagnostics" },
			q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
			x = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
		},
		["<Space>"] = { ":w<CR>", "Save file by hammering space twice" },
	},
	Q = {
		name = "+ quickfix (& disables Exmode)",
		n = { ":cnext<CR>", "Go to next item in quickfix list" },
		p = { ":cprev<CR>", "Go to previous item in quickfix list" },
		q = { ":ccl<CR>", "Close quickfix list" },
	},

	p = { '"_dP', "Paste without overwriting the register", mode = "x" },

	-- Work with git hunks
	["ih"] = { ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>', "Select hunk", mode = "o" },
	["ih"] = { ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>', "Select hunk", mode = "x" },

	["]t"] = { "<Plug>(ultest-next-fail)", "Next failing test" },
	["[t"] = { "<Plug>(ultest-prev-fail)", "Prev failing test" },
	["]c"] = { "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'", "Next hunk", expr = true },
	["[c"] = { "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'", "Prev hunk", expr = true },
	["]d"] = { ":lua vim.diagnostic.goto_next()<CR>", "Next LSP error" },
	["[d"] = { ":lua vim.diagnostic.goto_prev()<CR>", "Previous LSP error" },
})

wk.register({
	["<leader>"] = {
		g = {
			name = "+ git",
			t = {
				name = "+ git",
				s = {
					'<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
					"Stage lines",
					mode = "v",
				},
				r = {
					'<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
					"Reset lines",
					mode = "v",
				},
			},
		},
	},
}, { mode = "v" })

-- Move the splits arround - but sadly couldn't get it working
--map('n', '<c-s-k>', '<C-W>K', {silent = true })
--map('n', '<c-s-j>', '<C-W>J', {silent = true })
--map('n', '<c-s-h>', '<C-W>H', {silent = true })
--map('n', '<c-s-l>', '<C-W>L', {silent = true })
