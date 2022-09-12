require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		-- lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_diagnostic" } } },
		-- branch is too long and I never look at it
		lualine_b = { "diff", { "diagnostics", sources = { "nvim_diagnostic" } } },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = {
			-- Some LSP servers take a while to initialize. This provides a nice
			-- visual indicator to show which clients are ready to use.
			"lsp_progress",
			--"filetype"
		},
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { {
			"filename",
			path = 1,
		} },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
