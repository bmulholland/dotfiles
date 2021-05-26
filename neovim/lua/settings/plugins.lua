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

  -- Syntax checks
  use 'w0rp/ale'

  use 'folke/todo-comments.nvim' -- Highlight TODOs

  use 'tpope/vim-surround' -- Easily change surrounding tags (e.g. in html)

  -- syntax highlighting for JSON with comments, especially useful for coc.vim
  -- config
  use 'kevinoid/vim-jsonc'
  -- Javscript support
  use 'pangloss/vim-javascript'
  -- Support for Vue syntax and indentation
  use 'leafOfTree/vim-vue-plugin'

  -- Ruby helpers
  use 'vim-ruby/vim-ruby'
  use 'ecomba/vim-ruby-refactoring' -- Helper methods to refactor Ruby
  use 'tpope/vim-endwise' -- Auto add end keyword in ruby
  use 'jgdavey/vim-blockle' -- toggle between do/end and {} ruby block styles
  use 'tpope/vim-rails' -- Rails helpers

  use 'hashivim/vim-terraform' -- Terraform support

  -- Autocomplete
  use {'neoclide/coc.nvim',  merged = 0 }

  -- Fuzzy file search
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope-project.nvim'
  use 'fhill2/telescope-ultisnips.nvim'
  use { 'pwntester/octo.nvim', requires = {{'nvim-lua/plenary.nvim'}, {'nvim-lua/popup.nvim'}} }

  use 'kyazdani42/nvim-tree.lua' -- File Explorer

  use 'rizzatti/dash.vim' -- Documentation lookups

  -- Git
  use 'tpope/vim-fugitive' -- Git helper commands
  use { 'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} } -- Add a gutter that shows git additions/deletions/etc

  -- File and tag navigation
  use 'andymass/vim-matchup' -- Improved matchit; use % to navigate between paids of brackets, if/end, etc
  use 'majutsushi/tagbar' -- Easily browse tags in current file
  use 'ludovicchabant/vim-gutentags' -- (re)generate tag files as you work

  -- Vim UI stuff
  use 'kyazdani42/nvim-web-devicons' -- Nicer icons
  use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }

  -- Pretty status line
  use 'famiu/feline.nvim'

  use 'jeffkreeftmeijer/vim-numbertoggle' -- absolute and relative line numbers

  -- Color theme
  use 'srcery-colors/srcery-vim'
end)
