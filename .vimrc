call pathogen#infect()

let mapleader = ","

" color
syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set cursorline " highlight current line

" whitespace/indent
set autoindent
set tabstop=2
set smarttab
set shiftwidth=2
set expandtab
set backspace=start,indent
filetype plugin indent on

" files
autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
autocmd BufNewFile,BufRead *.json set ft=javascript

" clip
set clipboard=unnamed

" font
set gfn=Menlo:h13

" history
set history=500

" swp/backup file location
set backupdir=~/.vim_backup
set directory=~/.vim_backup

" display
set list
set number

" NERDTree conf
let NERDTreeShowHidden=1

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1

" macvim
set guioptions-=T
if has("gui_running")
  set lines=999 columns=999 " maximize macvim window
endif

" set colorcolumn=80
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif"

""""""""""""""""""""""""""""""""
" KEY MAPPINGS
""""""""""""""""""""""""""""""""
map ,n :NERDTreeToggle<CR>
map ,s :SyntasticCheck<CR>
" insert a hash rocket
imap <c-l> <space>=><space>

" manipulate windows
map + <C-W>>
map - <C-W><
map ,e <C-W>=
