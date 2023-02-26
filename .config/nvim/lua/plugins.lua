-- This file can be loaded by calling `lua require('plugins')` from your init.config/vim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd("packadd packer.nvim")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

    -- Packer, our neovim plugin manager, can manage itself
    use {'wbthomason/packer.nvim'}

    -- -------------------- startup screen for neovim ------------------------
    use {'glepnir/dashboard-nvim'}

    -- quick session manager (requires :PackerCompile)
    use({'glepnir/dbsession.nvim', event = 'BufRead',
         config = function() require('dbsession').setup({}) end
    })

    -- cute halloween dashboard for neovim start screen :3
    -- use {'folke/drop.nvim'}


    -- -------------------------- status line --------------------------------
    -- may replace soon, because it is very crowded
    use {'vim-airline/vim-airline'}


    -- -------------------- floating window plugins --------------------------
    -- terminal window
    use {"numToStr/FTerm.nvim"}

    -- floating window for k9s (k8s dashboard TUI)
    use {'hsalem7/nvim-k8s',
         commit = 'f216b1736e6fb41fdbca1af684d89551151b7e31'}

    -- this is more stuff for floating windows
    use {'MunifTanjim/nui.nvim'}


    -- ------------------------- file directory tree -------------------------
    -- nvim new nerdtree replacement
    use {
	    'nvim-tree/nvim-tree.lua',
	    requires = {'nvim-tree/nvim-web-devicons'},
	    tag = 'nightly'
    }

    -- ---------------- scroll bar for the right hand side -------------------
    use {"petertriho/nvim-scrollbar"}

    -- code location at top of window
    use({
      "utilyre/barbecue.nvim",
      tag = "*",
      requires = {
        "SmiteshP/nvim-navic",
      },
      after = "nvim-web-devicons", -- keep this if you're using NvChad
      config = function()
        require("barbecue").setup()
      end,
    })

    -- ------------------------------ git ------------------------------------
    -- git plugin for running git commands with :git -- 'tpope/vim-fugitive'
    use {'tpope/vim-fugitive'}

    -- puts a git + or - in side line to show git changes in file
    -- 'airblade/vim-gitgutter'
    use {'airblade/vim-gitgutter'}

    -- ---------------- syntax highlighting installer ------------------------
    -- preferred colorscheme right now
    use {'space-chalk/spacechalk.vim'}

    use {'nvim-treesitter/nvim-treesitter'}
    -- I have this mostly for the :TSHighlightCapturesUnderCursor command
    -- https://github.com/nvim-treesitter/playground/pull/9
    use {'nvim-treesitter/playground'}

    -- This is helpful for markdown -- 'junegunn/limelight.config/vim'
    use {'junegunn/limelight.vim'}

    -- ---------------- Language Server Protocol Plugins ---------------------

    -- this helps to configure the built-in language server protocol for nvim
    use {'neovim/nvim-lspconfig'}
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}

    -- --------- completion for the above language servers and more ----------
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    -- emojis and nerfont icon completions
    use {'hrsh7th/cmp-emoji'}
    use {'chrisgrieser/cmp-nerdfont'}
    -- nvim lua api completion
    use {'hrsh7th/cmp-nvim-lua'}
    -- our preferred neovim autocompletion plugin
    use {'hrsh7th/nvim-cmp'}

    -- ------------------- fuzzy completion for files ------------------------
    -- telescope: extendable fuzzy finder over lists
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
         requires = {{'nvim-lua/plenary.nvim'} }
    }

    -- ------------------------- general linter ------------------------------
    -- will use common linters and highlight broken code
    use {'dense-analysis/ale'}

    -- --------------------- Language Specific Stuff -------------------------

    -- for highlighting hex colors (in vim, CSS, JS, HTML)
    use {'norcalli/nvim-colorizer.lua'}

    -- bash tab completion -- 'WolfgangMehner/bash-support' -- coc may replace?
    -- use {'WolfgangMehner/bash-support'}

    -- logging syntax and highlighting -- 'mtdl9/vim-log-highlighting'
    use {'mtdl9/vim-log-highlighting'}

    -- lua folding
    -- use{'anuvyklack/pretty-fold.nvim',
    -- config = function()
    --	require('pretty-fold').setup()
    -- end
    -- }

    -- terraform commands for neovim :)
    use {'hashivim/vim-terraform'}

    -- yaml syntax highlighting better -- 'stephpy/vim-yaml' treesitter may replace?
    -- use {'stephpy/vim-yaml'}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
