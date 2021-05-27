-- run the nearest test every time a file is written
vim.cmd([[augroup UltestRunner
    au!
    au BufWritePost * UltestNearest
augroup END]])
