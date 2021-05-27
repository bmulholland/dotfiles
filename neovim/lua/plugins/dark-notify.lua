require('dark_notify').run({
	onchange = function(mode)
		if mode == "dark" then
			vim.cmd(':AirlineTheme base16_gruvbox_dark_hard')
		else
			vim.cmd(':AirlineTheme base16_gruvbox_light_hard')
		end
	end
})
