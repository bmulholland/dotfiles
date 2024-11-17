return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruby_lsp = {
          enabled = false,
        },
        sorbet = {
          cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
        },
        rubocop = {
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
        },
      },
    },
  },
  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters = {
  --       rubocop = {
  --         command = "bundle exec rubocop --lsp",
  --       },
  --     },
  --   },
  -- },
}
