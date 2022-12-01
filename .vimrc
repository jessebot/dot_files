" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"                       "vimrc of @jessebot on GitHub"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"                             GENERAL ALL MODES:
"                       "line numbers, cursorline, etc,"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" this just loads .bashrc (.bash_profile on macOS) like a regular login shell
" but only in vim, this breaks in neovim for some reason :shrug:
if !has('nvim')
    set shell=bash\ --login
endif

" set window to 82 characters at start, to allow for line numbers & gitgutter
set winwidth=82

" line numbers for debugging and screen sharing, takes up 3 columns
set number
set numberwidth=3

" highlight current line - very useful, shouldn't turn off, you will be lost
set cursorline

" highlighted column 80, only on python files, to keep lines shorter
set colorcolumn=80

"                                  Font:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('nvim')
    " fonts with icons/emojis require utf-8
    set encoding=utf-8
endif

" use specific font with the glyphs patched in
set guifont=Mononoki\ Nerd\ Font:h15


"                           Syntax Highlighting:
"                                  and
"                                 Colors:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use 24-bit (true-color) mode in Neovim 0.1.5+ and Vim 7.4+
if has('termguicolors')
  set termguicolors
  " Enable syntax highlighting by default
  syntax on
endif

" clap
let g:clap_theme = 'material_design_dark'

" this is supposed to help with syntax highlighting
let g:ycm_enable_semantic_highlighting=1

"                      Specific File Types:
"           " things that apply to specific file types only"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile known_hosts,ssh_known_hosts set filetype=ssh_known_hosts

"                                  ALE:
"      "linter for warning and errors, using *existing* linter tools"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable ALE by default
let g:ale_enabled = 1
" only enable these linters by default
let g:ale_linters = { 'python': ['ruff', 'flake8'], }
" this is disabled to speed up ALE
let g:ale_lint_on_text_changed = 'never'

