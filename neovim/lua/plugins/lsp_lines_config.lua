require("lsp_lines").setup({ virtual_lines = false })
-- Disable virtual_text since it's redundant due to lsp_lines.
-- Actually, I want to keep them and only use lsp lines when I need more text.
-- Otherwise my sense of how many lines things are is all out of whack.
-- vim.diagnostic.config({
-- 	virtual_text = false,
-- })
