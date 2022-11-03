if exists("syntax_on")
    syntax reset
    "syntax clear
endif

hi clear

"syntax enable
set background=dark
let g:colors_name="scouarn"


hi Normal       ctermfg=15      ctermbg=none    cterm=none
hi Comment      ctermfg=7
hi Delimiter    ctermfg=7
hi SpecialKey   ctermfg=8       ctermbg=none   cterm=none

hi CursorColumn                 ctermbg=8      cterm=none
hi CursorLine                   ctermbg=8      cterm=none

hi ColorColumn                  ctermbg=8
hi LineNr       ctermfg=15      ctermbg=8
hi StatusLine   ctermfg=15      ctermbg=8      cterm=bold
hi StatusLineNc ctermfg=7       ctermbg=8      cterm=none
hi VertSplit    ctermfg=8       ctermbg=none   cterm=reverse

hi NonText ctermfg=4


"red stuff
hi Statement    ctermfg=1       cterm=bold
hi clear Identifier
hi link Identifier Statement
hi clear Type
hi link Type Statement 
hi clear Preproc
hi link PreProc Statement

"string constants
hi String       ctermfg=2
hi clear Character
hi link  Character String

"other constants
hi Constant     ctermfg=5
hi clear Number
hi link Number Constant
hi clear Special
hi link Special Constant

"errors
hi clear Error
hi Error        ctermfg=9       ctermbg=15     cterm=reverse 
hi clear ErrorMsg
hi link ErrorMsg Error

"search
hi clear Search
hi Search       ctermfg=11      ctermbg=none   cterm=reverse

"messages TODO et FIXME
hi Todo         ctermfg=3       ctermbg=none   cterm=reverse

"hi clear Title
"hi link  Title Normal
"hi clear MoreMsg
"hi link MoreMsg ModeMsg

"fixes for javascript
hi link javaScriptNumber Number
hi link javaScriptIdentifier Statement
hi link javaScriptParens Delimiter 

"fixes for markdown
hi link markdownH1 Statement
hi link markdownH2 Statement
hi link markdownH3 Statement


