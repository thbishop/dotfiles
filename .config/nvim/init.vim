call plug#begin('~/.local/share/nvim/site/autoload/plugged')
" Plug 'buoto/gotests-vim'
" Plug 'dense-analysis/ale'
" Plug 'junegunn/goyo.vim'
" Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'overcache/NeoSolarized'
call plug#end()

syntax on

set termguicolors
colorscheme NeoSolarized
set background=light

set cursorline
set number
set ruler

set cmdheight=1

set clipboard=unnamed

" tab
set smarttab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4

" indention
filetype plugin indent on
set autoindent

set history=1000
set undolevels=1000

let mapleader = ","

" reload
map <leader>s :source ~/.config/nvim/init.vim<CR>

set hlsearch
map <leader>h :set hlsearch!<CR>

" 80 chars per line
if exists('+colorcolumn')
	set colorcolumn=80
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

set ttyfast

" window helpers
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
