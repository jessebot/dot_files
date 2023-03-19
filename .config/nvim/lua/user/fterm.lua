-- this file is for customizations for floating terminals in neovim

local fterm = require("FTerm")

-- create a vim command for FTermOpen
vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })

-- CTRL+t keybindings to toggle terminal
vim.keymap.set('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')


-- -------------------------- open normal terminal ----------------------------
-- cmatrix must be installed beforehand with brew install cmatrix
local cmatrix = fterm:new({
    ft = 'fterm_cmatrix',
    cmd = "cmatrix",
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
