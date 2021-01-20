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
  " LESS support
  call dein#add('groenewege/vim-less')
  " HAML support
  call dein#add('tpope/vim-haml')
  " Javscript support
  call dein#add('pangloss/vim-javascript')
  " Support for Vue syntax and indentation
  call dein#add('leafOfTree/vim-vue-plugin')
  " Ruby helpers
  call dein#add('vim-ruby/vim-ruby')
  " Rails helpers
  call dein#add('tpope/vim-rails')
  " Cucumber support
  call dein#add('tpope/vim-cucumber', {'rtp': 'vim/'})
  " Terraform support
  call dein#add('hashivim/vim-terraform')
  " Auto add end keyword in ruby
  call dein#add('tpope/vim-endwise')
  " Nerdtree for project navigation
  call dein#add('scrooloose/nerdtree')
  " Syntax checks
  call dein#add('w0rp/ale')
  " Autocorrection and formatting for Ruby
  call dein#add('ruby-formatter/rufo-vim')
  " Easily browse tags in current file
  call dein#add('majutsushi/tagbar')
  " Git helpers
  call dein#add('tpope/vim-fugitive')
  " Fuzzy file search
  call dein#add('wincent/command-t')
  " Autocomplete
  call dein#add('neoclide/coc.nvim', {'branch': 'release'})
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
  call dein#add('justinmk/molokai')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" 

" CONFIGURATION
let mapleader = " "
" Use sh instead of zsh, because vim fucks up the zsh config in a way that
" doesn't load the rvm setup properly. Somehow it makes it so it's impossible
" to install the gems I need to run lessc, which is used by syntastic to run
" syntax checks on less files.
" Hmm, maybe it works better on neovim? Comment out to see.
" set shell=/bin/sh

" Pretty colours
syntax enable
" made_of_code
set background=dark
colorscheme molokai
" https://cyfyifanchen.com/neovim-true-color/
set termguicolors

" The default comment color is impossible to read
hi Comment         guifg=#A8A491

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
let g:ale_fixers = {'ruby': ['sorbet', 'rubocop', 'rufo', 'standardrb', 'trim_whitespace']}
let g:ale_fix_on_save = 1

" Force the indentation to be correct when shifting
set shiftround

" Backspace through lines too
set backspace=indent,eol,start

" Improved file path completion when typing vim commands
set wildmenu
set wildmode=longest,list,full
" Ignore files I don't want to open in vim
set wildignore+=*.bak,*.o,*~,*.pyc,*.jpg,*.gif,*.png,*/tmp/*,*/coverage/*,*/fixtures/*,*/node_modules/*,*/cache/*,*/spec/vcr_cassettes/*,*/storage/*

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
nmap <leader>n :NERDTree<cr>

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

" Special exceptions for large project
augroup LargeProjects
  autocmd!
  " Whitespace-only changes complicate PRs
  autocmd BufNewFile,BufRead ~/dev/coupa_development/**/* autocmd! TrailingSpaces
augroup END

" Run both ESLint and StyleLint in jsx files
augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}