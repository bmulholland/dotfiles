local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- From https://github.com/hrsh7th/nvim-compe#how-to-use-lsp-snippet
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- Diagnostics symbols for display in the sign column.
vim.cmd('sign define LspDiagnosticsSignError text=')
vim.cmd('sign define LspDiagnosticsSignWarning text=')
vim.cmd('sign define LspDiagnosticsSignInformation text=')
vim.cmd('sign define LspDiagnosticsSignHint text=')
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

-- Ruby
require'lspconfig'.solargraph.setup{
  capabilities = capabilities,
}
require'lspconfig'.sorbet.setup{}

-- Frontend/Vue
require'lspconfig'.tsserver.setup{
}
require'lspconfig'.vuels.setup{
}

-- Auto format on save
vim.cmd [[autocmd BufWritePre *.rb,*.rake,*.json,*.js,*.ts,*.vue lua vim.lsp.buf.formatting_sync(nil, 500)]]
