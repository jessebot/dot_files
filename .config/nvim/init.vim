../.config/nvim/init.vimset runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" disable netrw at the very start of your init.lua (strongly advised)
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

v:lua.require'nvim-tree'.setup()

source ~/.vimrc

call plug#begin()

" Dashboard for neovim start screen
Plug 'glepnir/dashboard-nvim'

" cute halloween dashboard for neovim start screen :3
Plug 'folke/drop.nvim'

" this is helpful for python highlighting
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" new nerdtree replacement needs this :)
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" adds a pretty status line
Plug 'vim-airline/vim-airline', {'dir': '~/.vim/plugged/vim-airline'}
Plug 'vim-airline/vim-airline-themes', {'dir': '~/.vim/plugged/vim-airline-themes'}

" allow collapsing of functions for python and other supported languages
Plug 'tmhedberg/SimpylFold', {'dir': '~/.vim/plugged/SimpylFold'}

" git plugin for running git commands with :git
Plug 'tpope/vim-fugitive', {'dir': '~/.vim/plugged/vim-fugitive'}
" puts a git + or - in side line to show git changes in file
Plug 'airblade/vim-gitgutter', {'dir': '~/.vim/plugged/vim-gitgutter'}

" general linter - will use common linters and highlight broken code
Plug 'dense-analysis/ale', {'dir': '~/.vim/plugged/ale'}

" ---------- Language Specific/File type Specific Stuff -------------
" terraform linter
Plug 'hashivim/vim-terraform', {'dir': '~/.vim/plugged/vim-terraform'}

" bash tab completion
Plug 'WolfgangMehner/bash-support', {'dir': '~/.vim/plugged/bash-support'}

" yaml syntax highlighting better
Plug 'stephpy/vim-yaml', {'dir': '~/.vim/plugged/vim-yaml'}

" This is helpful for markdown
Plug 'junegunn/limelight.vim', {'dir': '~/.vim/plugged/limelight.vim'}

call plug#end()
