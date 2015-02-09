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
set ts=4 sts=4 sw=4 expandtab
filetype plugin indent on

" files
autocmd FileType ruby,eruby,yaml,javascript set ai sw=2 sts=2 et
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead Berksfile set ft=ruby
""autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

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
set number

" NERDTree conf
let NERDTreeShowHidden=1

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1

" set colorcolumn=80
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif"

" git gutter
let GitGutterEnable=1

""""""""""""""""""""""""""""""""
" KEY MAPPINGS
""""""""""""""""""""""""""""""""
map ,n :NERDTreeToggle<CR>
map ,s :SyntasticCheck<CR>
map ,t :Tabularize /
map ,jl :! jsonlint %<CR>
map ,mk :! make<CR>

" manipulate windows
map + <C-W>>
map - <C-W><
map ,e <C-W>=

" go
iab ifnil if err != nil {<CR><tab>return err<CR>}<CR>
" auto gofmt Go programs using shell's gofmt tool
" sets autoread to reload files silently
set autoread
au BufWritePost *.go :silent execute "!goimports -w %" | redraw!
