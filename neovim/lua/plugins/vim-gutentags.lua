-- From https://github.com/crivotz/nv-ide/blob/04ed331d36491a0174d300595e62cf76f2d84e6b/lua/plugins/vim-gutentags.lua
vim.cmd('set tags+=tags,.git/tags')
vim.g.gutentags_enabled = 1
vim.g.gutentags_generate_on_missing = 1
vim.g.gutentags_generate_on_write = 1
vim.g.gutentags_resolve_symlinks = 1
vim.g.gutentags_ctags_tagfile = '.git/tags'
vim.g.gutentags_project_root = { '.git' }
vim.g.gutentags_ctags_extra_args = { '--fields=+l' }
vim.g.gutentags_add_default_project_roots = 0
vim.g.gutentags_ctags_executable_ruby = 'ripper-tags'
vim.g.gutentags_ctags_extra_args = { '--ignore-unsupported-options', '--recursive' }
