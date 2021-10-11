-- Shortcuts for global, window, and buffer options
local o = vim.o
local wo = vim.wo
local bo = vim.bo

o.mouse = 'a' -- Enable mouse support

-- Recquired for compe
-- https://github.com/hrsh7th/nvim-compe#prerequisite
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Who wants .swap files??
bo.swapfile = false

-- Search
o.laststatus = 2 -- Always show the status line
o.incsearch = true -- Make searching be incremental (e.g. search as you type)
o.hlsearch = true -- Highlight search matches

o.wildmenu = true -- Improved file path completion when typing vim commands
o.wildmode = "longest,list,full"
-- When searching, ignore files I don't want to open in vim
o.wildignore = [[
*.bak,*.o,*~,*.pyc,*.jpg,*.gif,*.png,tmp,coverage,fixtures,node_modules,vcr_cassettes,storage,sorbet
]]

-- Text wrapping and spacing
o.shiftround = true -- Force the indentation to be correct when shifting
o.tabstop = 2
o.shiftwidth = 2
bo.expandtab = true -- Use spaces instead of tabs
vim.cmd('filetype plugin indent on')

o.textwidth = 80
wo.colorcolumn = "+1"

-- Intuit the indentation of new lines when creating them
bo.smartindent = true

-- Code folding
wo.foldenable = false

-- Text highlighting
o.showmatch = true -- Show the matching brace when a new one is added

-- Splits
o.splitright = true -- More natural split opening position

-- Give option to reload files when they've changed
-- See discussion at:
-- https://github.com/qvacua/vimr/issues/242
-- https://github.com/qvacua/vimr/issues/646
vim.cmd("au FocusGained * checktime")
