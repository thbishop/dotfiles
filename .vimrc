" color 
let &t_Co=256
colorscheme jellybeans
syntax enable

" whitespace/indent
set autoindent
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=start,indent
filetype plugin indent on
autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et

" what to display
set list
set number

" NERDTree conf
map ,n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
