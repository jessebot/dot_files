" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                       "vimrc of @jessebot on GitHub"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             GENERAL ALL MODES:
"                       "line numbers, cursorline, etc,"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" this just loads .bashrc (.bash_profile on macOS) like a regular login shell
 set shell=bash\ --login

" set window to 82 characters at start, to allow for line numbers & gitgutter
set winwidth=82

" line numbers for debugging and screen sharing, takes up 4 columns
set number
set numberwidth=4

" highlight current line - very useful, shouldn't turn off, you will be lost
set cursorline

" highlighted column 80, so you know when you're over 80 char
set colorcolumn=80


"                                   Font:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fonts with icons/emojis require utf-8
set encoding=utf-8
" use specific font with the glyphs patched in
set guifont=Mononoki\ Nerd\ Font:h15


"                                 Colors:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use 24-bit (true-color) mode in Neovim 0.1.5+ and Vim 7.4+
if (has("termguicolors"))
    set termguicolors
endif

" custom colorscheme to be more pastel and pretty
colorscheme chalky

" clap
let g:clap_theme = 'material_design_dark'


"                           Syntax Highlighting:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting by default
syntax on

" this is supposed to help with syntax highlighting
let g:ycm_enable_semantic_highlighting=1


   "                              Airline:
"                 "A pure vim script status line for vim"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use powerline fonts
let g:airline_powerline_fonts = 1
" use softer colors
let g:airline_theme='murmur'
" changing separators to match personal powerline for shell
let g:airline_left_sep=' '
let g:airline_right_sep=''

" this is a smaller more consise final airline segment
function! LinePercent()
    return line('.') * 100 / line('$') . '%'
endfunction
let g:airline_section_z = ':%l (%{LinePercent()}) :%v'


"                               Ale:
"           "linter warning and errors using existing linters"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'


"                               Gitgutter:
" "vim-gitgutter is a vim plugin that puts a symbol in a column to the left"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use the nerdfont symbols inst4ead of -,+
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''


"                              FOLDING ZONE:
"                 "collapse an entire block or function"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable folding on base indent
set foldmethod=indent
set foldlevel=99
" let spacebar allow me to fold the code
nnoremap <space> za
" also allow me to see the doc strings
let g:SimpylFold_docstring_preview=1


"                                 BACKUPS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


"                              BUFFER_STUFF:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show (partial) command in the last line of the screen.
" Set this option off if your terminal is slow.
set showcmd

" don't know what this is
set switchbuf=useopen

" allow unsaved background buffers and remember marks/undo for them
set hidden
set scrolloff=3
" See http://www.shallowsky.com/linux/noaltscreen.html
" Prevent Vim from clobbering the scrollback buffer.
set t_ti= t_te=

" option has the effect of making Vim either more Vi-compatible, or make Vim
" behave in a more useful way. default off when a vimrc or gvimrc
" set nocompatible


"                             NORMAL MODE ONLY:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move around splits with ctrl + nav key(hjkl)
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


"                               INSERT MODE:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"                               INDENT ZONE
" ----------------------------------------------------------------------------
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
" Enable file type detection. Use the default filetype settings, so that mail
" gets 'tw' set to 72, 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" yaml needs a bit of help
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab foldlevelstart=20


"                                SEARCHING:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remember more commands and search history
set history=10000
" not sure what this does
set laststatus=2
set showmatch
set incsearch
" highlight the matches
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" solve issue where sometimes search is used with white text on yellow bg

" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"                     CUSTOM FUNCTIONS AND COMMANDS:
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ----------------------------------------------------------------------------
" HELPFUL FUNC FOR SEARCH IN VISUAL MODE:
" from from this user: https://stackoverflow.com/a/42776237
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n','g')
    let @s = temp
endfunction
" Make * search the file for text when you highlight it in visual mode
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

" ----------------------------------------------------------------------------
" CLEAR CURRENT SEARCH BUFFER ON RETURN:
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()

" ----------------------------------------------------------------------------
" MULTIPURPOSE TAB KEY: "Indent if at start of a line. Else, do completion."
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" ----------------------------------------------------------------------------
" OpenChangedFiles: Open a split for each dirty file in git
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()

" ----------------------------------------------------------------------------
" RENAME CURRENT FILE:
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

