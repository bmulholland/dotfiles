-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.guifont = 'VictorMono Nerd Font:h13'

vim.opt.wrap = true
vim.wo.colorcolumn = '+1'
vim.opt.ignorecase = false

vim.g.lazyvim_ruby_lsp = 'sorbet' -- no solargraph
vim.g.lazyvim_ruby_formatter = 'rubocop'

-- Prepend mise shims to PATH, to load rubocop etc in neovide
vim.env.PATH = vim.env.HOME .. '/.local/share/mise/shims:' .. vim.env.PATH

-- Performance improvements
vim.opt.updatetime = 300
 -- Faster completion and diagnostics