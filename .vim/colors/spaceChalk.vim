" Vim color scheme
"
" Name:         spaceChalk.vim
" Maintainer:   @jessebot - Jesse Hitch
" Last Change:  2022-10-29 12:11:06.0 +0200
" License:      GPLv3
" Notes: Use :help command to check vim help on what variables are called, e.g.
"        Open a python file in vim and then type the following:
"                       :syntax list
"        That will give you all the syntax variable names and their colors as
"        three x's, like: pythonInclude  xxx from import
"        It may also be helpful to check out more about syntax/colors with:
"                        :help syntax 
"
"        Finally, useful tool for learning what highlight variables are called:
"        http://bytefluent.com/vivify/ to find variables of colors

" Colours in use
" --------------
" #CAEAFF chalky white
" #ffaff9 light pink
" #f289f9 neon magenta
" #f2748a pale dark red
" #ff8d87 soft redish orange
" #fdcd36 light orange
" #f7fb53 bright yellow 
" #f6f76a soft yellow 
" #a8fd57 lime green
" #5ac4b9 teal (this color feels weird)
" #5cc9fd blue
" #5f87ff cornflower blue
" #a3a8f8 medium purple
"
" #232336 blueish black
" #1d2652 navy blue
" #2569aa darker blue
" #585858 gray
" #323232 grayish black

hi clear

if exists("syntax_on")
   syntax reset
endif

set background=dark

let g:colors_name = "spaceChalk"

" GUI Colors
"
" this is the general background of the whole editor and the plain text color
" #E8FBFF
highlight Normal      guibg=#232336 guifg=#CAEAFF
highlight Cursor      guibg=#a3a8f8 guifg=Black
highlight CursorLine  guibg=#323232 
highlight LineNr      guibg=#323232 guifg=#5f87ff
highlight Folded      guibg=#3E3E3E guifg=#ffaff9
highlight Visual      guibg=#2569aa guifg=#a8fd57

" this one controls the column over 80 characters
highlight ColorColumn guibg=#2569aa

" this is for the split line between other windows and nerdtree
highlight VertSplit guibg=#a8fd57 guifg=#3E3E3E

" these are for little popup dropdown menus, for things like tab complete
highlight Pmenu    guibg=#1d2652 guifg=#5cc9fd
highlight PMenuSel guibg=#323232 guifg=#fdcd36

" General Colors
highlight Comment    guifg=#a3a8f8
highlight Constant   guifg=#f7fb53
highlight Keyword    guifg=#fdcd36
highlight String     guifg=#a8fd57
highlight Boolean    guifg=#5ac4b9
highlight Number     guifg=#f289f9
highlight Float      guifg=#f289f9
highlight Type       guifg=#5cc9fd
highlight Identifier guifg=#fdcd36
highlight Function   guifg=#5cc9fd
highlight PreProc    guifg=#5f87ff
highlight Todo       guifg=#fdcd36 guibg=#2569aa


highlight StatusLine guibg=#5cc9fd

" Searching
highlight clear Search
highlight Search     guibg=#f7fb53 guifg=Black

" Invisible character colors
highlight NonText    guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" HTML Colors
highlight link htmlTag     Type
highlight link htmlEndTag  htmlTag
highlight link htmlTagName htmlTag

highlight pythonParameters      ctermfg=147 guifg=#AAAAFF
highlight pythonParam           ctermfg=175 guifg=#f289f9
highlight pythonBrackets        ctermfg=183 guifg=#d7afff
highlight pythonLambdaExpr      ctermfg=105 guifg=#8787ff
highlight pythonBrackets        guifg=#5ac4b9

" Ruby Colors
highlight link rubyClass            Keyword
highlight link rubyDefine           Keyword
highlight link rubyConstant         Type
highlight link rubySymbol           Constant
highlight link rubyStringDelimiter  rubyString
highlight link rubyInclude          Keyword
highlight link rubyAttribute        Keyword
highlight link rubyInstanceVariable Normal

" Rails Colors
highlight link railsMethod Type

" Sass colors
highlight link sassMixin Keyword
highlight link sassMixing Constant

" Outliner colors
highlight OL1 guifg=#f289f9
highlight OL2 guifg=#a8fd57
highlight OL3 guifg=#5cc9fd
highlight OL4 guifg=#f7fb53
highlight BT1 guifg=#a3a8f8
highlight link BT2 BT1
highlight link BT3 BT1
highlight link BT4 BT1

" Markdown colors
highlight markdownCode guifg=#a8fd57 guibg=#232336
highlight link markdownCodeBlock markdownCode

" Git colors
highlight gitcommitSelectedFile  guifg=#a8fd57
highlight gitcommitDiscardedFile guifg=#f2748a
highlight gitcommitWarning       guifg=#f2748a
highlight gitcommitBranch        guifg=#fdcd36
highlight gitcommitHeader        guifg=#5cc9fd

" Gitgutter stuff
" change sign column color for git to be the same as line number background
highlight! link SignColumn LineNr
" change the colors back to what they should be when there are changes
highlight GitGutterAdd    guibg=#323232 guifg=#a8fd57 ctermfg=2
highlight GitGutterChange guibg=#323232 guifg=#f7fb53 ctermfg=3
highlight GitGutterDelete guibg=#323232 guifg=#f2748a ctermfg=1

" -------------  NERDTree syntax colors for file browsing -------------------
highlight Directory guifg=#5cc9fd 
highlight NERDTreeCWD guifg=#f6f76a
highlight NERDTreeDirSlash guifg=#a8fd57
highlight NERDTreeClosable guifg=#fdcd36
highlight NERDTreeOpenable guifg=#f289f9

let g:WebDevIconsDefaultFolderSymbolColor = '5f87ff' " #5f87ff cornflower blue
let g:WebDevIconsDefaultFileSymbolColor = '5cc9fd' " #5cc9fd blue

" set the default colors for different file types :)
" all of these are pale purple: #a3a8f8
let g:NERDTreeExtensionHighlightColor = {} 
let g:NERDTreeExtensionHighlightColor['md'] = 'a3a8f8' 
let g:NERDTreeExtensionHighlightColor['txt'] = 'a3a8f8' 

" all of these are oranger: #fdcd36
let g:NERDTreeExtensionHighlightColor['in'] = 'fdcd36' 
let g:NERDTreeExtensionHighlightColor['yml'] = 'fdcd36' 
let g:NERDTreeExtensionHighlightColor['yaml'] = 'fdcd36' 
let g:NERDTreeExtensionHighlightColor['json'] = 'fdcd36' 
let g:NERDTreeExtensionHighlightColor['cfg'] = 'fdcd36' 
let g:NERDTreeExtensionHighlightColor['py'] = '5cc9fd' " #5cc9fd blue
let g:NERDTreeExtensionHighlightColor['sh'] = 'a8fd57' " #a8fd57 lime green
