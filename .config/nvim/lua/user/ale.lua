--                                  ALE:
--      linter for warning and errors, using *existing* linter tools
-- --------------------------------------------------------------------
-- always enabled by default
vim.g.ale_enabled = 1

-- so we know what exactly about ale is complaining
vim.g.ale_echo_msg_error_str = ''
vim.g.ale_echo_msg_warning_str = ''
vim.g.ale_echo_msg_format = '%severity% ALE: [%linter%]: %s'

-- prettier error/warning signs for the sign column
vim.g.ale_sign_error = ''
vim.g.ale_sign_warning = ''

-- speed up ALE
vim.g.ale_lint_on_text_changed = 'never'

vim.cmd[[
let g:ale_linters = {
\   'python': ['ruff', 'flake8'],
\}
]]

-- this doesn't seem to work for python right now
vim.cmd[[
let g:ale_fixers = {
\   'python': ['ruff'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
]]
-- automatically apply above fixers
vim.g.ale_fix_on_save = 1

-- TODO: how do you do these in lines below in lua?
-- put errors in our status line
vim.cmd [[let g:airline#extensions#ale#enabled = 1]]

-- map the keys Ctrl+j and Ctrl+k to moving between errors
-- this doesn't seem to work?
vim.cmd [[nmap <silent> <C-k> <Plug>(ale_previous_wrap)]]
vim.cmd [[nmap <silent> <C-j> <Plug>(ale_next_wrap)]]
