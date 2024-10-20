local autocmd = vim.api.nvim_create_autocmd

------------------------------------------------------------
-- Autocommands to run immediately for for ALL file types --
------------------------------------------------------------

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

-- disable lsp semantic highlighting for parameter/variable in
-- Dockerfile because it competes with treesitter and is worse
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"Dockerfile", "Dockerfile.*"},
  callback = function()
        vim.api.nvim_set_hl(0, '@lsp.type.parameter.dockerfile', {})
        vim.api.nvim_set_hl(0, '@lsp.type.variable.dockerfile', {})
    end,
})

-- set the file type to PHP if the extension is php.tpl
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {
        "*.php.tpl",
    },
  callback = function()
        vim.cmd("set filetype=php")
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
        vim.cmd("set filetype=helm")
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
        vim.cmd("set filetype=cfg")
    end,
})

-- set the file type to YAML for kubeconfig
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*/kubeconfig", "*/.config/kube/config"},
  callback = function()
        vim.cmd("set filetype=yaml")
    end,
})

-- set the file type to CSS for tcss
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.tcss"},
  callback = function()
        vim.cmd("set filetype=scss")
        vim.cmd("set foldmethod=indent")
    end,
})

-- only set 81 character line limit on Python, Go, YAML, and shell scripts
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.py", "*.go", "*.yaml", "*.sh"},
  callback = function()
        -- highlighted column 81, to keep lines to average terminal size
        vim.opt.colorcolumn = '81'
    end,
})

-- enable spellcheck for TXT (text) and MD (markdown) filetypes
autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.txt", "*.md", "*.mdx"},
  callback = function()
        vim.cmd("set spell")
    end,
})
