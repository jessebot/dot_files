-- disable lsp semantic highlighting for parameter/variable in
-- Dockerfile because it competes with treesitter and is worse
vim.api.nvim_set_hl(0, '@lsp.type.parameter.dockerfile', {})
vim.api.nvim_set_hl(0, '@lsp.type.variable.dockerfile', {})
