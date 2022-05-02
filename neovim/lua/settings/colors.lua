if vim.fn.has("termguicolors") == 1 then
	-- https://cyfyifanchen.com/neovim-true-color/
	vim.o.termguicolors = true
end

vim.cmd("syntax on")

-- Customization of dark theme
vim.g.sonokai_style = "shusia" -- variation inspired by Monokai Pro
vim.g.sonokai_enable_italic = 1
