require('dark_notify').run({
	schemes = {
		-- you can use a different colorscheme for each
		dark  = "sonokai",
		light  = "ayu",
		onchange = function(mode)
			if mode == "dark" then
				require'lualine'.setup { options = { theme = 'auto'}}
			else
				require'lualine'.setup { options = { theme = 'ayu'}}
			end
		end
	},
})
