
filetype on
filetype plugin on

"fix for prolog file extension
au BufRead,BufNewFile *.pl set filetype=prolog

"disable weird format options
au FileType * set formatoptions=

"Abort when accidentally saving '<' on azerty keyboard
au BufWritePre < throw 'Abort saving "<"'

"misc stuff
set nocompatible
set history=1000

"wrapping and ruler
set nowrap
set linebreak
set colorcolumn=81

"vertical
set scrolloff=6

"custom colorscheme
colorscheme scouarn
set background=dark
syntax on

"automatic clipboard
set clipboard=unnamedplus

"numbering
set relativenumber
set number
set cursorlineopt=line

"tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set list
set listchars=tab:\ \ │,space:·,extends:»,precedes:«,nbsp:␣

"search
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

"backup/swapfiles
set nobackup
set noswapfile

"to be figured out later
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.exe,*.pyc,*.cmo,*.cmx,*.cmi,*.cma


"""""""""""""""""""""""""""""""""""""""
"             STATUS LINE             "
"""""""""""""""""""""""""""""""""""""""
let g:currentmode={
       \ 'n'       : 'NORMAL ',
       \ 'v'       : 'VISUAL ',
       \ 'V'       : 'VLINE  ',
       \ "\<C-V>"  : 'VBLOCK ',
       \ 'i'       : 'INSERT ',
       \ 'R'       : 'REPLACE',
       \ 'Rv'      : 'VREP   ',
       \ 'c'       : 'COMMAND',
       \}

"show mode in status bar
set noshowmode

set statusline=
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=\ %f\ %Y\ 
set statusline+=%{&modified?'[+]':'\ \ \ '}
set statusline+=%{&readonly?'[RO]':'\ \ \ \ '}
set statusline+=%=
set statusline+=\ row:\ %l\/%L\ col:\ %c\ 
set laststatus=2


"function to show the syntax context stack
function! Syn()
    for id in synstack(line("."), col("."))
        echo synIDattr(id, "name")
    endfor
endfunction
command! -nargs=0 Syn call Syn()


"""""""""""""""""""""""""""""""""""""""
"               REMAPS                "
"""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" By default backspace can only remove what was added after entering insert
set backspace=indent,eol,start
set mouse=a
set ttymouse=sgr

"anoying bindings
noremap Q <nop>
noremap K <nop>

"un-highlight
nnoremap <leader>h :noh<cr>

"netrw
let g:netrw_banner=0
nnoremap <leader>pv :Sex!<cr>

"set background
nnoremap <leader>bgl :set bg=light<cr>
nnoremap <leader>bgd :set bg=dark <cr>

"toggle cursor line/column
nnoremap <leader>c :set cursorcolumn!<cr>:set cursorline!<cr>

"toggle wrapping
nnoremap <leader>w :set wrap!<cr>

"recenter around cursor after pageup/down and when searching
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap n nzz
nnoremap N Nzz

"move the selection up or down and reindent
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"paste without saving to register
noremap <C-p> "_dP
