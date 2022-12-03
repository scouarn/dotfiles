
set nobackup
set nocompatible

filetype on
filetype plugin on
"filetype indent off

"fix for prolog file extension
au BufRead,BufNewFile *.pl set filetype=prolog

au FileType * set formatoptions=

"Abort when accidentally saving '<' on azerty keyboard
au BufWritePre < throw 'Abort saving "<"'

"wrapping
set nowrap
set linebreak

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
set expandtab
set list
set listchars=tab:\ \ │,space:·,extends:»,precedes:«,nbsp:␣

" ruler at 80 cols 
set colorcolumn=81

set nobackup
set incsearch
set showmatch
set hlsearch
set history=1000
set showmode
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.exe,*.pyc,*.cmo,*.cmx,*.cmi,*.cma


"""""""""""""""""""""""""""""""""""""""
"             STATUS LINE             "
"""""""""""""""""""""""""""""""""""""""
" let g:currentmode={
"        \ 'n'       : 'NORMAL ',
"        \ 'v'       : 'VISUAL ',
"        \ 'V'       : 'VLINE  ',
"        \ "\<C-V>"  : 'VBLOCK ',
"        \ 'i'       : 'INSERT ',
"        \ 'R'       : 'REPLACE',
"        \ 'Rv'      : 'VREP   ',
"        \ 'c'       : 'COMMAND',
"        \}

set statusline=
"set statusline+=\ %{g:currentmode[mode()]}
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

"un-highlight
nnoremap <leader>h :noh<cr>

"show directory on the left
let g:netrw_banner=0
"nnoremap <leader>pv :wincmd v <bar> :Ex <bar> :vertical resize 16<cr>
"nnoremap <leader>pv :Sex! <bar> :vertical resize 20<cr>
nnoremap <leader>pv :Ex <cr> 

"set background
nnoremap <leader>bgl :set bg=light<cr>
nnoremap <leader>bgd :set bg=dark <cr>

"toggle cursor line/column
nnoremap <leader>c :set cursorcolumn!<cr>:set cursorline!<cr>

"toggle wrapping
nnoremap <leader>w :set wrap!<cr>
