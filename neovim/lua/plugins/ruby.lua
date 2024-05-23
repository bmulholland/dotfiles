return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ruby",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sorbet = {
          cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
        },
        rubocop = {
          cmd = { "bundle", "exec", "rubocop", "--lsp" },
        },
      },
    },
  },
  {
    "suketa/nvim-dap-ruby",
    config = function()
      require("dap-ruby").setup()
    end,
  },
  {
    "olimorris/neotest-rspec",
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "suketa/nvim-dap-ruby",
      config = function()
        require("dap-ruby").setup()
      end,
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "olimorris/neotest-rspec",
    },
    opts = {
      adapters = {
        ["neotest-rspec"] = {
          rspec_cmd = function()
            return vim.tbl_extend("force", {
              "bundle",
              "exec",
              "rspec",
            })
          end,
        },
      },
    },
  },
}
