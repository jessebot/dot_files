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

-- Use this to toggle cmatrix in a floating terminal
-- normal mode keys: <Space> + M
vim.keymap.set('n', '<leader>M', '<cmd>Matrix<cr>', { desc = "c the matrix 󰘨 " })


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

-- Use this to toggle gitui in a floating terminal
-- normal mode keys: <Space> + g
vim.keymap.set('n', '<leader>g', '<cmd>Gitui<cr>', { desc = "Git TUI  " })

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

-- Use this to toggle k9s in a floating terminal
-- firt arg of 'n' is for normal mode
-- <A-b> are keys: Alt + b (alt is option on macOS)
vim.keymap.set('n', '<A-b>', function()
    k9s:toggle()
end)

vim.api.nvim_create_user_command(
    'K9s',
    function()
        k9s:toggle()
    end,
    { bang = true }
)

-- Use this to toggle k9s in a floating terminal
-- normal mode keys: <Space> + k
vim.keymap.set('n', '<leader>k', '<cmd>K9s<cr>', { desc = "k9s - kubernetes dashboard TUI 󱃾 " })
