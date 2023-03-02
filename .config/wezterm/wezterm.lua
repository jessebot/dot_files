local wezterm = require 'wezterm'

return {
       warn_about_missing_glyphs = false,
       audible_bell = "Disabled",
       initial_cols = 162,
       initial_rows = 50,
       font_size = 15,
       hide_tab_bar_if_only_one_tab = true,
       window_decorations = "RESIZE",
       window_background_opacity = 0.95,
       -- default terminal colors
       colors = {
           background = '#232336',
           foreground = '#c0caf5',

           -- Overrides the cell background color when the current cell is occupied by the
           -- cursor and the cursor style is set to Block
           cursor_bg = '#97e178',
           -- Overrides the text color when the current cell is occupied by the cursor
           cursor_fg = 'black',
           -- Specifies the border color of the cursor when the cursor style is set to Block,
           -- or the color of the vertical or horizontal bar when the cursor style is set to
           -- Bar or Underline.
           cursor_border = '#6eb3ec',

           -- the foreground color of selected text
           selection_fg = 'black',
           -- the background color of selected text
           selection_bg = '#f6f76a',

           -- The color of the scrollbar "thumb"; the portion that represents the current viewport
           scrollbar_thumb = '#222222',

           -- The color of the split lines between panes
           split = '#444444',
           ansi = {
               '#282727',
               '#fe8ea2',
               '#97e178',
               '#f6f76a',
               '#6eb3ec',
               '#ef8ef6',
               '#86f0e4',
               '#dadfe0',
           },
           brights = {
               '#282727',
               '#fe8ea2',
               '#97e178',
               '#f6f76a',
               '#6eb3ec',
               '#ef8ef6',
               '#86f0e4',
               '#dadfe0',
           },
       },
}
