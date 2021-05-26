require('settings')
require('settings.keymap')
require('settings.font')
require('settings.plugins')
require('settings.colors')

require('settings.scrolloff-fraction')

require('plugins.telescope')
require('plugins.numbertoggle')

-- Plugin config
local g = vim.g

-- Use patched fonts for status bar
g['airline_powerline_fonts '] = 1
-- Make airline look like powerline
g['airline_theme '] = 'powerlineish'
-- Only show git symbols when they're non-zero
g['airline#extensions#hunks#non_zero_only'] = 1

-- Auto-format on save (Requires configuration for each file type using
-- suggestions from :ALEFixSuggest)
g['ale_fix_on_save '] = 1
-- gems installed via bundle
g['ale_ruby_sorbet_executable'] ="bundle"
g['ale_ruby_rubocop_executable'] ="bundle"
g['ale_ruby_rufo_executable'] ="bundle"
-- NOTE: These commands MUST be installed in nvim-ruby-version@global to be
-- accessible in the vimr $PATH
-- Removed rufo for now; I hope rubocop will work. For any rules I don't see in
-- Rubocop, should probably add them that way so they stay the same for others
g['ale_fixers '] = [[{
   '*': ['remove_trailing_lines', 'trim_whitespace'],
   'ruby': ['rubocop']
   }]]
g['ale_linters '] = [[{
   '*': ['remove_trailing_lines', 'trim_whitespace'],
   'ruby': ['rubocop', 'sorbet', 'solargraph']
   }]]
-- Watch files for changes using watchman
g['ale_ruby_sorbet_enable_watchman '] = 1

-- Run ruby from current project so it can access gems like rubocop
-- TODO: Ideally this would reference the ruby-version and ruby-gemset from pwd
g['ruby_host_prog'] ="rvm 2.7.2@recital-backend do neovim-ruby-host"
-- Load node from nvm
-- g['coc_node_path '] = substitute(system('which node'), '\n', '', '')

-- Configure netrw like NerdTree https://shapeshed.com/vim-netrw/
g['netrw_banner '] = 0
g['netrw_liststyle '] = 3
g['netrw_browse_split '] = 4
g['netrw_altv '] = 1
g['netrw_winsize '] = 25