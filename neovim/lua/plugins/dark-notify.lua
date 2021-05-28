require('dark_notify').run({
	schemes = {
		-- you can use a different colorscheme for each
		dark  = "sonokai",
		light  = "ayu",
	},
	onchange = function(mode)
		if mode == "dark" then
			vim.cmd(':AirlineTheme sonokai')
		else
			vim.cmd(':AirlineTheme ayu')
		end
	end
})
