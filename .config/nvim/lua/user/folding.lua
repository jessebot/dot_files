
--                             FOLDING ZONE:
--                 collapse an entire block or function
-- ---------------------------------------------------------------------------

-- also allow me to see the doc strings
-- vim.g.SimpylFold_docstring_preview=1
-- enable folding for markdown?
-- vim.g.markdown_folding = 1

vim.opt.foldmethod     = "expr"
vim.opt.foldexpr       = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99

-- let spacebar allow me to fold the code
vim.keymap.set('n', '<space>', 'za')
