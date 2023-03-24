-- this file is for customizations for floating terminals in neovim

local fterm = require("FTerm")

-- create a vim command for FTermOpen
vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })

-- -------------------------- open normal terminal ----------------------------
-- cmatrix must be installed beforehand with brew install cmatrix
local cmatrix = fterm:new({
    ft = 'fterm_cmatrix',
    cmd = "cmatrix",
    env = {FTERM_TUI = 'True'},
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

vim.api.nvim_create_user_command(
    'Matrix',
    function()
        cmatrix:toggle()
    end,
    { bang = true }
)


-- ---------------------------- open gitui -----------------------------------
-- gitui must be installed beforehand with brew install gitui
local gitui = fterm:new({
    ft = 'fterm_gitui',
    cmd = "gitui",
    env = {FTERM_TUI = 'True'},
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})


vim.api.nvim_create_user_command(
    'Gitui',
    function()
        gitui:toggle()
    end,
    { bang = true }
)


-- ------------------------------ open k9s -----------------------------------
-- install k9s beforehand: https://k9scli.io/topics/install/
local k9s = fterm:new({
    ft = 'fterm_k9s',
    cmd = "k9s",
    env = {FTERM_TUI = 'True'},
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

vim.api.nvim_create_user_command(
    'K9s',
    function()
        k9s:toggle()
    end,
    { bang = true }
)


-- ------------------------------ open bpython -------------------------------
-- install bpython beforehand: brew install bpython 
local bpython = fterm:new({
    ft = 'fterm_bpython',
    cmd = "bpython",
    env = {FTERM_TUI = 'True'},
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

vim.api.nvim_create_user_command(
    'Bpython',
    function()
        bpython:toggle()
    end,
    { bang = true }
)
