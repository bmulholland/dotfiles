return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "vue" } },
  },

  -- Add LSP servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {},
        vtsls = {},
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      table.insert(opts.servers.vtsls.filetypes, "vue")
      LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
        {
          name = "@vue/typescript-plugin",
          location = "anything", -- makes it look in node_modules
          languages = { "vue" },
          configNamespace = "typescript",
          enableForWorkspaceTypeScriptVersions = true,
        },
      })
    end,
  },
}
