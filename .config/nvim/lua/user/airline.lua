--                               Airline:
--               A pure vim script status line for vim
-- ------------------------------------------------------------------------

-- use custome space_chalk theme :)
vim.g.airline_theme='space_chalk'
-- use powerline fonts
vim.g.airline_powerline_fonts = 1
-- changing separators to match personal powerline for shell
vim.g.airline_left_sep = ' '
vim.g.airline_right_sep = ' '

-- this is a smaller more consise final airline segment
-- function! LinePercent()
--     return line('.') * 100 / line('$') . '%'
-- endfunction
-- let g:airline_section_z = ' %l (%{LinePercent()})  %v'
