return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          -- Takeover mode https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
        },
        eslint = {},
      },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            elseif client.name == "volar" then
              client.server_capabilities.documentFormatting = false
              -- client.server_capabilities.documentFeatures.documentFormatting = false
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["vue"] = { { "eslint" } },
      },
    },
  },
}
