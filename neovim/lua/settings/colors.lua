if vim.fn.has("termguicolors") == 1 then
	-- https://cyfyifanchen.com/neovim-true-color/
	vim.o.termguicolors = true
end

require("ayu").setup({
	-- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
	overrides = {
		-- These are the cursor values from ayu colors
		IlluminatedWordText = { bg = "#EFF0F1" },
		IlluminatedWordRead = { bg = "#EFF0F1" },
		IlluminatedWordWrite = { bg = "#EFF0F1" },
	},
})

vim.cmd("syntax on")

-- Customization of dark theme
vim.g.sonokai_style = "shusia" -- variation inspired by Monokai Pro
vim.g.sonokai_enable_italic = 1
