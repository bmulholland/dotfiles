require("neoclip").setup({
	enable_persistant_history = true,
	preview = true,
	keys = {
		i = {
			select = "<cr>",
			paste = "<c-p>",
			paste_behind = "<c-k>",
			custom = {},
		},
		n = {
			select = "<cr>",
			paste = "p",
			paste_behind = "P",
			custom = {},
		},
	},
})
