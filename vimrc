set nocompatible

let mapleader=","                   " He’s a mighty good leader

silent! call pathogen#runtime_append_all_bundles()

syntax enable                       " Syntax highlighting
filetype plugin indent on           " File type detection

runtime macros/matchit.vim          " Load matchit

set showcmd                         " Display incomplete commands
set showmode                        " Display mode you’re in

set backspace=indent,eol,start      " Better backspacing

set title                           " Set terminal title
set hidden                          " Allow buffer switching with unsaved changes
set visualbell                      " Shut your yap, beep

set wildmenu                        " Enhanced command line completion
set wildmode=list:longest,list      " Shell-like file completion
set completeopt=longest,menu        " Use popup menu for completions when multiple
set complete=.,t                    " Complete from type definitions

set ignorecase                      " Ignore case in searches
set smartcase                       "   unless search expression contains a capital letter

set number                          " Line numbers
set ruler                           " Cursor position
set numberwidth=5                   " Min number of characters used for line numbers

set formatoptions-=o                " don’t continue comments when pressing o/O

set incsearch                       " Incremental searching
set hlsearch

set nobackup                        " Don't keep backup files
set nowritebackup                   " No really
set directory=$HOME/.vim/tmp//,.    " Single ocation for swap files


set laststatus=2                    " Always show status bar
" Status line information
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

colorscheme railscasts

set tabstop=2                       " Global tab width
set shiftwidth=2                    " Same again
set expandtab                       " Soft tabs
set softtabstop=2                   " Number of spaces for soft tabs

set scrolloff=3                     " Lines of context around cursor
set sidescroll=1                    " Horizontal scroll amount when wrap is off
set sidescrolloff=3                 " Columns of context around cursor

set list                            " Display unprintable characters
set listchars=tab:»·,trail:·        " How to display them

au BufRead,BufNewFile   *.ru set syntax=ruby

" Removes trailing whitespace and ^M
function RemoveWhitespace()
  %s/\s\+$//e
  %s/[ \t\r]\+$//e
  ''
endfunction

map <leader>w :call RemoveWhitespace()<CR>

set splitbelow                      " Open splits on the bottom
set splitright                      "   and on the right


" Clear search highlights
map <leader>h :noh<cr>

" Simpler window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" NERDTree
map <leader>nt :NERDTreeToggle<cr>

" Ack
map <leader>F :Ack<space>

" Rails plugin shortcuts
map <Leader>m :Rmodel<CR>
map <Leader>c :Rcontroller<CR>
map <Leader>v :Rview<CR>
map <Leader>u :Runittest<CR>
map <Leader>f :Rfunctionaltest<CR>
map <Leader>tm :RTmodel<CR>
map <Leader>tc :RTcontroller<CR>
map <Leader>tv :RTview<CR>
map <Leader>tu :RTunittest<CR>
map <Leader>tf :RTfunctionaltest<CR>
map <Leader>sm :RSmodel<CR>
map <Leader>sc :RScontroller<CR>
map <Leader>sv :RSview<CR>
map <Leader>su :RSunittest<CR>
map <Leader>sf :RSfunctionaltest<CR>

au BufNewFile,BufRead *.ru set syntax=ruby

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" Add blank lines without entering insert mode
map <leader>O O<Esc>
map <leader>o o<Esc>

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

