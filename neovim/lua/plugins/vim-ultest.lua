-- run the nearest test every time a file is written
-- There's too much warning text for this to be useful; need to solve that first
vim.cmd([[augroup UltestRunner
    au!
    au BufWritePost * UltestNearest
augroup END]])
