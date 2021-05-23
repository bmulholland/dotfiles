local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function(use)
  -- Packer can manage itself as an optional plugin
  use 'wbthomason/packer.nvim'

  -- syntax highlighting for JSON with comments, especially useful for coc.vim
  -- config
  use 'kevinoid/vim-jsonc'
  -- Javscript support
  use 'pangloss/vim-javascript'
  -- Support for Vue syntax and indentation
  use 'leafOfTree/vim-vue-plugin'
  -- Ruby helpers
  use 'vim-ruby/vim-ruby'
  -- Helper methods to refactor Ruby
  use 'ecomba/vim-ruby-refactoring'
  -- Auto add end keyword in ruby
  use 'tpope/vim-endwise'
  -- apid toggling between the two different styles of ruby blocks, namely do/end and brackets {}
  use 'jgdavey/vim-blockle'
  -- Rails helpers
  use 'tpope/vim-rails'
  -- Improved matchit; use % to navigate between paids of brackets, if/end, etc
  use 'andymass/vim-matchup'
  -- Terraform support
  use 'hashivim/vim-terraform'
  -- Trying out vinegar as a lightweight replacement for nerdtree
  use 'tpope/vim-vinegar'
  -- Syntax checks
  use 'w0rp/ale'
  -- Easily browse tags in current file
  use 'majutsushi/tagbar'
  -- Git helpers
  use 'tpope/vim-fugitive'
  -- Fuzzy file search
  use 'wincent/command-t'
  -- Autocomplete
  use {'neoclide/coc.nvim',  merged = 0 }
  -- Add a gutter that shows git additions/deletions/etc
  use 'airblade/vim-gitgutter'
  -- Pretty status line
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  -- Documentation lookups
  use 'rizzatti/dash.vim'
  -- Easily change surrounding tags (e.g. in html)
  use 'tpope/vim-surround'
  -- My theme
  use 'srcery-colors/srcery-vim'
  -- Show guides for indent lines
  use 'Yggdroot/indentLine'
end)
