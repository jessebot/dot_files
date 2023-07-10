-- installs lazy, our plugin manager for neovim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        }
    )
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- ------------ makes sure the nerdfont icons and colorscheme ------------
    -- preferred colorscheme right now
    {
        'space-chalk/spacechalk.nvim',
        lazy = false, -- loaded during startup since it's the main colorscheme
        priority = 1000, -- load this before all other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd.colorscheme('spacechalk')
            vim.g.colors_name = 'spacechalk'
        end,
    },
    -- -------------------- startup screen for neovim ------------------------
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        }
    },
    -- -------------------------- status line --------------------------------
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        priority = 900, -- load this b4 all other plugins, except colorscheme
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- --------------- fancy terminal, use CTRL+t to try it out --------------
    {
      {
	'akinsho/toggleterm.nvim',
	version = "*",
	opts = {--[[ things you want to change go here]]}
      }
    },

    -- -------------------- floating window plugins --------------------------
    -- -----------------------------------------------------------------------
    -- noicer ui - experimental
    {
        "folke/noice.nvim",
        enabled = false,
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                },
            },
            presets = {
                -- bottom_search = true,
                -- command_palette = true,
                long_message_to_split = true,
            },
        },
        -- stylua: ignore
        keys = {
            {
                "<S-Enter>",
                function()
                    require("noice").redirect(vim.fn.getcmdline())
                end,
                mode = "c",
                desc = "Redirect Cmdline"
            },
            {
                "<leader>nl",
                function()
                    require("noice").cmd("last")
                end,
                desc = "Noice Last Message"
            },
            {
                "<leader>nh",
                function()
                    require("noice").cmd("history")
                end,
                desc = "Noice History"
            },
            {
                "<leader>na",
                function()
                    require("noice").cmd("all")
                end,
                desc = "Noice All"
            },
            {
                "<c-f>",
                function()
                    if not require("noice.lsp").scroll(4) then return "<c-f>" end
                end,
                silent = true,
                expr = true,
                desc = "Scroll forward",
                mode = {"i", "n", "s"}
            },
            {
                "<c-b>",
                function()
                    if not require("noice.lsp").scroll(-4) then return "<c-b>" end
                end,
                silent = true,
                expr = true,
                desc = "Scroll backward",
                mode = {"i", "n", "s"}
            },
        },
    },
    -- ------------------ sidebar file directory tree -----------------------
    {
        'nvim-neo-tree/neo-tree.nvim',
        cmd = "Neotree",
        branch = "v2.x",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
    },
    -- ---------------- scroll bar for the right hand side -------------------
    {
        "petertriho/nvim-scrollbar"
    },
    -- ------------------------------ tab line -------------------------------
    {
        'romgrk/barbar.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons'},
        lazy = true,
    },
    -- code refence at top of window
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons"
        },
        opts = {
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
        },
    },
    -- ------------------ dimming inactive windows ---------------------------
    {
        'levouh/tint.nvim',
        opts = function()
            require("tint").setup()
        end
    },

    -- puts a git + or - in side line to show git changes in file
    {
        'lewis6991/gitsigns.nvim'
    },
    -- ---------------- syntax highlighting installer ------------------------
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        priority = 700, -- load this after colorscheme, statusline, and lsp
        config = function()
            vim.opt.foldmethod     = "expr"
            vim.opt.foldexpr       = "nvim_treesitter#foldexpr()"
            vim.opt.foldlevelstart = 99
        end,
        build = "TSUpdateSync"
    },
    -- add visual lines for indentation
    {
        "lukas-reineke/indent-blankline.nvim"
    },
    -- because indenting is still broken in treesitter for python
    -- ref: https://github.com/nvim-treesitter/nvim-treesitter/issues/1136
    {
        "yioneko/nvim-yati",
        dependencies = "nvim-treesitter/nvim-treesitter"
    },
    -- to dim surround code 'junegunn/limelight.config/vim'
    -- {'junegunn/limelight.vim'},
    -- this replaces limelight, still in testing phase
    {
        'folke/twilight.nvim'
    },
    -- for markdown tables -- maybe not working?
    {
        'dhruvasagar/vim-table-mode'
    },

    -- markdown table of contents generator
    {
        'mzlogin/vim-markdown-toc'
    },

    -- formatting helm charts properly
    {
        'towolf/vim-helm',
        ft = {'helm'},
    },
    -- ---------------- Language Server Protocol Plugins ---------------------
    -- snippets
    {
        "L3MON4D3/LuaSnip",
        build = (not jit.os:find("Windows"))
            and "echo -e 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
            or nil,
        dependencies = {
            "rafamadriz/friendly-snippets",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load()
            end,
        },
        opts = {
            history = true,
            delete_check_events = "TextChanged",
        },
        -- stylua: ignore
        keys = {
            {
                "<tab>",
                function()
                  return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
                end,
                expr = true,
                silent = true,
                mode = "i",
            },
            {
                "<tab>",
                function()
                    require("luasnip").jump(1)
                end,
                mode = "s"
            },
            {
                "<s-tab>",
                function()
                    require("luasnip").jump(-1)
                end,
                mode = { "i", "s" }
            },
        },
    },
    -- --------- completion for the above language servers and more ----------
    -- our preferred neovim autocompletion plugin
    {
        'hrsh7th/nvim-cmp',
        -- load cmp on InsertEnter
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            -- emojis and nerfont icon completions
            'hrsh7th/cmp-emoji',
            'chrisgrieser/cmp-nerdfont',
            -- nvim lua api completion
            'hrsh7th/cmp-nvim-lua'
        },
    },
    -- this helps to configure the built-in language server protocol for nvim
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        priority = 800, -- load this after colorscheme and statusline
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        cmd = "TSUpdateSync",
        build = "MasonUpdate" -- :MasonUpdate updates registry contents
    },
    -- Diagnostics with leader key + d
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        cmd = {
            'Trouble',
            'TroubleToggle'
        },
        opts = function()
          require("trouble").setup {
            -- leave it empty to use the default settings
          }
        end
    },
    -- ------------------- fuzzy completion for files ------------------------
    -- telescope: extendable fuzzy finder over lists
    {
        'nvim-telescope/telescope.nvim',
        version = false, -- telescope did only one release, so use HEAD for now
        -- tag = '0.1.1', -- latest we've seen
        cmd = "Telescope",
        dependencies = {'nvim-lua/plenary.nvim'},
        key = {
            {
                "<leader>:",
                "<cmd>Telescope commands<cr>",
                desc = "All Commands"
            },
            {
                "<leader>H",
                "<cmd>Telescope highlights<cr>",
                desc = "Highlight groups for the current buffer"
            },
            {
                "<leader>h",
                "<cmd>Telescope command_history<cr>",
                desc = "Command History"
            },
            {
                "<leader>ff",
                "<cmd>Telescope files<cr>",
                desc = "Find Files (cwd)"
            },
            {
                "<leader>fr",
                "<cmd>Telescope oldfiles<cr>",
                desc = "Files Recently Opened in Neovim"
            },
        },

    },
    -- --------------------- Language Specific Stuff -------------------------
    -- for highlighting hex colors (in vim, CSS, JS, HTML)
    {
        'norcalli/nvim-colorizer.lua',
        ft = {'css', 'lua'},
    },
    -- logging syntax and highlighting -- 'mtdl9/vim-log-highlighting'
    {
        'mtdl9/vim-log-highlighting'
    },
    -- terraform commands for neovim :)
    {
        'hashivim/vim-terraform',
        ft = "terraform",
    },
    -- search/replace in multiple files -- untested
    {
      "windwp/nvim-spectre",
      lazy = true,
      -- stylua: ignore
    },
    -- a help menu for which key does what
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require('user.keymap')
            require("which-key").setup({})
        end,
    },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = true
    },
}

require("lazy").setup(plugins)
