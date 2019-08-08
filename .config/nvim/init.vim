""" Tabs #tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2
""" Leader #leader
let g:mapleader='\\'
"" Format Options #format-options
set formatoptions=tcrq
set textwidth=80
"" Libraries
call plug#begin()
  Plug 'sbdchd/neoformat'
  Plug 'flowtype/vim-flow'
  Plug 'w0rp/ale'
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript'
  Plug 'sheerun/vim-polyglot'
  Plug 'itchyny/lightline.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-surround'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set number
""" Tabs #tabs
" - Two spaces wide
set tabstop=2
set softtabstop=2
" - Expand them all
set expandtab
" - Indent by 2 spaces by default
set shiftwidth=2
"" Format Options #format-options
set formatoptions=tcrq
set textwidth=80

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
  autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx undojoin | Neoformat prettier
augroup END

let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
 
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:ale_fix_on_save = 1

"" Toggle NerdTree with Ctrl_N
map <C-n> :NERDTreeToggle<CR>

"" Setup colorschemes
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
" let g:airline_theme='onehalfdark'
" lightline
let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ }

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
