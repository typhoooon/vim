"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/
"

set nocompatible

"set autoindent
"set cindent

set showcmd
set wildmenu
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
set mouse=a
set encoding=utf-8

set clipboard=unnamed
"set clipboard=unnamedplus

syntax enable 
syntax on

set nu
set relativenumber
set ruler

set tabstop=4
set softtabstop=4
set shiftwidth=4
set cursorline
"replace all tab with space
"set expandtab
set scrolloff=5

set wrap
set tw=0

"restore cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"set <LEADER> as <SPACE>
let mapleader=" "

map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:split<CR>
map sk :set splitright<CR>:split<CR>

map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map tx :r !figlet 


call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'

"auto complete
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

"markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()}, 'for': ['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'}
Plug 'vimwiki/vimwiki'

call plug#end()

"insert
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"coc
"inoremap <silent><expr><tab> coc#refresh()


"inoremap <silent><expr> <TAB>
"	\coc#pum#visible() ? coc#pum#next(1) :
"	\CheckBackSpace() ? \<Tab>" :
"	\coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible ? coc#pum#prev(1) : \<C-h>"
"
"if has('nvim')
"	inoremap <silent><expr> <c-space> coc#refresh()
"else
"	inoremap <silent><expr> <c-@> coc#refresh()
"endif


"markdown
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = '/usr/bin/firefox'

map sm :MarkdownPreview<CR>
map sn :MarkdownPreviewStop<CR>


set termguicolors

"opaque
"let g:SnazzyTransparent = 1

color snazzy
let g:airline_theme='base16_dracula'
