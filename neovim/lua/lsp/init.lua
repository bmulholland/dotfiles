local nvim_lsp = require('lspconfig')

require('lspkind').init()

-- Diagnostics symbols for display in the sign column.
vim.cmd('sign define LspDiagnosticsSignError text=')
vim.cmd('sign define LspDiagnosticsSignWarning text=')
vim.cmd('sign define LspDiagnosticsSignInformation text=')
vim.cmd('sign define LspDiagnosticsSignHint text=')
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

-- Auto format on save
vim.cmd [[autocmd BufWritePre *.rb,*.rake,*.json,*.js,*.ts,*.vue lua vim.lsp.buf.formatting_sync(null, 1000)]]

-- Ruby
require'lspconfig'.solargraph.setup{
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require'lspconfig'.sorbet.setup{
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

-- Frontend/Vue
require'lspconfig'.tsserver.setup{
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	-- Leave the formatting to ESLint_d via null_ls
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
}
require'lspconfig'.vuels.setup{
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

-- ESLint
local null_ls = require("null-ls")

local sources = { null_ls.builtins.formatting.eslint_d }

null_ls.config({ sources = sources })

require("lspconfig")["null-ls"].setup {}
