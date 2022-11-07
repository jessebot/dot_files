
--                             FOLDING ZONE:
--                 collapse an entire block or function
-- ---------------------------------------------------------------------------
-- Enable folding on base indent
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
-- also allow me to see the doc strings
vim.g.SimpylFold_docstring_preview=1
-- enable folding for markdown?
vim.g.markdown_folding = 1
-- let spacebar allow me to fold the code
-- nnoremap <space> za
vim.keymap.set('n', '<space>', 'za')
