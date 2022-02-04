
set number
set relativenumber
set autoindent
set mouse=a
set smarttab
set wrap
set linebreak
syntax enable

set termguicolors

set tabstop=4
set shiftwidth=4
set noexpandtab

noremap ; l
noremap l k
noremap k j
noremap j h

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

noremap <C-c> :let @+=@"<CR>
noremap <C-v> "+p

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

call plug#begin('~/.config/nvim/plugged/')
Plug 'tpope/vim-sensible'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nekonako/xresources-nvim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
call plug#end()

let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

colorscheme xresources

hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

func! WordProcessor()
  map k gj
  map l gk
  setlocal formatoptions=1
  setlocal spell spelllang=en_us  
endfu
com! WP call WordProcessor()

