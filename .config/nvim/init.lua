-- sometimes neovim can't remember where python is if you install with linuxbrew
-- if vim.loop.os_uname().sysname == 'Linux'
--	then
--    vim.g.python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3.11'
-- end

-- turn off the mouse scrolling because it is confusing
vim.opt.mousescroll = 'ver:0,hor:0'

-- line numbers for debugging and screen sharing, takes up 4 columns
vim.opt.number = true
vim.opt.numberwidth = 4

-- highlight current line
vim.opt.cursorline = true

-- vim.opt.termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- make searching case insensitive
vim.opt.ignorecase = true
-- make searching case sensitive if at least one character is cap
vim.opt.smartcase = true

-- load plugins
require('user.lazy')

-- --------- Plugin configs that have to be called after lazy --------------
-- starting page for neovim - dashbaord plugin
require('user.dashboard')

-- tab line at top of window for tabs when there's more than one tab :) -- might switch to bufferline
require('user.barbar')

-- status line at bottom of window for cool file facts
require('user.lualine')

-- directory tree; can open with :Neotree
require('user.neo-tree')

-- scrollbar on the right side of the screen that also shows errors
require("user.gitsigns")
require("user.scrollbar")

-- more configurable terminal for neovim
require("user.toggleterm")

-- Language Server configs and other syntax checking and highlight tools
require('user.lsp-configs')

-- Run startup autocommands
require('user.autocommands')

-- treesitter is for sytax highlighting
require('user.tree-sitter')

-- folding and indentation
require('user.indent')

-- completion from nvim-cmp
require('user.completion')

-- syntax highlighting for hex codes
require('user.nvim-colorizer')

-- experiment to give you a remote git permalink URL for your your current line
require('user.git_url')
