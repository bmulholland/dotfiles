return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          init_options = {
            hostInfo = "neovim",
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "anything", -- makes it look in node_modules
                languages = {
                  "typescript",
                  "vue",
                },
              },
            },
          },
          filetypes = {
            "javascript",
            "typescript",
            "vue",
          },
        },
      },
    },
  },
}
