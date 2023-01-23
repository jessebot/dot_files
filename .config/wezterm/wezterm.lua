local wezterm = require 'wezterm'

return {
       warn_about_missing_glyphs = false,
       audible_bell = "Disabled",
       initial_cols = 120,
       initial_rows = 36,
       font_size = 12,
       hide_tab_bar_if_only_one_tab = true,
       window_decorations = "RESIZE",
       window_background_opacity = 0.8,
       -- default terminal colors
       colors = {
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
