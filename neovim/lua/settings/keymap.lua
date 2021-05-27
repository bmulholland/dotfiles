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

-- Navigate between files
-- (From https://wincent.com/wiki/rails.vim_cheatsheet)
-- in a model the "alternate" is the spec and the "related" is the schema
-- in a controller (method) the "alternate" is the spec and the "related" is the view
-- in a view the "alternate" is the spec and the "related" is the controller (method)
-- Easily switch between file and its spec using rails.vim's alternate file functionality
map('n', '<leader>a', ':A<CR>')

-- Move the splits arround - but sadly couldn't get it working
--map('n', '<c-s-k>', '<C-W>K', {silent = true })
--map('n', '<c-s-j>', '<C-W>J', {silent = true })
--map('n', '<c-s-h>', '<C-W>H', {silent = true })
--map('n', '<c-s-l>', '<C-W>L', {silent = true })

-- Navigate within a file
-- Go to next lint error
map('n', '<leader>e', '<Plug>(ale_next_wrap)')

-- Open plugins
map('n', '<leader>t', ":lua require('plugins.telescope').project_files()<CR>", {silent = true})

map('n', '<leader>n', ':NvimTreeToggle<cr>') -- Open a file explorer

map('n', '<leader>d', ':Dash<CR>', {silent = true }) -- Look up command in Dash

-- Pretty print JSON
map('n', '<leader>o', ':%!python -m json.tool<CR>')

-- LSP - Errors, Definitions, etc
map('n', '<leader>,', ':lua vim.lsp.diagnostic.goto_prev()<CR>', {silent = true})
map('n', '<leader>;', ':lua vim.lsp.diagnostic.goto_next()<CR>', {silent = true})
map('n', '<leader>a', ':lua vim.lsp.diagnostic.code_action()<CR>', {silent = true})
map('n', '<leader>d', ':lua vim.lsp.buf.definition()<CR>', {silent = true})
map('n', '<leader>h', ':lua vim.lsp.buf.hover()<CR>', {silent = true})
map('n', '<leader>m', ':lua vim.lsp.buf.rename()<CR>',{silent = true})
map('n', '<leader>rf', ':lua vim.lsp.buf.references()<CR>', {silent = true})
map('n', '<leader>s', ':lua vim.lsp.buf.document_symbol()<CR>', {silent = true})
-- Telescope
-- TODO: Learn these too
-- From https://github.com/crivotz/nv-ide/blob/master/lua/settings/keymap.lua#L41
map('n', '<leader>r', ":lua require('telescope.builtin').live_grep()<CR>", {silent = true})
map('n', '<leader>bb', ":lua require('telescope.builtin').buffers()<CR>", {silent = true})
map('n', '<leader>m', ":lua require('telescope.builtin').marks()<CR>", {silent = true})
map('n', '<leader>e', ":lua require('telescope.builtin').treesitter()<CR>", {silent = true})
map('n', '<leader>l', ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", {silent = true})
map('n', '<leader>p', ":lua require('telescope').extensions.project.project{}<CR>", {silent = true})
map('n', '<leader>c', ":lua require('plugins.telescope').my_git_commits()<CR>", {silent = true})
map('n', '<leader>gg', ":lua require('plugins.telescope').my_git_status()<CR>", {silent = true})
map('n', '<leader>b', ":lua require('plugins.telescope').my_git_bcommits()<CR>", {silent = true})
map('n', '<leader>n', ":lua require('plugins.telescope').my_note()<CR>", {silent = true})
map('n', '<leader>nn', ":e ~/Note/", {silent = false})
map('n', '<leader>gc', ':Octo issue create<CR>', {silent = false})
map('n', '<leader>i', ':Octo issue list<CR>', {silent = false})

