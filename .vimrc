" color 
let &t_Co=256
colorscheme jellybeans
syntax enable

" whitespace
set autoindent
filetype plugin indent on

" autoindent with two spaces, always expand tabs
autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
set list

set number

" NERDTree conf
map ,n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
