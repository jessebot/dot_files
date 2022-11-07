--                                  Ale:
--      linter for warning and errors, using *existing* linter tools
vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
vim.g.ale_sign_error = ''
vim.g.ale_sign_warning = '⚠'
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_enabled = 1
vim.g.ale_fix_on_save = 1
-- this doesn't seem to work for python right now
vim.cmd[[
let g:ale_fixers = {
\   'python': ['autoflake'],
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
]]
