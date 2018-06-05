set nocompatible                 "  Give vim fully fledged features not compatible with vi

set encoding=utf8
set ffs=unix,dos

filetype plugin indent on

let NERDTreeQuitOnOpen = 1
let &t_Co=256

syntax enable
filetype plugin indent on
set modelines=5

set relativenumber               "  Shows relative line numbers
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
set tabstop=4                    "  Global tab width.
set shiftwidth=4                 "  And again, related.
set expandtab                    "  Use spaces instead of tabs
set smarttab
set ai                           "  Auto indent
set visualbell                   "  Stop the audible bell
set autoindent                   "  Auto indent

" Color at column 80 so I don't try and write stuff past then
highlight ColorColumn ctermbg=DarkCyan guibg=Orange
set colorcolumn=80

" Set Insert Mode, Visual Mode, and Normal mode line colors
:au VimEnter * hi Visual ctermbg=DarkGray ctermfg=White
:au InsertEnter * hi CursorLine   cterm=NONE ctermbg=Red ctermfg=white
:au InsertLeave * hi CursorLine   cterm=NONE ctermbg=DarkCyan ctermfg=Black
:au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
:au VimEnter,WinEnter,BufWinEnter * hi CursorLine cterm=NONE ctermbg=DarkCyan ctermfg=Black
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
:au BufWinEnter * :setlocal relativenumber
:au BufWinLeave * :setlocal norelativenumber

" Absolute Line Numbers in Insert Mode
:au InsertEnter * :setlocal number
:au InsertLeave * :setlocal relativenumber

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

" Calls make to compile. If any errors, they are shown in the QuickFix Window
nnoremap <leader>m :silent make!\|redraw!\|cw<CR>

" Stop F1 from opening help because it is annoying
noremap <F1> <Esc>

" Open NERD Tree with F2
"map <F2> :NERDTreeToggle<CR>

" Wrap visual selection in an HTML tag.
vmap <Leader>w <Esc>:call VisualHTMLTagWrap()<CR>
function! VisualHTMLTagWrap()
  let tag = input("Tag to wrap block: ")
  if len(tag) > 0
    normal `>
    if &selection == 'exclusive'
      exe "normal i</".tag.">"
    else
      exe "normal a</".tag.">"
    endif
    normal `<
    exe "normal i<".tag.">"
    normal `<
  endif
endfunction

" Set text files to the txt filetype
au BufRead,BufNewFile *.txt set filetype=txt
au BufRead,BufNewFile *.md set filetype=md

" Set word wrapping and text width automatically in txt and markdown files
autocmd Filetype txt setlocal textwidth=80 formatoptions=t1
autocmd Filetype md setlocal textwidth=80 formatoptions=t1

let g:zenburn_high_Contrast=1
colors zenburn
