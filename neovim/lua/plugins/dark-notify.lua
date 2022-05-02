local dark_notify = require("dark_notify")

dark_notify.run({
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

-- Avoid flashing the wrong colour at startup:
-- https://github.com/cormacrelf/dark-notify/issues/3#issuecomment-1074682252
dark_notify.update()
