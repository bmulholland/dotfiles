if vim.fn.has("termguicolors") == 1 then
  -- https://cyfyifanchen.com/neovim-true-color/
  vim.o.termguicolors = true
end

vim.cmd('syntax on')
vim.cmd('colorscheme srcery')
-- TODO: Sync with system dark mode
vim.o.background = 'dark'
