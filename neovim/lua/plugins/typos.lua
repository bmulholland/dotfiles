return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typos_lsp = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "typos-lsp" })
    end,
  },
}
