local nvim_lsp = require('lspconfig')

require('lspkind').init()

-- Diagnostics symbols for display in the sign column.
vim.cmd('sign define LspDiagnosticsSignError text=')
vim.cmd('sign define LspDiagnosticsSignWarning text=')
vim.cmd('sign define LspDiagnosticsSignInformation text=')
vim.cmd('sign define LspDiagnosticsSignHint text=')
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

-- Auto format on save
vim.cmd [[autocmd BufWritePre *.rb,*.rake,*.json,*.js,*.ts,*.vue,*.lua lua vim.lsp.buf.formatting_sync(null, 1000)]]

local lsp_installer = require("nvim-lsp-installer")

-- Install servesr I use
local lsp_installer = require("nvim-lsp-installer")
local servers = {
	"solargraph",
	-- Frontend/Vue
	"tsserver",
	"vuels",
	"tailwindcss",
	"html",
	-- nvim config
	"sumneko_lua",
}

for _, name in pairs(servers) do
	local ok, server = lsp_installer.get_server(name)
	-- Check that the server is supported in nvim-lsp-installer
	if ok then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end

lsp_installer.on_server_ready(function(server)
    local opts = {}

	  opts.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- (optional) Customize the options passed to the server
    if server.name == "tsserver" then
			-- Leave the formatting to ESLint_d via null_ls
			opts.on_attach = function(client)
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
			end
		end

    if server.name == "solargraph" then
			opts.autoformat = true -- WARNING: experimental
		end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)

-- Ruby
require'lspconfig'.sorbet.setup{
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

-- ESLint
local null_ls = require("null-ls")

null_ls.config({
	sources = { null_ls.builtins.formatting.eslint_d }
})

require("lspconfig")["null-ls"].setup {
	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
