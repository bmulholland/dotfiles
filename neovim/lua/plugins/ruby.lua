return { {
  'neovim/nvim-lspconfig',
  opts = {
    format_notify = true,
    servers = {
      sorbet = {
        mason = false,
        cmd = { 'bundle', 'exec', 'srb', 'tc', '--lsp' },
        -- Deferred require so lspconfig is only loaded after lazy has set it up,
        -- not at spec-file parse time.
        root_dir = function(fname)
          return require('lspconfig').util.root_pattern('Gemfile', '.git', '.')(fname)
        end,
      },
      rubocop = {
        mason = false,
        cmd = { 'bundle', 'exec', 'rubocop', '--lsp' },
        filetypes = { 'ruby' },
        root_dir = function(fname)
          return require('lspconfig').util.root_pattern('Gemfile', '.git', '.')(fname)
        end,
      },
    },
  },
} }
