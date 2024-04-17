return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        eslint = function(_, opts)
          opts.filetypes = { "javascript", "typescript", "vue", "json", "jsonc", "json5" }
        end,
      },
    },
  },
}
