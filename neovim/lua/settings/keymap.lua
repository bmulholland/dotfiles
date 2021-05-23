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
-- Easily switch between controllers and views using rails.vim's related file functionality
map('n', '<leader>r', ':R<CR>')

-- Navigate between splits
-- Use ctrl-[hjkl] to select the active split
map('n', '<c-k>', ':wincmd k<CR>', { silent = true })
map('n', '<c-j>', ':wincmd j<CR>', { silent = true })
map('n', '<c-h>', ':wincmd h<CR>', { silent = true })
map('n', '<c-l>', ':wincmd l<CR>', { silent = true })

-- Move the splits arround - but sadly couldn't get it working
--map('n', '<c-s-k>', '<C-W>K', { silent = true })
--map('n', '<c-s-j>', '<C-W>J', { silent = true })
--map('n', '<c-s-h>', '<C-W>H', { silent = true })
--map('n', '<c-s-l>', '<C-W>L', { silent = true })

-- Navigate within a file
-- Go to next lint error
map('n', '<leader>e', '<Plug>(ale_next_wrap)')

-- Open plugins
map('n', '<leader>n', ':Vexplore<cr>') -- Open a file explorer

map('n', '<leader>s', ':TagbarToggle<CR>') -- Open tagbar

map('n', '<leader>d', ':Dash<CR>', { silent = true }) -- Look up command in Dash

-- Pretty print JSON
map('n', '<leader>o', ':%!python -m json.tool<CR>')
