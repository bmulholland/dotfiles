vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_quit_on_open = 1
-- From https://github.com/crivotz/nv-ide/blob/master/lua/plugins/nvimtree.lua
vim.g.nvim_tree_width = 50
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1 -- "0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_auto_ignore_ft = 'startify'
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
  folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
}
