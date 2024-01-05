return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sorbet = {},
        solargraph = {},
      },
      setup = {
        -- Disable Solargraph lookup of references and definitions; Sorbet does that better
        solargraph = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "solargraph" then
              client.server_capabilities.referencesProvider = false
              client.server_capabilities.definitionProvider = false
            end
          end)
        end,
      },
    },
  },
}
