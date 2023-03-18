-- installs lazy, our plugin manager for neovim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    -- ------------ makes sure the nerdfont icons and colorscheme ------------
    -- preferred colorscheme right now
    {'space-chalk/spacechalk.nvim', lazy = false },
    -- backup colorscheme in case everything is broken
    -- {'folke/tokyonight.nvim'},

    { 'nvim-tree/nvim-web-devicons', lazy = true },

    -- -------------------- startup screen for neovim ------------------------
    {'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    },

    -- cute halloween dashboard for neovim start screen :3
    -- {'folke/drop.nvim'},

    -- -------------------------- status line --------------------------------
    {'nvim-lualine/lualine.nvim',
         dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    },

    -- -------------------- floating window plugins --------------------------
    -- configurable floating terminal window, replaces 'hsalem7/nvim-k8s'
    {"numToStr/FTerm.nvim"},

    -- NeoVim UI toolkit that supports floating windows 
    {'MunifTanjim/nui.nvim'},

    -- ------------------------- file directory tree -------------------------
    -- nvim new nerdtree replacement
    {'nvim-tree/nvim-tree.lua',
         dependencies = {'nvim-tree/nvim-web-devicons'},
         tag = 'nightly'
    },

    -- ---------------- scroll bar for the right hand side -------------------
    {"petertriho/nvim-scrollbar"},

    -- ------------------------------ tab line -------------------------------
    {'romgrk/barbar.nvim', dependencies = 'nvim-tree/nvim-web-devicons'},

    -- ------------------ dimming inactive windows ---------------------------
    {'levouh/tint.nvim'},

    -- ------------------------------ git ------------------------------------
    -- git plugin for running git commands with :git -- 'tpope/vim-fugitive'
    {'tpope/vim-fugitive'},

    -- puts a git + or - in side line to show git changes in file
    {'lewis6991/gitsigns.nvim'},

    -- ---------------- syntax highlighting installer ------------------------

    {'nvim-treesitter/nvim-treesitter'},
    -- I have this mostly for the :TSHighlightCapturesUnderCursor command
    -- https://github.com/nvim-treesitter/playground/pull/9
    {'nvim-treesitter/playground'},

    -- because indenting is still broken in treesitter for python
    -- ref: https://github.com/nvim-treesitter/nvim-treesitter/issues/1136
    {"yioneko/nvim-yati",
         dependencies = "nvim-treesitter/nvim-treesitter"
    },

    -- This is helpful for markdown -- 'junegunn/limelight.config/vim'
    {'junegunn/limelight.vim'},

    -- for markdown tables
    {'dhruvasagar/vim-table-mode'},

    -- ---------------- Language Server Protocol Plugins ---------------------
    --
    -- --------- completion for the above language servers and more ----------
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    -- automatically type the closing }]"
    {'windwp/nvim-autopairs'},
    -- emojis and nerfont icon completions
    {'hrsh7th/cmp-emoji'},
    {'chrisgrieser/cmp-nerdfont'},
    -- nvim lua api completion
    {'hrsh7th/cmp-nvim-lua'},
    -- our preferred neovim autocompletion plugin
    {'hrsh7th/nvim-cmp'},

    -- this helps to configure the built-in language server protocol for nvim
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- ------------------- fuzzy completion for files ------------------------
    -- telescope: extendable fuzzy finder over lists
    {'nvim-telescope/telescope.nvim', tag = '0.1.0',
         dependencies = { {'nvim-lua/plenary.nvim'} },
    },

    -- --------------------- Language Specific Stuff -------------------------

    -- for highlighting hex colors (in vim, CSS, JS, HTML)
    {'norcalli/nvim-colorizer.lua'},

    -- logging syntax and highlighting -- 'mtdl9/vim-log-highlighting'
    {'mtdl9/vim-log-highlighting'},

    -- terraform commands for neovim :)
    {'hashivim/vim-terraform'},

    -- code location at top of window
    {
      "utilyre/barbecue.nvim",
      dependencies = {
        "SmiteshP/nvim-navic",
      },
      config = function()
        require("barbecue").setup({
                show_dirname = false,
                show_basename = false,
                context_follow_icon_color = true,
                kinds = {
                        File = "",
                        Module = "",
                        Namespace = "",
                        Package = "",
                        Class = "",
                        Method = "",
                        Property = "󰀭",
                        Field = "🌾",
                        Constructor = "󰬢",
                        Enum = "",
                        Interface = "",
                        Function = "󰊕",
                        Variable = "󰫧",
                        Constant = "",
                        String = "",
                        Number = "",
                        Boolean = "",
                        Array = "",
                        Object = "",
                        Key = "",
                        Null = "",
                        EnumMember = "",
                        Struct = "",
                        Event = "",
                        Operator = "",
                        TypeParameter = "",
                },
            })
      end
    },
}

require("lazy").setup(plugins)
