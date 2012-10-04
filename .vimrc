set nocompatible                 "  Give vim fully fledged features not compatible with vi

filetype plugin indent on

let NERDTreeQuitOnOpen = 1
let &t_Co=256

syntax enable
filetype plugin indent on
set modelines=5

set number                       "  Show lines numbers
set ruler                        "  Shows row, column
set showcmd                      "  Show the command you're typing
set showmode                     "  Show the mode you're in
set backspace=indent,eol,start   "  Intuitive backspacing
set nohidden                     "  Delete buffer after closing window
set wildmenu                     "  Enchanced command line completion
set wildmode=list:longest        "  Completes files like a shell
set incsearch                    "  Highlights matches as you search
set hlsearch                     "  Highlight matches
set title                        "  Set the terminal's title
set tabstop=3                    "  Global tab width.
set shiftwidth=3                 "  And again, related.
set expandtab                    "  Use spaces instead of tabs
set smarttab
set ai                           "  Auto indent
set visualbell                   "  Stop the audible bell
set autoindent                   "  Auto indent

" Set Insert Mode, Visual Mode, and Normal mode line colors
:au VimEnter * hi Visual ctermbg=DarkGray ctermfg=White
:au InsertEnter * hi CursorLine   cterm=NONE ctermbg=Red ctermfg=white
:au InsertLeave * hi CursorLine   cterm=NONE ctermbg=DarkCyan ctermfg=Black
:au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
:au VimEnter,WinEnter,BufWinEnter * hi CursorLine   cterm=NONE ctermbg=DarkCyan ctermfg=Black
:au WinLeave * set nocursorline

nnoremap <F3> :set hlsearch!<CR>
inoremap jk <Esc>

" Use tab to auto complete typed word
inoremap <S-Tab> <C-N>

" When I accidentally type :W, it saves as if I typed :w
:command W w

" Set the grep function to behave normally
set grepprg=grep\ -nH\ $*

" Always show line numbers, but only in current window.
:au WinEnter * :setlocal number
:au WinLeave * :setlocal nonumber

" Move between splits with Ctrl+j, Ctrl+k
map <C-J> <C-W><C-W>
map <C-K> <C-W><S-W>

" Reselect visual map after indent
vnoremap < <gv
vnoremap > >gv

" Wrap words in double quotes, parentheses, single quotes
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>el
nnoremap <leader>) viw<esc>a)<esc>bi(<esc>el
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>el

" Stop F1 from opening help because it is annoying
noremap <F1> <Esc>

" Open NERD Tree with F2
map <F2> :NERDTreeToggle<CR>

let g:zenburn_high_Contrast=1
colors zenburn
