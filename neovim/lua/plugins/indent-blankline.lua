require("indent_blankline").setup({
	char = "¦",
	show_first_indent_level = false,
	use_treesitter = true,
	-- highlights the indent level you're in right now
	show_current_context = true,
	buftype_exclude = { "terminal" },
	filetype_exclude = { "dashboard" },
})
