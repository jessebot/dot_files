-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- startup screen for neovim
    use 'glepnir/dashboard-nvim'

    -- cute halloween dashboard for neovim start screen :3
    -- use 'folke/drop.nvim'

    -- adds a pretty status line -- 'vim-airline/vim-airline'
    use '~/.vim/plugged/vim-airline'

    -- This is helpful for markdown -- 'junegunn/limelight.vim'
    use '~/.vim/plugged/limelight.vim'

    -- ------------------------------ git --------------------------------
    -- git plugin for running git commands with :git -- 'tpope/vim-fugitive'
    use '~/.vim/plugged/vim-fugitive'

    -- puts a git + or - in side line to show git changes in file
    -- 'airblade/vim-gitgutter'
    use '~/.vim/plugged/vim-gitgutter'


    -- ----------- new nerdtree replacement needs this :) ----------------
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'

    -- ---------- Language Specific/File type Specific Stuff -------------
    -- general linter - will use common linters and highlight broken code
    -- 'dense-analysis/ale'
    use '~/.vim/plugged/ale'

    -- terraform linter -- 'hashivim/vim-terraform'
    use '~/.vim/plugged/vim-terraform'

    -- bash tab completion -- 'WolfgangMehner/bash-support'
    use '~/.vim/plugged/bash-support'

    -- yaml syntax highlighting better -- 'stephpy/vim-yaml'
    use '~/.vim/plugged/vim-yaml'

    -- my preferred colorscheme right now -- use 'jessebot/space-chalk'
    use '~/.vim/plugged/spacechalk'

    -- this is helpful for python highlighting
    use {'numirias/semshi',  run = ':UpdateRemoteuseins', ft = 'py'}

end)
