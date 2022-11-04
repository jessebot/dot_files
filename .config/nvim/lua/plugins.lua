-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- adds a pretty status line -- 'vim-airline/vim-airline'
    use '~/.vim/plugged/vim-airline'

    -- startup screen for neovim
    use 'glepnir/dashboard-nvim'

    -- cute halloween dashboard for neovim start screen :3
    -- not sure why this doesn't work, so it's commented out
    -- use 'folke/drop.nvim'

    -- ------------ telescope: extendable fuzzy finder over lists ------------
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
         requires = {{'nvim-lua/plenary.nvim'} }
    }

    -- ------------------------------ git ------------------------------------
    -- git plugin for running git commands with :git -- 'tpope/vim-fugitive'
    use '~/.vim/plugged/vim-fugitive'

    -- puts a git + or - in side line to show git changes in file
    -- 'airblade/vim-gitgutter'
    use '~/.vim/plugged/vim-gitgutter'

    -- ----------- nvim new nerdtree replacement needs this :) ---------------
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'

    -- ---------- Language Specific/File type Specific Stuff -----------------
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

    -- This is helpful for markdown -- 'junegunn/limelight.vim'
    use '~/.vim/plugged/limelight.vim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

vim.cmd([[
  augroup packer_exit
    autocmd!
    autocmd User PackerComplete quit
  augroup end
]])
