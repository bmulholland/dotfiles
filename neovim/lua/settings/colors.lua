if vim.fn.has("termguicolors") == 1 then
	-- https://cyfyifanchen.com/neovim-true-color/
	vim.o.termguicolors = true
end

vim.cmd("syntax on")

-- Customization of dark theme
vim.g.sonokai_style = "shusia" -- variation inspired by Monokai Pro
vim.g.sonokai_enable_italic = 1

-- Customization of light theme
vim.g.ayu_italic_comment = 1
vim.g.ayu_sign_contrast = 1 -- SignColumn and FoldColumn will have a higher contrast

-- These sync with dark mode using dark-notify, toggling between dark (sonokai) and light (ayu) mode
-- Gotta default to something; use dark so I don't get blinded at night
-- It shiould only flash this style before dark-notify sets the correct one
vim.o.background = "dark"
vim.cmd("colorscheme sonokai")
