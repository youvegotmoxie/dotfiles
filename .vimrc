set shell=/usr/bin/zsh
set ttyfast
set lazyredraw
set rtp+=/home/vscode/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
call vundle#end()
:au FocusLost * :wa
let g:session_autoload = 'no'
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp :Gpush<CR>
set ttimeout
set ttimeoutlen=20
set notimeout
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline
set backspace=2
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set history=500
set ruler
set showcmd
set incsearch
set hlsearch
set laststatus=2
set autowrite
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!
  autocmd FileType text setlocal textwidth=90
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd FileType markdown setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

set tabstop=4
set shiftwidth=4
set expandtab
set list listchars=tab:»·,trail:·
set t_Co=256
set smartcase
set ignorecase
set background=dark
colorscheme wombat256
set number
set numberwidth=5
set undodir=/home/vscode/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
set splitbelow
set splitright
set pastetoggle=<F3>
autocmd FileType yaml setlocal shiftwidth=1 tabstop=1
autocmd FileType sls setlocal shiftwidth=2 tabstop=2