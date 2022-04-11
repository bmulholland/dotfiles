require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"dockerfile",
		"graphql",
		"html",
		"http",
		"javascript",
		"json",
		"json5",
		"jsonc",
		"lua",
		"make",
		"python",
		"regex",
		"ruby",
		"svelte",
		"vue",
		"vim",
		"yaml",
	},
	-- Courtesy of https://old.reddit.com/r/neovim/comments/r10llx/the_most_amazing_builtin_feature_nobody_ever/
	highlight = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
	matchup = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			scope_incremental = "<CR>",
			node_incremental = "<TAB>",
			node_decremental = "<S-TAB>",
		},
	},
})
