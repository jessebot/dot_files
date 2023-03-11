-- this file is for customizations for floating terminals in neovim

local fterm = require("FTerm")

-- --------------- open gitui (must be installed beforehand) -----------------
local gitui = fterm:new({
    ft = 'fterm_gitui',
    cmd = "gitui",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

-- Use this to toggle gitui in a floating terminal
-- firt arg of 'n' is for normal mode
-- <A-g> are keys: Alt + g (alt is option on macOS)
vim.keymap.set('n', '<A-g>', function()
    gitui:toggle()
end)


-- --------------- open k9s (must be installed beforehand) -----------------

local k9s = fterm:new({
    ft = 'fterm_k9s',
    cmd = "k9s",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

-- Use this to toggle gitui in a floating terminal
-- firt arg of 'n' is for normal mode
-- <A-k> are keys: Alt + k (alt is option on macOS)
vim.keymap.set('n', '<A-k>', function()
    k9s:toggle()
end)
