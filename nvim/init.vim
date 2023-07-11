
set number
set relativenumber
set autoindent
set mouse=a
set nowrap
set linebreak
set termguicolors
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set scrolloff=8
set wildmenu
set wildignorecase
set wildmode=longest:full,full
set virtualedit=block
set dictionary="/usr/dict/words"
set gdefault "default to global selection when search+replacing
set noautochdir

noremap <Space> <NOP>
let mapleader="\<Space>"

call plug#begin('~/.config/nvim/plugged/')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "improved syntax highlight. :TSInstall to <language_to_install>
Plug 'nekonako/xresources-nvim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'baskerville/vim-sxhkdrc'
Plug 'elkowar/yuck.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'haya14busa/is.vim' " automatically clear search highlight
Plug 'junegunn/fzf'
Plug 'preservim/nerdtree'
Plug 'tikhomirov/vim-glsl'
Plug 'lervag/vimtex' "LaTeX integration
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

" home row
noremap ; l
noremap l k
noremap k j
noremap j h
noremap gk gj
noremap gl gk

" prevent annoying stuff in visual mode
vnoremap < <gv
vnoremap > >gv
vnoremap y myy`y
vnoremap Y myY`y

noremap <Leader>q :q<CR>

" tabs
noremap <Leader>tn :tabnew<CR>:e<Space>

noremap <S-k> :tabprevious<CR>
noremap <S-l> :tabnext<CR>

noremap <C-;> <C-w>l
noremap <C-l> <C-w>k
noremap <C-k> <C-w>j
noremap <C-j> <C-w>h

" copy to clipboard
noremap <C-c> :let @+=@"<CR>


" fast search+replace
nnoremap <Leader>r :%s/
nnoremap <Leader>R :%s///<Left>

vnoremap <Leader>r :s/

" fzf
noremap <Leader>f :FZF<CR>

" nerdtree
noremap <leader>n :NERDTreeFocus<Cr>

" vimtex
let g:vimtex_view_method = 'zathura'



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


let g:yuck_recommended_style = 0

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

" This is pretty interesting if you need to see all the colors that vim can
" use. This is helpful when making or fixing vim color themes or plugins that
" deal with colors. Will add ctermfg=232COLOR in every color
func! g:Colors()
    let num = 255
    while num >= 0
        exec 'hi col'.num.' ctermfg='.num
        exec 'syn match col'.num.' "ctermfg='.num.'COLOR" containedIn=ALL'
        call append(0, 'ctermfg='.num.'COLOR')
        let num = num - 1
    endwhile
endfunc
com! Col call g:Colors()
