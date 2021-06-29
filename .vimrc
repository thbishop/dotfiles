call plug#begin('~/.vim/plugged')
Plug 'buoto/gotests-vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/goyo.vim'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'APZelos/blamer.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
call plug#end()

" theme
set termguicolors

colorscheme gruvbox

syntax on

set termguicolors

" indent
filetype plugin indent on
set autoindent
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=4
set tabstop=2
set expandtab

" show useful positions
set cursorline
set number
set ruler

set clipboard=unnamed

" manage histories
set history=1000
set undolevels=1000

let mapleader = ","

"reload vim config
map <leader>s :source ~/.vimrc<CR>

"fzf
map <C-p> :FZF<CR>


" remove white space on save
autocmd BufWritePre * :%s/\s\+$//e

" highlight our search
set hlsearch
map <leader>h :set hlsearch!<cr>

" nerdtree
let NERDTreeShowHidden=1
nmap <leader>n :NERDTreeToggle<CR>
map ,n :NERDTreeToggle<CR>

" make sure we stay in our lane
if exists('+colorcolumn')
        set colorcolumn=80
else
        au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" manipulate windows
map + <C-W>>
map - <C-W><
map ,e <C-W>=

" swap
set directory^=$HOME/.vim/tmp//

" auto close quickfix TODO
autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>

" golang
iab ifnil if err != nil {<CR><tab>return err<CR>}<CR>
set autowrite
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <Leader>ct <Plug>(go-coverage-toggle)

" groovy
autocmd BufNewFile,BufRead Jenkinsfile set ft=groovy

" extra white space
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+%#\@<!$/
autocmd InsertLeave * redraw!

" spelling
set spell spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add
autocmd BufRead,BufNewFile *.md setlocal spell
hi SpellBad cterm=reverse ctermfg=red

let g:scheme_bg = "dark"
function! ToggleBG()
  if g:scheme_bg == "dark"
    set background=light
    let g:scheme_bg = "light"
  else
    set background=dark
    let g:scheme_bg = "dark"
  endif
endfunction

map <leader>tb :call ToggleBG()<CR>

" coc.vim
" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol rename
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" git blame config
let g:blamer_enabled = 1
let g:blamer_prefix = "\t"
let g:blamer_show_in_insert_modes = 0
let g:blamer_show_in_visual_modes = 1
let g:blamer_date_format = '%Y/%m/%d'
