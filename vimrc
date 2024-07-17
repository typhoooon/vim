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
set expandtab

set scrolloff=5

set wrap
set tw=0

"restore cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"set <LEADER> as <SPACE>
let mapleader=" "

"split
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:split<CR>
map sk :set splitright<CR>:split<CR>
"switch plates
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
"adjust plate
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

"for faster navigate
noremap <C-j> J
map J 5j
map K 5k

map tx :r !figlet 

nmap Y "+y
"map Y :call system("xclip -selection clipboard", @")<CR>

call plug#begin('~/.vim/plugged')
"appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'jacoborus/tender.vim'
Plug 'Yggdroot/indentLine'
"auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-bufferline'

"markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()}, 'for': ['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'}
Plug 'vimwiki/vimwiki'

"latex
Plug 'lervag/vimtex'

"start menu
Plug 'mhinz/vim-startify'

Plug 'leafOfTree/vim-matchtag'

Plug 'lilydjwg/fcitx.vim'

Plug 'eluum/vim-autopair'

Plug 'ryanoasis/vim-devicons'

"Plug 'neoclide/coc-snippets'
call plug#end()

" Dress up my vim
map <LEADER>c1 :set background=dark<CR>:colorscheme snazzy<CR>:AirlineTheme base16_dracula<CR>
map <LEADER>c2 :set background=light<CR>:colorscheme ayu<CR>:AirlineTheme ayu_light<CR>
map <LEADER>c3 :set background=light<CR>:colorscheme tender<CR>:AirlineTheme tender<CR>
map <LEADER>c4 :set background=light<CR>:colorscheme gruvbox<CR>:AirlineTheme gruvbox<CR>
map <LEADER>c5 :set background=dark<CR>:colorscheme gruvbox<CR>:AirlineTheme gruvbox<CR>


set termguicolors
let ayucolor="light"
"opaque
let g:SnazzyTransparent = 1
color snazzy
let g:airline_theme='base16_dracula'


"indentLine
"let g:indentLine_setColors = 1
"let g:indentLine_color_term = 15
let g:indentLine_color_gui = '#666666'
" indentLine will change it to 2 makes me confuse
let g:indentLine_conceallevel = 0

"insert
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"coc
"<C-Y> select
"<C-N> next
"<C-P> previous
set hidden
set updatetime=100
set shortmess+=c

set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


"fcitx
"let g:fcitx5_remote = 1
set ttimeoutlen =100

"markdown
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = '/usr/bin/firefox'
map sm :MarkdownPreview<CR>
map sn :MarkdownPreviewStop<CR>

"latex
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_latexmk_engines = {'_': 'lualatex'}

" To prevent conceal in LaTeX files
"let g:tex_conceal = ''
" To prevent conceal in any file
set conceallevel=0

"select all and copy
map <C-A> ggVG"+y

"compile C
"nnoremap <C-S> :wa<CR>:!g++ % -o /tmp/a.out && /tmp/a.out<CR>

" Compile function
map <C-S> :call Compile()<CR>
func! Compile()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc

