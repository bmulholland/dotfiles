if vim.fn.has("termguicolors") == 1 then
  -- https://cyfyifanchen.com/neovim-true-color/
  vim.o.termguicolors = true
end

vim.cmd('syntax on')
vim.g.gruvbox_italic = true
vim.g.gruvbox_contrast_light="hard"
vim.g.gruvbox_contrast_dark="hard"
-- This syncs with dark mode using dark-notify
vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')
