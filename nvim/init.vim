
set number
set relativenumber
set autoindent
set mouse=a
set smarttab
set nowrap
set linebreak
set termguicolors
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=8
set wildmenu
set wildignorecase
set wildmode=longest:full,full
set virtualedit=block
set dictionary="/usr/dict/words"

call plug#begin('~/.config/nvim/plugged/')
Plug 'tpope/vim-sensible'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nekonako/xresources-nvim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
call plug#end()

" use tab for autocompletion, but only when it makes sense. otherwise insert a
" tab like normal
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

noremap ; l
noremap l k
noremap k j
noremap j h
noremap gk gj
noremap gl gk

noremap <S-k> :tabprevious<CR>
noremap <S-l> :tabnext<CR>

noremap <C-;> <C-w>l
noremap <C-l> <C-w>k
noremap <C-k> <C-w>j
noremap <C-j> <C-w>h

noremap <C-c> :let @+=@"<CR>

" prevent annoying stuff in visual mode
vnoremap < <gv
vnoremap > >gv
vnoremap y myy`y
vnoremap Y myY`y

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" syntastic stuff
syntax enable
filetype plugin indent on

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_quiet_messages = { "level": "warnings", }

"hexokinase stuff
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

"colorscheme
colorscheme xresources

"honestly no idea what this is
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

"word processor
func! WordProcessor()
  map k gk
  map l gl
  set wrap
  setlocal formatoptions=1
  setlocal spell spelllang=en_us  
endfu
com! WP call WordProcessor()

