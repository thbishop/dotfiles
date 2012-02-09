" color 
set t_Co=256
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized
set cursorline "highight current line

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

" font
set gfn=Menlo:h13

" history
set history=500

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
if has("gui_running")
  " Maximize macvim window.
  set lines=999 columns=999
" else
" " This is console Vim.
"   if exists("+lines")
"     set lines=50
"   endif
"   if exists("+columns")
"     set columns=100
"   endif
endif

" set colorcolumn=80
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
