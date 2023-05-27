-- --------------------------------------------------------------------------
--                              INDENT ZONE
-- --------------------------------------------------------------------------
vim.opt.tabstop = 4
-- vim.opt.tabstop     = 8
vim.opt.softtabstop = 2
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.autoindent  = true

-- Enable file type detection. Use the default filetype settings, so that mail
-- gets 'tw' set to 72, 'cindent' is on in C files, etc.
-- Also load indent files, to automatically do language-dependent indenting.
-- filetype plugin indent on

-- from https://github.com/lukas-reineke/indent-blankline.nvim#screenshots
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#47476c gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#5b5b8b gui=nocombine]]

vim.opt.list = true
-- add a dot in blank spaces for indents
-- vim.opt.listchars:append "space:⋅"

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    -- :echo &filetype
    filetype_exclude = {
        "dashboard"
    }
}
