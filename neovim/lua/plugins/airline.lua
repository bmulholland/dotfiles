-- Use patched fonts for non-standard characters
vim.g.airline_powerline_fonts = 1
-- Only show git symbols when they're non-zero
vim.cmd('let airline#extensions#hunks#non_zero_only = 1')
vim.cmd("let g:airline_extensions = ['branch', 'default', 'fugitiveline', 'gutentags', 'nvimlsp']")
-- Try some caching for performance
vim.g.airline_highlighting_cache = 1
if vim.o.background == 'dark' then
	vim.g.airline_theme = "sonokai"
else
	vim.g.airline_theme = "ayu"
end
