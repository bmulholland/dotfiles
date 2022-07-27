-- -- From https://github.com/crivotz/nv-ide/blob/e4e2c8a45eab9729a2ff119adbc0b43c36db3e8f/lua/plugins/lspkind.lua
-- require("lspkind").init({
-- 	with_text = true,
-- 	symbol_map = {
-- 		Text = "",
-- 		Method = "ƒ",
-- 		Function = "",
-- 		Constructor = "",
-- 		Variable = "",
-- 		Class = "",
-- 		Interface = "ﰮ",
-- 		Module = "",
-- 		Property = "",
-- 		Unit = "",
-- 		Value = "",
-- 		Enum = "了",
-- 		Keyword = "",
-- 		Snippet = "﬌",
-- 		Color = "",
-- 		File = "",
-- 		Folder = "",
-- 		EnumMember = "",
-- 		Constant = "",
-- 		Struct = "",
-- 	},
-- })
--
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
require("lsp-format").setup({ sync = true })

-- From https://github.com/hrsh7th/nvim-compe#how-to-use-lsp-snippet
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

-- Diagnostics symbols for display in the sign column.
vim.cmd("sign define LspDiagnosticsSignError text=")
vim.cmd("sign define LspDiagnosticsSignWarning text=")
vim.cmd("sign define LspDiagnosticsSignInformation text=")
vim.cmd("sign define LspDiagnosticsSignHint text=")
vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")

-- Auto-install servers I use
require("nvim-lsp-installer").setup({
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

local lspconfig = require("lspconfig")

lspconfig.graphql.setup({
	capabilities = capabilities,
	on_attach = require("lsp-format").on_attach,
})
-- lspconfig.cucumber_language_server.setup({
-- 	capabilities = capabilities,
-- 	on_attach = require("lsp-format").on_attach,
-- })
lspconfig.html.setup({
	capabilities = capabilities,
	on_attach = require("lsp-format").on_attach,
})
lspconfig.terraformls.setup({
	capabilities = capabilities,
	on_attach = require("lsp-format").on_attach,
})
lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	on_attach = require("lsp-format").on_attach,
})

lspconfig.tsserver.setup({
	capabilities = capabilities,
	-- Leave the formatting to ESLint_d via null_ls
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
})
-- vue is formatted via eslint_d via null-ls, below; no format attachment
-- needed
lspconfig.vuels.setup({ capabilities = capabilities })
-- tailwind is formatted via esllint plugin; no format attachment needed
lspconfig.tailwindcss.setup({ capabilities = capabilities })

-- Ruby
lspconfig.sorbet.setup({
	capabilities = capabilities,
})
lspconfig.solargraph.setup({
	capabilities = capabilities,
	on_attach = require("lsp-format").on_attach,
	settings = {
		solargraph = {
			diagnostics = true,
			formatting = true,
			-- autoformat = true,-- WARNING: experimental
			-- useBundler = true,
			-- bundlerPath = "/Users/bmulholland/.rvm/gems/ruby-2.7.2@recital-backend/bin/bundle"
		},
	},
})

-- JS formatting with a daemonized eslint
local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.diagnostics.eslint_d,
	null_ls.builtins.formatting.eslint_d,
	null_ls.builtins.formatting.stylua,
}

null_ls.setup({
	sources = sources,
	on_attach = function(client)
		require("lsp-format").on_attach(client)
		-- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
		-- the resolved capabilities of the eslint server ourselves!
		client.resolved_capabilities.document_formatting = true
		client.resolved_capabilities.document_range_formatting = true
	end,
})
