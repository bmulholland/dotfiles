require("mason").setup()
-- Auto-install servers I use
require("mason-lspconfig").setup({
	ensure_installed = {
		"graphql",
		-- "cucumber_language_server",
		-- Frontend/Vue
		"tsserver",
		"vuels",
		"tailwindcss",
		"html",
		-- Infra as code
		"terraformls",
		-- nvim config
		"sumneko_lua",
	},
})
