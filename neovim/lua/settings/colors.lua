if vim.fn.has("termguicolors") == 1 then
  -- https://cyfyifanchen.com/neovim-true-color/
  vim.o.termguicolors = true
end

vim.cmd('syntax on')
vim.g.gruvbox_italic = true
vim.g.gruvbox_contrast_light="hard"
vim.g.gruvbox_contrast_dark="hard"
-- TODO: Sync with system dark mode
vim.o.background = 'dark'
vim.cmd('colorscheme gruvbox')
