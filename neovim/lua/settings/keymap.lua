local wk = require("which-key")

vim.g.mapleader = " " -- Space is my leader

wk.register({
	['<leader>'] = {
		-- Navigate between files
		-- (From https://wincent.com/wiki/rails.vim_cheatsheet)
		-- in a model the "alternate" is the spec and the "related" is the schema
		-- in a controller (method) the "alternate" is the spec and the "related" is the view
		-- in a view the "alternate" is the spec and the "related" is the controller (method)
		-- Easily switch between file and its spec using rails.vim's alternate file functionality
		A = {':AV<CR>', 'Open rails alternate in VSplit'},
		a = {':A<CR>', 'Open rails alternate'},
		['bb'] = {":lua require('telescope.builtin').buffers()<CR>", "List buffers"},
		['ca'] = {":lua require('telescope.builtin').lsp_code_actions()<CR>", "LSP code action"},
		['da'] = {':Dash<CR>', 'Look up command in Dash'},
		['def'] = {":lua require('telescope.builtin').lsp_definitions()<CR>", 'Go to definition'},
		['do'] = {':TodoTelescope<CR>', "Show todos"},
		e = {":lua require('telescope.builtin').treesitter()<CR>", "Open treesitter"},
		g = {
			r = {":lua require('telescope.builtin').live_grep()<CR>", "Grep code"},
			t = {
				name = "+ git",
				b = {":lua require('plugins.telescope').my_git_bcommits()<CR>", "List commits for this buffer"},
				c = {":lua require('plugins.telescope').my_git_commits()<CR>", "List all commits"},
				g = {":Neogit<CR>", "Neogit"},

				s = {'<cmd>lua require"gitsigns".stage_hunk()<CR>', "Stage hunk"},
				u = {'<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "Un-stage hunk"},
				r = {'<cmd>lua require"gitsigns".reset_hunk()<CR>',"Reset hunk"},
				R = {'<cmd>lua require"gitsigns".reset_buffer()<CR>', "Reset buffer"},
				p = {'<cmd>lua require"gitsigns".preview_hunk()<CR>', "Preview hunk"},
				b = {'<cmd>lua require"gitsigns".blame_line(true)<CR>', "Blame line"}
			}
		},
		h = {':lua vim.lsp.buf.hover()<CR>', 'open LSP hover'},
		m = {":lua require('telescope.builtin').marks()<CR>", "List marks"},
		n = {':NvimTreeToggle<cr>', 'Open a file explorer'},
		l = {":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Fuzzy find in buffer"},
		o = {':%!python -m json.tool<CR>', 'Pretty print JSON'},
		p = {'"_dP', "Paste multiple times with the same contents"},
		['prj'] = {":Telescope projects<CR>", "Open projects"},
		q = {':bd<CR>', 'Close current buffer' },
		['ref'] = {":lua require('telescope.builtin').lsp_references()<CR>", "List references"},
		['rf'] = {
			name = "+ refactor",
			['ap'] = {':RAddParameter<CR>', "Add parameter (ruby)"},
			['em'] = {':RExtractMethod<CR>', "Extract method (ruby)"},
			['rn'] = {':lua vim.lsp.buf.rename()<CR>', 'Rename symbol'}
		},
		['rs'] = {
			name = "+ tests",
			n = {':w<CR>:TestNearest<CR>', 'Run nearest test'},
			f = {':w<CR>:TestFile<CR>', "Run file's tests"},
			s = {':w<CR>:TestSuite<CR>', "Run test suite"},
			l = {':w<CR>:TestLast<CR>', "Re-run last test"},
			v = {':w<CR>:TestVisit<CR>', "Re-open file from last test run"}
		},
		s = {':lua vim.lsp.buf.document_symbol()<CR>', 'List symbols in current docx'},
		t = {":lua require('plugins.telescope').project_files()<CR>", "Open project's files"},
		w = {':w<CR>', 'Save file'},
		['<Space>'] = {':w<CR>', 'Save file by hammering space twice'}
	},
	Q = {'<Nop>', 'Ex mode disabled'},
	-- Move lines up/down
	-- Based on https://vim.fandom.com/wiki/Moving_lines_up_or_down
	['<C-Down>'] = {':m .+1<CR>==', "Move line down"},
	['<C-Up>'] = {':m .-2<CR>==', "Move line up"},
	['<C-Down>'] = {'<Esc>:m .+1<CR>==gi', "Move line down", mode='i'},
	['<C-Up>'] = {'<Esc>:m .-2<CR>==gi', "Move line up", mode='i'},
	['<C-Down>'] = {':m \'>+1<CR>gv=gv', "Move line down", mode='v'},
	['<C-Up>'] = {':m \'<-2<CR>gv=gv', "Move line up", mode='v'},


	-- Work with git hunks
	['ih'] = {':<C-U>lua require"gitsigns.actions".select_hunk()<CR>', "Select hunk", mode = "o"},
	['ih'] = {':<C-U>lua require"gitsigns.actions".select_hunk()<CR>', "Select hunk", mode = "x"},

	[']c'] = {"&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'", "Next hunk", expr = true},
	['[c'] = {"&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'", "Prev hunk", expr = true},
  [']d'] = {':lua vim.lsp.diagnostic.goto_next()<CR>', 'Next LSP error'},
  ['[d'] = {':lua vim.lsp.diagnostic.goto_prev()<CR>', "Previous LSP error"}

})

wk.register({
  ['<leader>'] = {
    g = {
      name = "+ git",
      t = {
        name = "+ git",
        s = {'<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "Stage lines", mode = 'v'},
        r = {'<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "Reset lines", mode = 'v'},
      },
    }
  }
}, {mode = 'v'})


-- Move the splits arround - but sadly couldn't get it working
--map('n', '<c-s-k>', '<C-W>K', {silent = true })
--map('n', '<c-s-j>', '<C-W>J', {silent = true })
--map('n', '<c-s-h>', '<C-W>H', {silent = true })
--map('n', '<c-s-l>', '<C-W>L', {silent = true })
