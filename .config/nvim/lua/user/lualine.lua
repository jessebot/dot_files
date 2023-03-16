-- Bubbles config for lualine
-- original author: lokesh-krishna
-- MIT license

--- Background for branch and file format blocks
--- s:gui_termbg      = '#585858'
--- Foreground for branch and file format blocks
--- s:gui_termfg      = '#c2ff87'

--- Background for middle block
--- s:gui_termbg2     = '#3E3E3E'
--- Foreground for middle block
--- s:gui_termfg2     = '#5f87ff'

--- Background for normal mode and file position blocks
--- s:gui_normalbg    = '#5F87FF'
---  Foreground for normal mode and file position blocks
--- s:gui_normalfg    = '#323232'

--- Background for insert mode and file position blocks
--- s:gui_insertbg    = '#a8fd57'
--- Foreground for insert mode and file position blocks
--- s:gui_insertfg    = '#1d2652'

--- Background for visual mode and file position blocks
--- s:gui_visualbg    = '#2569aa'
---  Foreground for visual mode and file position blocks
--- s:gui_visualfg    = '#a8fd57'

--- Background for replace mode and file position blocks
--- s:gui_replacebg   = '#f289f9'
---  Foreground for replace mode and file position blocks
--- s:gui_replacefg   = '#323232'

--- Modified file alert color
--- s:gui_alert       = '#fdcd36'

--- Background for inactive mode
--- s:gui_inactivebg   = '#232336'
--- Foreground for inactive mode
--- s:gui_inactivefg   = '#585858'

--- this is for all warnings and errors in the final section
--- s:WARNING = [ "#323232", "#f6f76a", 237, 226 ]
--- s:ERROR = [ "#323232", "#f289f9", 15, 167 ]

-- stylua: ignore
local colors = {
  black  = '#232336',
  blue   = '#5F87FF',
  cyan   = '#79dac8',
  green  = '#a8fd57',
  grey   = '#303030',
  red    = '#ff5189',
  violet = '#d183e8',
  white  = '#c6c6c6',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.green } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch', 'diff' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'diagnostics', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
