set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" snake python vim scripting
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'chrisbra/csv.vim'
Plugin 'airblade/vim-gitgutter'
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
call vundle#end()            " required
"filetype plugin indent on    " required

let mapleader="," " Set comma as map leader

"""""""" Mapps """"""""
nmap <leader>r :!%<CR>
nmap <leader>p :!python %<CR>
map <silent> <leader>M :%s/<C-V><C-M>//<CR>
map <leader>t :!~/bin/ntest %<CR>
map <leader>tc :!~/bin/ntest % -a 'current'<CR>
map <leader>dt :!python -m doctest %<CR>
map <leader>s  :setlocal spell spelllang=en_us<CR>
map <leader>rs :!bundle exec rspec %\:<C-R>=line('.')<CR><CR>
map <leader>c  :!cat % \| pbcopy
nnoremap ; : " Use ; instead of : Nobody uses ; anyways
noremap <C-i> :exe '! '.@0 <CR>
" Ctrl+e/y scrolls viewport
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l
" F8 to turn off indent
nnoremap <F8> :setl noai nocin nosi inde=<CR>
" Complete whole filenames/lines with a quicker shortcut key in insert mode
imap <C-f> <C-x><C-f>
imap <C-l> <C-x><C-l>

"""""" Misc stuff """"""""
"set relativenumber  " Line numbers are relative up and down to cursor
"set linebreak       " Breaks lines longer than textwidth (requires wraplines)
"et showbreak=+++   " what to show on wrapped lines
"et textwidth=80    " How many characters to wrap at

set ffs=unix
syntax on " Syntax highlighting
set background=dark " Dark backgrounds
set showmatch " set show matching parenthesis
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase,
set scrolloff=10 " keep 10 lines off the edges of the screen when scrolling
set virtualedit=all " allow the cursor to go in to "invalid" places
"set listchars=tab:▸\ ,trail:·,extends:#,nbsp:· " Put characters in for normally transparent characters(space, tab...)
set incsearch " show search matches as you type
set iskeyword-=_ " allow word jumping to treat underscore as a separator
set laststatus=2 " tell VIM to always put a status line in, even
 "    if there is only one window
set history=1000 " remember more commands and search history
set undolevels=1000 " use many muchos levels of undo
set nomodeline " disable mode lines (security measure)
"set cursorline " underline the current line, for quick orientation

" TABS
set ts=4 " A tab is 4 spaces
set sw=4 " Backspace deletes spaces as if a tab was there
set expandtab " Expand tabs by default

" Fixes annoying stuff
set hls! " Turn off search highlighting?
set nohlsearch " Turn off seach highlighting?
set backspace=indent,eol,start " allow backspacing over everything in insert mode
nohl " Turn off highlighting everything
set fileformats="unix,dos,mac"
set formatoptions+=1 " When wrapping paragraphs, don't end lines
set nobackup " do not keep backup files, it's 70's style cluttering
set noswapfile " do not write annoying intermediate swap files,
 "    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
 " store swap files in one of these directories
 "    (in case swapfile is ever turned on)
set wildignore=*.swp,*.bak,*.pyc,*.class
set splitbelow
set splitright

"""""""
" Stuff I'm not sure about from William
"set shiftwidth=4 " number of spaces to use for autoindenting
"set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
"set smarttab " insert tabs on the start of a line according to
"set gdefault " search/replace "globally" (on a line) by default

""" Not sure exactly what this all does -- Experimental
" Highlighting {{{
if &t_Co >= 256 || has("gui_running")
 colorscheme molokai
endif

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" What does this little gem do?
if version >= 703
    nmap <leader>r :set relativenumber!<CR>
    set undofile                " keep a persistent backup file
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif

if version >= 720
    set relativenumber
endif

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType ruby set expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType yaml set expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType python set expandtab shiftwidth=2 softtabstop=2 tabstop=2
