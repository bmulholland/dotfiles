return { {
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      typos_lsp = {},
    },
  },
}, {
  'williamboman/mason.nvim',
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, { 'typos-lsp' })
  end,
} }
