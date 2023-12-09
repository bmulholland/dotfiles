return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          -- Takeover mode https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
        },
      },
      setup = {
        volar = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            -- Don't use volar for formatting
            if client.name == "volar" then
              client.server_capabilities.documentFormatting = false
              -- client.server_capabilities.documentFeatures.documentFormatting = false
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
