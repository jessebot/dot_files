set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.vimrc

call plug#begin()

Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

call plug#end()
