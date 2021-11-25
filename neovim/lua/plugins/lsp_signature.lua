vim.cmd([[autocmd BufReadPost,FileReadPost lua require "lsp_signature".on_attach()]])
