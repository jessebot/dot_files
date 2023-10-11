-- --------------------------------------------------------------------------
--                              INDENT ZONE
-- --------------------------------------------------------------------------
vim.opt.tabstop     = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.autoindent  = true

-- Enable file type detection. Use the default filetype settings, so that mail
-- gets 'tw' set to 72, 'cindent' is on in C files, etc.
-- Also load indent files, to automatically do language-dependent indenting.
-- filetype plugin indent on

-- ref: https://github.com/lukas-reineke/indent-blankline.nvim

local highlight = {
    "DarkBlueGray",
    "BlueGray"
}

local hooks = require "ibl.hooks"

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "DarkBlueGray", { fg = "#47476c" })
    vim.api.nvim_set_hl(0, "BlueGray", { fg = "#5b5b8b" })
end)

require("ibl").setup {
    indent = { highlight = highlight },

    -- :echo &filetype
    exclude = {
        filetypes = {
            "dashboard"
        }
    }
}
