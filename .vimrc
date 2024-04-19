set shell=/usr/bin/zsh

" Faster window refresh
set ttyfast
set lazyredraw

" Setup Vundle and other plugins
set rtp+=/home/vscode/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'saltstack/salt-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'dearrrfish/vim-applescript'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'rodjek/vim-puppet'
call vundle#end()

"Save on focus lost
:au FocusLost * :wa

" Sessions
let g:session_autoload = 'no'

" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gp :Gpush<CR>

" Toggle nerdtree with F10
map <F10> :NERDTreeToggle<CR>
map <F9> :NERDTreeFind<CR>

" Reduce timeout after <ESC> is recieved.
set ttimeout
set ttimeoutlen=20
set notimeout

" highlight vertical column of cursor
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline

" Disable swp, force Vim mode, increase history size
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

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Auto indent
filetype plugin indent on

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=90

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 2 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme='solarized'
set t_Co=256

" Smart case searching
set smartcase
set ignorecase

" Color scheme
set background=dark
colorscheme wombat256


" Numbers
set number
set numberwidth=5

" Persistent undo
set undodir=/home/vscode/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Tab completion
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

" Disable arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Open new split panes to right and bottom
set splitbelow
set splitright

" Quicker window movement
let g:tmux_navigator_no_mappings = 1

" Set tab window cycling
if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>
endif

" Toggle autoindent and auto bracing
set pastetoggle=<F3>

" Set tab spacing for YAML
autocmd FileType yaml setlocal shiftwidth=1 tabstop=1
autocmd FileType sls setlocal shiftwidth=2 tabstop=2

" Markdown
"let g:vim_markdown_frontmatter = 1
"let g:vim_markdown_new_list_item_indent = 2
"let g:vim_markdown_autowrite = 1