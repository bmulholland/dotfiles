local wk = require("which-key")

-- From https://oroques.dev/notes/neovim-init/
local function map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


vim.g.mapleader = " " -- Space is my leader

wk.register({
	['<leader>'] = {
		-- Navigate between files
		-- (From https://wincent.com/wiki/rails.vim_cheatsheet)
		-- in a model the "alternate" is the spec and the "related" is the schema
		-- in a controller (method) the "alternate" is the spec and the "related" is the view
		-- in a view the "alternate" is the spec and the "related" is the controller (method)
		-- Easily switch between file and its spec using rails.vim's alternate file functionality
		A = {':AV<CR>', 'Open in rails alternate in VSplit'},
		a = {':A<CR>', 'Open rails alternate'},
		['ap'] = {':RAddParameter<CR>', "Add parameter (ruby)"},
		['bb'] = {":lua require('telescope.builtin').buffers()<CR>", "List buffers"},
		['ca'] = {":lua require('telescope.builtin').lsp_code_actions()<CR>", "LSP code action"},
		['da'] = {':Dash<CR>', 'Look up command in Dash'},
		['def'] = {":lua require('telescope.builtin').lsp_definitions()<CR>", 'Go to definition'},
		['do'] = {':TodoTelescope<CR>', "Show todos", noremap = true},
		e = {":lua require('telescope.builtin').treesitter()<CR>", "Open treesitter"},
		['gb'] = {":lua require('plugins.telescope').my_git_bcommits()<CR>", "List commits for this buffer"},
		['gc'] = {":lua require('plugins.telescope').my_git_commits()<CR>", "List all commits"},
		['gg'] = {":Neogit<CR>", "Neogit"},
		['gr'] = {":lua require('telescope.builtin').live_grep()<CR>", "Grep code"},
		h = {':lua vim.lsp.buf.hover()<CR>', 'open LSP hover'},
		m = {":lua require('telescope.builtin').marks()<CR>", "List marks"},
		n = {':NvimTreeToggle<cr>', 'Open a file explorer'},
		l = {":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Fuzzy find in buffer"},
		o = {':%!python -m json.tool<CR>', 'Pretty print JSON'},
		['prj'] = {":Telescope projects<CR>", "Open projects"},
		['ref'] = {":lua require('telescope.builtin').lsp_references()<CR>", "List references"},
		['rs'] = {
			name = "+ tests",
			n = {':w<CR>:TestNearest<CR>', 'Run nearest test'},
			f = {':w<CR>:TestFile<CR>', "Run file's tests"},
			s = {':w<CR>:TestSuite<CR>', "Run test suite"},
			l = {':w<CR>:TestLast<CR>', "Re-run last test"},
			v = {':w<CR>:TestVisit<CR>', "Re-open file from last test run"}
		},
		['rnm'] = {':lua vim.lsp.buf.rename()<CR>', 'Rename symbol'},
		s = {':lua vim.lsp.buf.document_symbol()<CR>', 'List symbols in current docx'},
		t = {":lua require('plugins.telescope').project_files()<CR>", "Open project's files"},
		q = {':bd<CR>', 'Close current buffer' },
		w = {':w<CR>', 'Save file'},
		[','] = {':lua vim.lsp.diagnostic.goto_prev()<CR>', "Previous LSP error"},
		[';'] = {':lua vim.lsp.diagnostic.goto_next()<CR>', 'Next LSP error'},
		['<Space>'] = {':w<CR>', 'Save file by hammering space twice'}
	},
	Q = {'<Nop>', 'Ex mode disabled'},
	-- Move lines up/down
	-- Based on https://vim.fandom.com/wiki/Moving_lines_up_or_down
	['<C-Down>'] = {':m .+1<CR>==', "Move line down"},
	['<C-Up>'] = {':m .-2<CR>==', "Move line up"}
})


map('v', '<leader>p', '"_dP') -- Paste multiple times with the same contents


-- Move the splits arround - but sadly couldn't get it working
--map('n', '<c-s-k>', '<C-W>K', {silent = true })
--map('n', '<c-s-j>', '<C-W>J', {silent = true })
--map('n', '<c-s-h>', '<C-W>H', {silent = true })
--map('n', '<c-s-l>', '<C-W>L', {silent = true })

-- Move lines up/down
-- Based on https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('i', '<C-Down>', '<Esc>:m .+1<CR>==gi', {silent  = true})
map('i', '<C-Up>', '<Esc>:m .-2<CR>==gi', {silent  = true})
map('v', '<C-Down>', ':m \'>+1<CR>gv=gv', {silent  = true})
map('v', '<C-Up>', ':m \'<-2<CR>gv=gv', {silent  = true})



-- LSP - Errors, Definitions, etc
-- The experience of these isn't great - try the telescope versions
--map('n', '<leader>ca', ':lua vim.lsp.diagnostic.code_action()<CR>', {silent = true})
--map('n', '<leader>d', ':lua vim.lsp.buf.definition()<CR>', {silent = true})
--map('n', '<leader>ref', ':lua vim.lsp.buf.references()<CR>', {silent = true})

-- Telescope
-- TODO: Learn these too
-- From https://github.com/crivotz/nv-ide/blob/master/lua/settings/keymap.lua#L41


-- Refactoring ruby
map('v', '<leader>em', ':RExtractMethod<CR>', {silent = true})

