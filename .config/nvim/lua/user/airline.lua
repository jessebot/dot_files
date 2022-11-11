--                               Airline:
--               A pure vim script status line for vim
-- ------------------------------------------------------------------------

-- use custome space_chalk theme :)
vim.g.airline_theme = 'space_chalk'

-- use powerline fonts
vim.g.airline_powerline_fonts = 1

-- don't show the section if it's not in use e.g. error section
vim.g.airline_skip_empty_sections = 1

-- put ALE errors in our status line
vim.cmd [[let g:airline#extensions#ale#enabled = 1]]

-- changing separators to match personal powerline for shell
vim.g.airline_left_sep = ' '
vim.g.airline_right_sep = ''

-- this is a smaller more consise final airline segment
vim.cmd [[
    function! LinePercent()
        return line('.') * 100 / line('$') . '%'
    endfunction
]]

vim.g.airline_section_z = ' %l (%{LinePercent()})  %v'
