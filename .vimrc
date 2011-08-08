" color 
let &t_Co=256
" colorscheme jellybeans
colorscheme solarized
set background=light
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

" swp/backup file location
set backupdir=~/.vim_backup
set directory=~/.vim_backup

" what to display
set list
set number

" NERDTree conf
map ,n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" json support
autocmd BufNewFile,BufRead *.json set ft=javascript

" mappings for editing/reloading vimrc
map ,erc :e $MYVIMRC<CR>
map ,rrc :source $MYVIMRC<CR>

" mappings for conque term
let g:ConqueTerm_CloseOnEnd = 0

" minimize macvim toolbar"
set guioptions-=T
