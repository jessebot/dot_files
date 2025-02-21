local autocmd = vim.api.nvim_create_autocmd

------------------------------------------------------------
-- Autocommands to run immediately for for ALL file types --
------------------------------------------------------------

-- on file enter, set file format to unix
autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*"},
    callback = function()
      -- verify the buffer is modifiable before setting fileformat
      local modifiable = vim.api.nvim_buf_get_option(0, 'modifiable')
      if modifiable then
          vim.cmd("set fileformat=unix")
      end
    end,
})

-- delete whitespace on save - https://vi.stackexchange.com/a/41388
autocmd({ "BufWritePre", "ExitPre" }, {
    pattern = {"*"},
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})

-------------------------------------------------------------
-- Autocommands to run immediately for SPECIFIC file types --
-------------------------------------------------------------

-- set file type to dockerfile if Dockerfile anywhere in the file name
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"Dockerfile*"},
  callback = function()
      vim.bo.filetype = "dockerfile"
  end,
})

-- set the file type to PHP if the extension is php.tpl
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {
        "*.php.tpl",
  },
  callback = function()
      vim.bo.filetype = "php"
  end,
})

-- set the file type to helm based on files ending in tpl
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {
        "*/templates/*.tpl",
        "*/templates/*.yaml",
        "*/.github/workflows/*.yaml",
        "*/.github/workflows/*.yml",
    },
  callback = function()
      vim.bo.filetype = "helm"
  end,
})

-- this catches any stray helm files that weren't where we expected them
autocmd("FileType", {
  pattern = { "mustache" },
  callback = function()
    if vim.fn.expand("%:e") == "tpl" then
      vim.bo.filetype = "helm"
    end
  end,
})

-- set the file type to cfg for wireguard configs
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*/etc/wireguard/wg*.conf"},
  callback = function()
      vim.bo.filetype = "cfg"
  end,
})

-- set the file type to YAML for kubeconfig files and helm chart lock files
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*/kubeconfig", "*/.config/kube/config", "Chart.lock"},
  callback = function()
      vim.bo.filetype = "yaml"
  end,
})

-- set the file type to CSS for tcss
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.tcss"},
  callback = function()
      vim.bo.filetype = "scss"
      vim.cmd("set foldmethod=indent")
  end,
})

-- set TXT (text files) to filetype markdown
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.txt"},
  callback = function()
      vim.bo.filetype = "markdown"
  end,
})

-- set file type to groovy if Jenkinsfile is the file name
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"Jenkinsfile"},
  callback = function()
      vim.bo.filetype = "groovy"
  end,
})
