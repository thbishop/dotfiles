call pathogen#infect()

syntax on
filetype plugin indent on

let mapleader = ","

set clipboard=unnamed

set autoindent
set tabstop=2
set smarttab
set shiftwidth=2
set expandtab
set backspace=start,indent
set ts=4 sts=4 sw=4 expandtab

" files
autocmd FileType ruby,eruby,yaml,javascript set ai sw=2 sts=2 et
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead Berksfile set ft=ruby
autocmd BufRead,BufNewFile *.md setlocal textwidth=79
autocmd BufRead,BufNewFile *.md setlocal spell

set gfn=Menlo:h13

set history=500

set backupdir=~/.vim_backup
set directory=~/.vim_backup

set number

let NERDTreeShowHidden=1

if exists('+colorcolumn')
        set colorcolumn=80
else
        au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

""""""""""""""""""""""""""""""""
" KEY MAPPINGS
""""""""""""""""""""""""""""""""
map ,n :NERDTreeToggle<CR>
map ,jl :! jsonlint %<CR>

" manipulate windows
map + <C-W>>
map - <C-W><
map ,e <C-W>=

" go
iab ifnil if err != nil {<CR><tab>return err<CR>}<CR>

" auto gofmt Go programs using shell's gofmt tool
" sets autoread to reload files silently
set autoread

let g:go_fmt_command = "goimports"

" color
let g:solarized_termcolors=256
set background=light
colorscheme solarized
set cursorline " highlight current line

au BufRead,BufNewFile *.md setlocal textwidth=80 filetype=markdown shiftwidth=2

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+%#\@<!$/
autocmd InsertLeave * redraw!

set spell spelllang=en_us
autocmd BufRead,BufNewFile *.md setlocal spell
