


if exists("syntax_on")
    syntax reset
    "syntax clear
endif

hi clear
"syntax enable
"set background=dark
let g:colors_name="scouarn"


"background dependant stuff
if &background == "dark"
                                           "vvvv 235 or something
    hi Normal       ctermfg=15      ctermbg=235
    hi LineNr       ctermfg=244     ctermbg=237
    hi CursorLineNr ctermfg=15      ctermbg=237    cterm=bold
    hi StatusLine   ctermfg=15      ctermbg=237    cterm=bold
    hi StatusLineNc ctermfg=244     ctermbg=237    cterm=none
    hi SpecialKey   ctermfg=238     ctermbg=none   cterm=none
    hi Comment      ctermfg=244
    hi Delimiter    ctermfg=244
    hi ColorColumn                  ctermbg=237
    hi VertSplit    ctermfg=235     ctermbg=237    cterm=none

elseif &background == "light"
    hi Normal       ctermfg=16      ctermbg=15
    hi LineNr       ctermfg=238     ctermbg=251 
    hi CursorLineNr ctermfg=16      ctermbg=251    cterm=bold
    hi StatusLine   ctermfg=16      ctermbg=251    cterm=bold
    hi StatusLineNc ctermfg=238     ctermbg=251    cterm=none
    hi SpecialKey   ctermfg=249     ctermbg=none   cterm=none
    hi Comment      ctermfg=8
    hi Delimiter    ctermfg=8
    hi ColorColumn                  ctermbg=251
    hi VertSplit    ctermfg=15      ctermbg=251    cterm=none

else "default term colors
    hi Normal       ctermfg=none    ctermbg=none
endif



hi clear Identifier
"hi link Identifier Normal 
hi link Identifier Statement
hi clear Title
hi link  Title Normal
hi clear MoreMsg
hi link MoreMsg ModeMsg

"red stuff
hi Statement    ctermfg=161     cterm=bold
hi clear Type
hi clear Preproc
hi link Type Statement 
hi link PreProc Statement

"constants
hi String       ctermfg=34
hi clear Character
hi link  Character String
hi Constant     ctermfg=135
hi clear Number
hi link Number Constant
hi clear Special
hi link Special Constant



"fixes for javascript
hi link javaScriptNumber Number
hi link javaScriptIdentifier Statement
hi link javaScriptParens Delimiter 

"fixes for markdown
hi link markdownH1 Statement
hi link markdownH2 Statement
hi link markdownH3 Statement
