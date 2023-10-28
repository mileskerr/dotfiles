
lua << EOF
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.autoindent = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.dictionary = "/usr/dict/words"
vim.opt.mouse = "a"
vim.opt.gdefault = true
vim.opt.autochdir = false

EOF

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
Plug 'neovim/nvim-lspconfig' "LSP
"Plug 'vim-syntastic/syntastic' OBSOLETE
"Plug 'rust-lang/rust.vim'
Plug 'baskerville/vim-sxhkdrc'
Plug 'elkowar/yuck.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'haya14busa/is.vim' " automatically clear search highlight
Plug 'junegunn/fzf'
Plug 'preservim/nerdtree'
Plug 'tikhomirov/vim-glsl'
Plug 'lervag/vimtex' "LaTeX integration
Plug 'vlime/vlime', {'rtp': 'vim/'} "common lisp ide
Plug 'bhurlow/vim-parinfer' "clojure/lisp indentation
call plug#end()

" use tab for autocompletion, but only when it makes sense. otherwise insert a
" tab like normal
func! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunc
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

noremap <C-w>; <C-w>l
noremap <C-w>l <C-w>k
noremap <C-w>k <C-w>j
noremap <C-w>j <C-w>h

noremap <C-:> <C-w>L
noremap <C-L> <C-w>K
noremap <C-K> <C-w>J
noremap <C-J> <C-w>H

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


"hexokinase stuff
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'


let g:yuck_recommended_style = 0

"colorscheme
colorscheme xresources

"word processor
func! WordProcessor()
  map k gk
  map l gl
  set wrap
  setlocal formatoptions=1
  setlocal spell spelllang=en_us  
endfunc
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
