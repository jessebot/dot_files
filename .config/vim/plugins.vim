" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                                "vim-plug"
"        plugin manager for vim: https://github.com/junegunn/vim-plug
"        plugin directory will be (on Linux/macOS): '~/.config/vim/plugged'
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#begin('~/.config/vim/plugged')

" ------------------------- General IDE stuff ----------------------------
" adds a pretty status line
Plug 'vim-airline/vim-airline'

" my preferred colorscheme right now
Plug 'space-chalk/spacechalk.vim', { 'do': ':colorscheme spacechalk' }

" allow collapsing of functions for python and other supported languages
Plug 'tmhedberg/SimpylFold'

" indents lines and adds a line to show blocks of code
Plug 'Yggdroot/indentLine'

" this is a modern fuzzy searcher
Plug 'liuchengxu/vim-clap'

" underlines your current work you're on
Plug 'itchyny/vim-cursorword'

" ------------------------------ NerdTree --------------------------------
"         Tree explorer plugin - use :NERDTreeToggle to try it out
"             after nerdtree is on visible, use ? for help

" On-demand loading of nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" add tabs to nerdtree - experimental
Plug 'jistr/vim-nerdtree-tabs'
" puts little glyphs for different file types
Plug 'ryanoasis/vim-devicons'
" syntax highlighing for nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" add git awareness to see modified, merged, etc status of file in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" ------------------------------ git -------------------------------------
" git plugin for running git commands with :git
Plug 'tpope/vim-fugitive'

" puts a git + or - in side line to show git changes in file
Plug 'airblade/vim-gitgutter'

" ---------- Language Specific/File type Specific Stuff -------------
" general linter - will use common linters and highlight broken code
Plug 'dense-analysis/ale'

" terraform linter
Plug 'hashivim/vim-terraform', {'for': 'tf'}

" bash tab completion
Plug 'WolfgangMehner/bash-support', {'for': 'sh'}

" adding KDL (document language for zellij, a tmux replacement) support
Plug 'imsnif/kdl.vim'

" yaml syntax highlighting better
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }

" Golang, for future proofing
Plug 'fatih/vim-go', { 'for': 'go' }

" This is helpful for markdown
Plug 'junegunn/limelight.vim'

" this is for pretty vim tables
Plug 'dhruvasagar/vim-table-mode', {'for': 'markdown'}

" Now you can type emojis :) like :dog: which should become a dog :dog
Plug 'junegunn/vim-emoji', { 'for': 'markdown' }

" for authorized keys
Plug 'xevz/vim-sshauthkeys'

" --------------------------- HTML / CSS ----------------------------
" CSS color, multi-syntax context-sensitive color name highlighter, for HEX
Plug 'jessebot/vim-css-color', { 'for': ['vim', 'html', 'css', 'scss'] }


" make jinja templates prettier
Plug 'lepture/vim-jinja', { 'for': ['html', 'tpl'] }

" --------------------------- python --------------------------------
" tab completion, docs, etc
Plug 'ycm-core/YouCompleteMe'

" requirements.text syntax highlighting
Plug 'raimon49/requirements.txt.vim', { 'for': 'requirements' }

" ---------------------------- k8s ----------------------------------
" For the current buffer (including modifications not on disk)
"   :KubeApply :KubeDelete :KubeCreate
" And for the current directory (read from disk)
"   :KubeApplyDir :KubeDeleteDir
Plug 'andrewstuart/vim-kubernetes', {'for': 'yaml'}

" -------------------------- log files --------------------------------
Plug 'mtdl9/vim-log-highlighting', {'for': 'log'}

" -------------------------- tmux -----------------------------
Plug 'tmux-plugins/vim-tmux'

call plug#end()
