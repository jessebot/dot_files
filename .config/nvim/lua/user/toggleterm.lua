-- this file is for customizations for terminal windows in neovim
require("toggleterm").setup{
    -- configuration
    highlights = {
        -- highlights which map to a highlight group name and a table of it's values
        -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        Normal = {
          guibg = "LualineGitAdd",
        },
    },
}

local Terminal = require('toggleterm.terminal').Terminal

-- -------------------------- open normal terminal ----------------------------
-- cmatrix must be installed beforehand with brew install cmatrix
local cmatrix = Terminal:new({
	cmd = "cmatrix",
	direction = "float",
	close_on_exit = true,
	env = {
	    NVIM_TOGGLE_TERM = 'True'
	},
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
local gitui = Terminal:new({
	cmd = "gitui",
	direction = "float",
	close_on_exit = true,
	env = {
	    NVIM_TOGGLE_TERM = 'True'
	},
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
local k9s = Terminal:new({
	cmd = "k9s",
	direction = "float",
	close_on_exit = true,
	env = {
	    NVIM_TOGGLE_TERM = 'True'
	},
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
local bpython = Terminal:new({
	cmd = "bpython",
	direction = "float",
	close_on_exit = true,
	env = {
	    NVIM_TOGGLE_TERM = 'True'
	},
})

vim.api.nvim_create_user_command(
    'Bpython',
    function()
        bpython:toggle()
    end,
    { bang = true }
)
