" Vundle!
set nocompatible               " be iMproved
filetype off                   " required!

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/bmulholland/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/bmulholland/.cache/dein')
  call dein#begin('/Users/bmulholland/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/bmulholland/.cache/dein/repos/github.com/Shougo/dein.vim')

  " My installed plugins
  " syntax highlighting for JSON with comments, especially useful for coc.vim
  " config
  call dein#add('kevinoid/vim-jsonc')
  " Javscript support
  call dein#add('pangloss/vim-javascript')
  " Support for Vue syntax and indentation
  call dein#add('leafOfTree/vim-vue-plugin')
  " Ruby helpers
  call dein#add('vim-ruby/vim-ruby')
  " Helper methods to refactor Ruby
  call dein#add('ecomba/vim-ruby-refactoring')
  " Auto add end keyword in ruby
  call dein#add('tpope/vim-endwise')
  " apid toggling between the two different styles of ruby blocks, namely do/end and brackets {}
  call dein#add('jgdavey/vim-blockle')
  " Rails helpers
  call dein#add('tpope/vim-rails')
  " Improved matchit; use % to navigate between paids of brackets, if/end, etc
  call dein#add('andymass/vim-matchup')
  " Cucumber support
  call dein#add('tpope/vim-cucumber', {'rtp': 'vim/'})
  " Terraform support
  call dein#add('hashivim/vim-terraform')
  " Nerdtree for project navigation
  " call dein#add('scrooloose/nerdtree')
  " Trying out vinegar as a lightweight replacement for nerdtree
  call dein#add('tpope/vim-vinegar')
  " Syntax checks
  call dein#add('w0rp/ale')
  " Easily browse tags in current file
  call dein#add('majutsushi/tagbar')
  " Git helpers
  call dein#add('tpope/vim-fugitive')
  " Fuzzy file search
  call dein#add('wincent/command-t')
  " Autocomplete
  call dein#add('neoclide/coc.nvim', { 'merged': 0 })
  " Add a gutter that shows git additions/deletions/etc
  call dein#add('airblade/vim-gitgutter')
  " Pretty status line
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  " Documentation lookups
  call dein#add('rizzatti/dash.vim')
  " Easily change surrounding tags (e.g. in html)
  call dein#add('tpope/vim-surround')
  " My theme
  call dein#add('srcery-colors/srcery-vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" CONFIGURATION
let mapleader = " "

" Pretty colours
syntax enable
" made_of_code
set background=dark
" https://cyfyifanchen.com/neovim-true-color/
set termguicolors

colorscheme srcery

" Pretty fonts, patched for pwoerline, downloaded from: https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/VictorMono/Regular/complete/Victor%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
if !has('gui_vimr')
  " vimr uses a configured font and throws an error if you use guifont instead
  set guifont="VictorMono\ Nerd\ Font\ Mono:h12"
endif

" Use patched fonts for status bar
let g:airline_powerline_fonts = 1

" Make airline look like powerline
let g:airline_theme = 'powerlineish'

" Only show git symbols when they're non-zero
let airline#extensions#hunks#non_zero_only = 1

" Always show the status line
set laststatus=2

" Let CommandT use the full window height when searching files
let g:CommandTMaxHeight=0
" Use git ls-files for fast searching of git projects
" let g:CommandTFileScanner='git' " This is only necessary when working with v. large projects

" Indentation
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" Max line length
set textwidth=80
" Wrap at word boundaries
set formatoptions+=t
" Auto-format on save (Requires configuration for each file type using
" suggestions from :ALEFixSuggest)
" NOTE: These commands MUST be installed in nvim-ruby-version@global to be
" accessible in the vimr $PATH
" Removed rufo for now; I hope rubocop will work. For any rules I don't see in
" Rubocop, should probably add them that way so they stay the same for others
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop']
\   }
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop', 'sorbet', 'solargraph']
\   }
let g:ale_fix_on_save = 1
" gems installed via bundle
let g:ale_ruby_sorbet_executable="bundle"
let g:ale_ruby_rubocop_executable="bundle"
let g:ale_ruby_rufo_executable="bundle"
" Watch files for changes using watchman
let g:ale_ruby_sorbet_enable_watchman = 1
" When run in vimr, ale tries to run in zsh shell, but that fails.
" When run in console, nvim uses sh, which works fine.
" So just force ale to always use sh.
" let g:ale_shell="/bin/sh"

" Run ruby from current project so it can access gems like rubocop
" TODO: Ideally this would reference the ruby-version and ruby-gemset from pwd
let g:ruby_host_prog="rvm 2.7.2@recital-backend do neovim-ruby-host"
" Load node from nvm
let g:coc_node_path = substitute(system('which node'), '\n', '', '')

" Force the indentation to be correct when shifting
set shiftround

" Backspace through lines too
set backspace=indent,eol,start

" Improved file path completion when typing vim commands
set wildmenu
set wildmode=longest,list,full
" Ignore files I don't want to open in vim
set wildignore+=*.bak,*.o,*~,*.pyc,*.jpg,*.gif,*.png,*/tmp/*,*/coverage/*,*/fixtures/*,*/node_modules/*,*/cache/*,*/spec/vcr_cassettes/*,*/storage/*,*/sorbet/*

" Make searching be incremental (e.g. search as you type)
set incsearch

" Show the matching brace when a new one is added
set showmatch

" More natural split opening position
set splitright

" MAPPINGS

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Go to next lint error
nmap <leader>e <Plug>(ale_next_wrap)

" Move the splits arround!
" Doesn't work :(
"nmap <silent> <c-s-k> <C-W>K
"nmap <silent> <c-s-j> <C-W>J
"nmap <silent> <c-s-h> <C-W>H
"nmap <silent> <c-s-l> <C-W>L

" Open Nerd Tree
" nmap <leader>n :NERDTree<cr>
" Configure netrw like NerdTree https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
nmap <leader>n :Vexplore<cr>

" Open tagbar
nmap <leader>s :TagbarToggle<CR>

" Close current buffer
nmap <leader>q :bd<CR>

" Look up command in dash
nmap <silent> <leader>d :Dash<CR>

" Save file
nmap <leader>w :w<CR>
nmap <leader><Space> :w<CR>

" Pretty print JSON
nmap <leader>o :%!python -m json.tool<CR>

" (From https://wincent.com/wiki/rails.vim_cheatsheet)
" in a model the "alternate" is the spec and the "related" is the schema
" in a controller (method) the "alternate" is the spec and the "related" is the view
" in a view the "alternate" is the spec and the "related" is the controller (method)
" Easily switch between file and its spec using rails.vim's alternate file functionality
nmap <leader>a :A<CR>
" Easily switch between controllers and views using rails.vim's related file functionality
nmap <leader>r :R<CR>

" Auto-reload the CommandT file list
augroup AutoReloadCommandT
  autocmd!
  autocmd FocusGained * CommandTFlush
  autocmd BufWritePost * CommandTFlush
augroup END

" When pasting, don't replace the paste buffer with what was overwritten
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
