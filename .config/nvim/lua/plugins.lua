-- This file can be loaded by calling `lua require('plugins')` from your init.config/vim
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
    use {'wbthomason/packer.nvim'}

    -- adds a pretty status line -- 'vim-airline/vim-airline'
    use {'vim-airline/vim-airline'}

    -- preferred colorscheme right now
    use {'space-chalk/spacechalk.vim'}

    -- startup screen for neovim
    use {'glepnir/dashboard-nvim'}

    -- quick session manager
    use({'glepnir/dbsession.nvim', event = 'BufRead', 
         config = function() require('dbsession').setup({}) end
    })

    -- cute halloween dashboard for neovim start screen :3
    -- not sure why this doesn't work, so it's commented out
    -- use 'folke/drop.nvim'

    -- this is a modern fuzzy searcher
    use {'liuchengxu/vim-clap'}

    -- ------------ telescope: extendable fuzzy finder over lists ------------
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
         requires = {{'nvim-lua/plenary.nvim'} }
    }

    -- ------------------------------ git ------------------------------------
    -- git plugin for running git commands with :git -- 'tpope/vim-fugitive'
    use {'tpope/vim-fugitive'}

    -- puts a git + or - in side line to show git changes in file
    -- 'airblade/vim-gitgutter'
    use {'airblade/vim-gitgutter'}

    -- ----------- nvim new nerdtree replacement needs this :) ---------------
    use {'nvim-tree/nvim-tree.lua',
         requires = {'nvim-tree/nvim-web-devicons'},
         tag = 'nightly'}

    -- ------- a mini map of where you are in your code -----------------
    -- not working for some reason?
    use { 'echasnovski/mini.map', branch = 'main' }

    -- -------------------- Language Specific Stuff ------------------------

    -- general linter - will use common linters and highlight broken code
    use {'dense-analysis/ale'}

    -- syntax highlighting for neovim
    use {'nvim-treesitter/nvim-treesitter'}

    -- terraform linter -- 'hashivim/vim-terraform'
    use {'hashivim/vim-terraform'}

    -- bash tab completion -- 'WolfgangMehner/bash-support'
    use {'WolfgangMehner/bash-support'}

    -- yaml syntax highlighting better -- 'stephpy/vim-yaml'
    use {'stephpy/vim-yaml'}

    -- helpful for python highlighting, fork of numirias/semshi
    -- use {'wookayin/semshi'}

    -- This is helpful for markdown -- 'junegunn/limelight.config/vim'
    use {'junegunn/limelight.vim'}

    -- logging syntax and highlighting -- 'mtdl9/vim-log-highlighting'
    use {'mtdl9/vim-log-highlighting'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
