-- ------------------------ floating windows! --------------------------

-- open a floating window
vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
-- close a floating window
vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
-- or create a vim command
vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })


-- open a floating window with k9s (k8s dashboard TUI)
vim.api.nvim_create_user_command('K9s', function()
    require('FTerm').run('k9s')
end, { bang = true })
