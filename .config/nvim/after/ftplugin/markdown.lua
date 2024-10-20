local autocmd = vim.api.nvim_create_autocmd

-- enable spellcheck for TXT (text) and MD (markdown) filetypes
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.txt", "*.md", "*.mdx"},
  callback = function()
        vim.cmd("set spell")
    end,
})
