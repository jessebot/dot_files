local autocmd = vim.api.nvim_create_autocmd

-- only set 81 character line limit on Python, Go, YAML, and shell scripts
autocmd({"BufEnter", "BufWinEnter"}, {
  callback = function()
        -- highlighted column 81, to keep lines to average terminal size
        vim.opt.colorcolumn = '81'
  end,
})