" only enable these fixers by default
let g:ale_fixers = {
\   'python': ['ruff', 'autoimport'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
" this will run the above fixers
let g:ale_fix_on_save = 1

" this is so we know what it is is telling us things are broken
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '%severity% ALE: [%linter%]: %s'

" prettier errors and warnings
let g:ale_sign_error = ''
let g:ale_sign_warning = ''

" map the keys Ctrl+j and Ctrl+k to moving between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


"                           VimDevicons Config:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
" let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['mycoolfile'] = ''
"
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
" configs
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['in'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ini'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['cfg'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yml'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yaml'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['toml'] = ''

" text files
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pdf'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['doc'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['docx'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''

" pictures
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['png'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jpg'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['jpeg'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['icns'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['stl'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['webp'] = ''

"                           NERDTree Config:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('nvim')
    " change the default expandable and collapsable icons
    let g:NERDTreeDirArrowExpandable = 'ﬀ'
    let g:NERDTreeDirArrowCollapsible = 'ﲔ'

    " change the default git nerdtree plugin icons
    let g:NERDTreeGitStatusUseNerdFonts = 1
    let g:NERDTreeGitStatusIndicatorMapCustom = {
                    \ 'Modified'  :'',
                    \ 'Staged'    :'',
                    \ 'Untracked' :'',
                    \ 'Renamed'   :'',
                    \ 'Unmerged'  :'',
                    \ 'Deleted'   :'',
                    \ 'Dirty'     :'',
                    \ 'Ignored'   :'',
                    \ 'Clean'     :'',
                    \ 'Unknown'   :'',
                    \ }

    " add syntax highlighting for entire file name in nerdtree
    let g:NERDTreeFileExtensionHighlightFullName = 1
    let g:NERDTreeExactMatchHighlightFullName = 1
    let g:NERDTreePatternMatchHighlightFullName = 1
    " enables folder icon highlighting using exact match
    let g:NERDTreeHighlightFolders = 1
    " highlights the folder name
    let g:NERDTreeHighlightFoldersFullName = 1
endif


"                               Gitgutter:
" "vim-gitgutter is a vim plugin that puts a symbol in a column to the left"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use the nerdfont symbols instead of -,+
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''

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
" enable folding for markdown?
let g:markdown_folding = 1
" in config files, allow user to fold comment blocks
autocmd FileType conf setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\\s*#'


"                                 BACKUPS:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


"                              BUFFER_STUFF:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('nvim')
    " don't know what this is
    set switchbuf=useopen
    " allow unsaved background buffers and remember marks/undo for them
    set hidden
    " Show (partial) command in the last line of the screen.
    " Set this option off if your terminal is slow.
    set showcmd
endif
set scrolloff=3

" See http://www.shallowsky.com/linux/noaltscreen.html
" Prevent Vim from clobbering the scrollback buffer so it doesn't mangle it
set t_ti= t_te=


"                             NORMAL MODE ONLY:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move around splits with ctrl + nav key(hjkl)
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" allow Copy from vim to browser
set clipboard=unnamed,unnamedplus

"                               INSERT MODE:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" ----------------------------------------------------------------------------
"                               INDENT ZONE
" ----------------------------------------------------------------------------
" set tabstop=4
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
if !has('nvim')
    set autoindent
endif
" Enable file type detection. Use the default filetype settings, so that mail
" gets 'tw' set to 72, 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

"                                SEARCHING:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('nvim')
    " remember more commands and search history
    set history=10000
    " While typing a search command, show where the pattern, as it was typed so far, matches.
    set incsearch
    " highlight the matches
    set hlsearch
    " always show the status line
    set laststatus=2
    " make tab completion for files/buffers act like bash
    set wildmenu
endif

set showmatch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" solve issue where sometimes search is used with white text on yellow bg

" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     CUSTOM FUNCTIONS AND COMMANDS:
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has('nvim')
    augroup autoNerdTree
        " Remove all auto-commands from the group AutoIndent
        autocmd!
        " Exit Vim if NERDTree is the only window remaining in the only tab.
        autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
        " Close the tab if NERDTree is the only window remaining in it.
        autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

        " Start NERDTree. If a file is specified, move the cursor to its window.
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
    augroup END

    augroup autoIndent
        autocmd!
        " yaml needs a bit of help
        autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab foldlevelstart=20
    augroup END
endif

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
      autocmd!
      " Remove all auto-commands from the group AutoIndent
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


"                                Airline:
"                 "A pure vim script status line for vim"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" don't show the section if it's not in use e.g. error section
let g:airline_skip_empty_sections = 1

" use powerline fonts
let g:airline_powerline_fonts = 1

" put ALE errors in our status line
let g:airline#extensions#ale#enabled = 1

" changing separators to match personal powerline for shell
let g:airline_left_sep=' '
let g:airline_right_sep=''

" this is a smaller more consise final airline segment
function! LinePercent()
    return line('.') * 100 / line('$') . '%'
endfunction

let g:airline_section_z = ' %l (%{LinePercent()})  %v'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !has('nvim')
    " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    "                                "vim-plug"
    "        plugin manager for vim: https://github.com/junegunn/vim-plug
    "        plugin directory will be (on Linux/macOS): '~/.vim/plugged'
    " ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    call plug#begin()

    " ------------------------- General IDE stuff ----------------------------
    " adds a pretty status line
    Plug 'vim-airline/vim-airline'

    " my preferred colorscheme right now
    Plug 'jessebot/spacechalk', { 'do': ':colorscheme spacechalk' }

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

    " --------------------------- HTML / CSS ----------------------------
    " cterm colors to be displayed pretty in vimscript at least
    " only turn this on when you need it. it makes everything slow
    " Plug 'MicahElliott/vim-cterm-highlight', { 'for': 'vim' }

    " CSS color, multi-syntax context-sensitive color name highlighter, for HEX
    Plug 'ap/vim-css-color', { 'for': ['vim', 'html', 'css', 'scss'] }


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
endif

" this has to be at the end of the file because it is a plugin I guess.
" custom colorscheme to be more pastel and pretty
colorscheme spacechalk
" use custome space chalk theme :)
let g:airline_theme='spacechalk'
