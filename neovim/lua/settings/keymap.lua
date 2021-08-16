-- From https://oroques.dev/notes/neovim-init/
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


vim.g.mapleader = " " -- Space is my leader

map('n', '<leader>q', ':bd<CR>') -- Close current buffer

map('n', '<leader>w', ':w<CR>') -- Save file with space w
map('n', '<leader><Space>', ':w<CR>') -- Save file by hammering space twice

map('v', '<leader>p', '"_dP') -- Paste multiple times with the same contents

-- turn off ex mode
map('n', 'Q', '<Nop>')


-- Navigate between files
-- (From https://wincent.com/wiki/rails.vim_cheatsheet)
-- in a model the "alternate" is the spec and the "related" is the schema
-- in a controller (method) the "alternate" is the spec and the "related" is the view
-- in a view the "alternate" is the spec and the "related" is the controller (method)
-- Easily switch between file and its spec using rails.vim's alternate file functionality
map('n', '<leader>a', ':A<CR>')
map('n', '<leader>A', ':AV<CR>') -- open in vertical split

-- Move the splits arround - but sadly couldn't get it working
--map('n', '<c-s-k>', '<C-W>K', {silent = true })
--map('n', '<c-s-j>', '<C-W>J', {silent = true })
--map('n', '<c-s-h>', '<C-W>H', {silent = true })
--map('n', '<c-s-l>', '<C-W>L', {silent = true })

-- Navigate within a file

-- Move lines up/down
-- Based on https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-Down>', ':m .+1<CR>==', {silent  = true})
map('n', '<C-Up>', ':m .-2<CR>==', {silent  = true})
map('i', '<C-Down>', '<Esc>:m .+1<CR>==gi', {silent  = true})
map('i', '<C-Up>', '<Esc>:m .-2<CR>==gi', {silent  = true})
map('v', '<C-Down>', ':m \'>+1<CR>gv=gv', {silent  = true})
map('v', '<C-Up>', ':m \'<-2<CR>gv=gv', {silent  = true})

-- Open plugins

map('n', '<leader>n', ':NvimTreeToggle<cr>') -- Open a file explorer

map('n', '<leader>da', ':Dash<CR>', {silent = true }) -- Look up command in Dash

-- Pretty print JSON
map('n', '<leader>o', ':%!python -m json.tool<CR>')

-- LSP - Errors, Definitions, etc
map('n', '<leader>,', ':lua vim.lsp.diagnostic.goto_prev()<CR>', {silent = true})
map('n', '<leader>;', ':lua vim.lsp.diagnostic.goto_next()<CR>', {silent = true})
map('n', '<leader>h', ':lua vim.lsp.buf.hover()<CR>', {silent = true})
map('n', '<leader>rnm', ':lua vim.lsp.buf.rename()<CR>',{silent = true})
map('n', '<leader>s', ':lua vim.lsp.buf.document_symbol()<CR>', {silent = true})
-- The experience of these isn't great - try the telescope versions
--map('n', '<leader>ca', ':lua vim.lsp.diagnostic.code_action()<CR>', {silent = true})
--map('n', '<leader>d', ':lua vim.lsp.buf.definition()<CR>', {silent = true})
--map('n', '<leader>ref', ':lua vim.lsp.buf.references()<CR>', {silent = true})

map('n', '<leader>def', ":lua require('telescope.builtin').lsp_definitions()<CR>", {silent = true})

-- Telescope
map('n', '<leader>t', ":lua require('plugins.telescope').project_files()<CR>", {silent = true, nowait = true})
-- TODO: Learn these too
-- From https://github.com/crivotz/nv-ide/blob/master/lua/settings/keymap.lua#L41
map('n', '<leader>ca', ":lua require('telescope.builtin').lsp_code_actions()<CR>", {silent = true})
map('n', '<leader>ref', ":lua require('telescope.builtin').lsp_references()<CR>", {silent = true})

map('n', '<leader>r', ":lua require('telescope.builtin').live_grep()<CR>", {silent = true})
map('n', '<leader>bb', ":lua require('telescope.builtin').buffers()<CR>", {silent = true})
map('n', '<leader>m', ":lua require('telescope.builtin').marks()<CR>", {silent = true})
map('n', '<leader>e', ":lua require('telescope.builtin').treesitter()<CR>", {silent = true})
map('n', '<leader>l', ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", {silent = true})
map('n', '<leader>prj', ":Telescope projects<CR>", {silent = true})
map('n', '<leader>gc', ":lua require('plugins.telescope').my_git_commits()<CR>", {silent = true})
map('n', '<leader>gb', ":lua require('plugins.telescope').my_git_bcommits()<CR>", {silent = true})

-- Git
map('n', '<leader>gg', ":Neogit<CR>", {silent = true})

-- Todo-comments
map('n', '<leader>do', ':TodoTelescope<CR>', {noremap = true, silent = false})

-- Refactoring ruby
map('n', '<leader>ap', ':RAddParameter<CR>', {silent = true})
map('v', '<leader>em', ':RExtractMethod<CR>', {silent = true})

-- Run tests in vim
map('n', '<leader>rn', ':w<CR>:TestNearest<CR>', {silent = true})
map('n', '<leader>rf', ':w<CR>:TestFile<CR>', {silent = true})
map('n', '<leader>rs', ':w<CR>:TestSuite<CR>', {silent = true})
map('n', '<leader>rl', ':w<CR>:TestLast<CR>', {silent = true})
map('n', '<leader>rv', ':w<CR>:TestVisit<CR>', {silent = true})
