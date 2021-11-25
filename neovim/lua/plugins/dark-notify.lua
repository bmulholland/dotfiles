require("dark_notify").run({
	schemes = {
		dark = "sonokai",
		light = "ayu",
		onchange = function(mode)
			if mode == "dark" then
				require("lualine").setup({ options = { theme = "sonokai" } })
			else
				require("lualine").setup({ options = { theme = "ayu" } })
			end
		end,
	},
})
