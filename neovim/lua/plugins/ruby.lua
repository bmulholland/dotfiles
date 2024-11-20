local lspconfig = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      format_notify = true,
      servers = {
        ruby_lsp = {
          enabled = false,
        },
        sorbet = {
          mason = false,
          cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
        },
        rubocop = {
          mason = false,
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
          root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
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
