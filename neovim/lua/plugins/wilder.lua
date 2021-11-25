-- https://github.com/gelguy/wilder.nvim
vim.cmd([[
call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

" only / and ? are enabled by default
call wilder#set_option('modes', ['/', '?', ':'])

" Highlighting
call wilder#set_option('renderer', wilder#popupmenu_renderer({
			\ 'highlighter': wilder#basic_highlighter(),
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
			\   'border': 'Normal',
      \ },
			\ 'border': 'rounded',
			\ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ }))

" Nice icons
call wilder#set_option('pipeline', [ wilder#branch( [ wilder#check({_, x -> empty(x)}), wilder#history(), wilder#result({ 'draw': [{_, x -> ' ' . x}], }), ], wilder#cmdline_pipeline(), wilder#search_pipeline(),), ])

]])
