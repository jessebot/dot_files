-- disable netrw at the very start of your init.lua (strongly advised)
-- nvim-tree requires this
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

-- highlight current line - very useful, shouldn't turn off, you will be lost
vim.opt.cursorline = true

-- highlighted column 80, only on python files, to keep lines shorter
vim.opt.colorcolumn = '80'

-- vim.opt.termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- do not try to indent the starting dashboard
vim.g.indentLine_fileTypeExclude = [['dashboard']]

-- both of these are required to make packer, our plugin manager, work
require('plugins')
vim.cmd.source("~/.config/nvim/packerinit.vim")

-- Colors need to be enabled after the plugins, because the colors are a plugin
vim.cmd.colorscheme('spacechalk')
vim.g.colors_name = 'spacechalk'

-- --------- these are plugin configs for plugins imported by packer ---------
require('user.nvim-colorizer')
require('user.nvim-tree')
require('user.tree-sitter')
require('user.ale')
require('user.airline')
require('user.dashboard')
require('user.folding')