" ----------------------------------------------------------------------------
" Disables ARROW KEYS: "this is intentional to help learn hjkl"
" s: defines a variable in vim, and vimscript doesn't have booleans
let s:disableKeys = 0
" we call this automatically, but this lets you disable/re-enable arrow
function! ToggleArrowKeys()
    if s:disableKeys
        map <Left> h 
        map <Down> j
        map <Up> k
        map <Right> l
        let s:disableKeys = 0
    else
        map <Left> <Nop>
        map <Down> <Nop>
        map <Up> <Nop>
        map <Right> <Nop>
        let s:disableKeys = 1
    endif
endfunction
command! ToggleArrowKeys :call ToggleArrowKeys()

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" Md5 COMMAND - Show the MD5 of the current buffer
command! -range Md5 :echo system('echo '.shellescape(join(getline(<line1>, <line2>), '\n')) . '| md5')

" Insert the current time
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        COMMANDS WE CALL ON START:
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()
augroup END

" ----------------------------------------------------------------------------
" USE TEMPLATE FILE: for .py (python), .md (markdown) files, prepopulate data
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
    autocmd BufNewFile *.md 0r ~/.vim/templates/template.md
  augroup END
endif

" disable arrow keys by default
call ToggleArrowKeys()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           ❤ LEADER KEY MAPPINGS:
"                 These are used by typing ,<mapped letter>
"                 e.g. this will do something:  ,
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for writing custom commands
" https://medium.com/usevim/vim-101-what-is-the-leader-key-f2f5c1fa610f
" The <Leader> key is a reference to a specific key defined by the mapleader
" variable. A lot of ppl change to comma because they find it easier to type.
let mapleader=","

" not sure why this was set, needs research
nnoremap <leader><leader> <c-^>

" OPEN FILES IN DIRECTORY OF CURRENT FILE
map <leader>e :edit %%
map <leader>v :view %%

" <Leader>w
" Sudo vim trick with less key strokes - allow saving of files as sudo when I
" forgot to start vim using sudo.
noremap <Leader>w :w !sudo tee % > /dev/null

map <leader>n :call RenameFile()<cr>


" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                                "vim-plug"
"         "plugin manager for vim: https://github.com/junegunn/vim-plug
"          plugin directory will be (on Linux/macOS): '~/.vim/plugged'
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
call plug#begin()

" -------------------- General IDE stuff ------------------------
" adds a pretty status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" allow collapsing of functions for python and other supported languages
Plug 'tmhedberg/SimpylFold'
" indents lines and adds a line to show blocks of code
Plug 'Yggdroot/indentLine'
" this is a modern fuzzy searcher
Plug 'liuchengxu/vim-clap'

" NerdTree - Tree explorer plugin - use :NERDTreeToggle to try it out
"          - after nerdtree is on visible, use ? for help
"
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

" git plugin for running git commands with :git
Plug 'tpope/vim-fugitive'
" puts a git + or - in side line to show git changes in file
Plug 'airblade/vim-gitgutter'

" general linter - will use common linters and highlight broken code
Plug 'dense-analysis/ale'

" ---------- Language Specific/File type Specific Stuff -------------
" terraform linter
Plug 'hashivim/vim-terraform'

" bash tab completion
Plug 'WolfgangMehner/bash-support'

" yaml syntax highlighting better
Plug 'stephpy/vim-yaml'

" Golang, for future proofing
" Plug 'fatih/vim-go'

" --------------------------- HTML / CSS ----------------------------
" make jinja templates prettier
Plug 'lepture/vim-jinja'
" CSS color, a multi-syntax context-sensitive color name highlighter
Plug 'ap/vim-css-color'

" --------------------------- python --------------------------------
" tab completion maybe
Plug 'ycm-core/YouCompleteMe'

" auto linting, docs, etc
Plug 'python-mode/python-mode'
" requirements.text syntax highlighting
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" ------------------------- k8s -------------------------------
"
" For the current buffer (including modifications not on disk)
" :KubeApply :KubeDelete :KubeCreate
" And for the current directory (read from disk)
" :KubeApplyDir :KubeDeleteDir
Plug 'andrewstuart/vim-kubernetes'

" helm yaml specifically (includes go support) doesn't seem to work for
" auto-indenting, so it's off for now
" Plug 'towolf/vim-helm'

call plug#end()
