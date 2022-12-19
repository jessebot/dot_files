local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}

--  #E8FBFF bright white
--  #bdd8ff off blueish white
--  #ffaff9 light pink
--  #f289f9 neon magenta
--  #f2748a pale dark red
--  #ff8d87 soft redish orange
--  #fdcd36 light orange
--  #f7fb53 bright yellow
--  #f6f76a soft yellow
--  #C1FF87 soft green
--  #a8fd57 lime green
--  #5ac4b9 dark teal? (this color feels weird, maybe change it)
--  #6DF2E5 cyan
--  #5cc9fd blue
--  #5f87ff cornflower blue
--  #a3a8f8 medium cornflowerblue
--  #232336 blueish black
--  #1d2652 navy blue
--  #2569aa darker blue
--  #585858 gray
--  #3E3E3E darker gray
--  #323232 grayish black

local colors = {
  bg = '#232336',
  yellow = '#f7fb53',
  orange = '#fdcd36',
  purple = '#a3a8f8',
  green = '#a8fd57',
  cornflowerblue = '#5f87ff',
  magenta = '#f289f9',
  pink = '#ffaff9',
  grey = '#585858',
  grey46 = '#3E3E3E',
  blue = '#5cc9fd',
  red = '#f2748a'
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

--   "no": "N·OPER",
--   "s":  "lllllll,
--   "S":  "S·LINE",
--   "^S": "S·BLCK",
--   "ic": "I·COMP",
--   "ix": "I·C-X ",
--   "Rv": "V·RPLC",
--   "Rc": "R·COMP",
--   "Rx": "R·C-X ",
--   "cv": "VIM·EX",
--   "ce": "NRM·EX",
--   "r":  "PROMPT",
--   "rm": "-MORE-",
--   "r?": "CNFIRM",
--   "!":  "!SHELL",
--   "t":  "TERM  "
-- these are the colors for the first mode segment
local mode_colors = {n = colors.cornflowerblue,
		   i = colors.green,
		   c = colors.blue,
		   v = colors.magenta,
		   V = colors.pink,
                   R = colors.orange,
                   ['!'] = colors.orange,
		   [''] = colors.magenta}

gls.left[1] = {
  ViMode = {
    -- this determines the Name of the mode displayed
    provider = function()
      local alias = {n = 'normal',
                     i = ' insert',
		     c = ' cmd',
                     R = ' replace',
		     v = ' visual',
		     V = '  visual line',
		     ['!'] = '🐚 cmd',
		     [''] = ' visual block'}

      -- this sets the highlight colors of each vim mode
      vim.api.nvim_command('hi GalaxyViMode guibg='..mode_colors[vim.fn.mode()])
      vim.api.nvim_command('hi ViModeSeparator guifg='..mode_colors[vim.fn.mode()])
      return '  ' .. alias[vim.fn.mode()]
    end,

    -- separator icon and highlight color
    separator = ' ',
    separator_highlight = {colors.cornflowerblue,colors.grey46},

    -- default highlight for the whole mode
    highlight = {colors.grey46,colors.cornflowerblue,'bold'},
  },
}


gls.left[2] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.grey46},
  },
}

gls.left[3] = {
  FileName = {
    provider = {'FileName','FileSize'},
    condition = buffer_not_empty,
    separator = '',
    separator_highlight = {colors.grey46,colors.cornflowerblue},
    highlight = {colors.blue,colors.grey46}
  }
}

gls.left[4] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = buffer_not_empty,
    highlight = {colors.orange,colors.cornflowerblue},
  }
}

gls.left[5] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = buffer_not_empty,
    highlight = {colors.grey46,colors.cornflowerblue},
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[6] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.green,colors.cornflowerblue},
  }
}
gls.left[7] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.orange,colors.cornflowerblue},
  }
}
gls.left[8] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.red,colors.cornflowerblue},
  }
}

gls.left[9] = {
  LeftEnd = {
    provider = function() return '' end,
    separator = '',
    separator_highlight = {colors.cornflowerblue,colors.bg},
    highlight = {colors.cornflowerblue,colors.cornflowerblue}
  }
}

gls.left[10] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}

gls.left[11] = {
  Space = {
    provider = function () return ' ' end
  }
}

gls.left[12] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}

gls.right[1] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {colors.bg,colors.cornflowerblue},
    highlight = {colors.grey46,colors.cornflowerblue},
  },
}

gls.right[2] = {
  PerCent = {
    provider = 'LinePercent',
    separator = '',
    separator_highlight = {colors.grey46,colors.cornflowerblue},
    highlight = {colors.blue,colors.grey46},
  }
}

gls.right[3] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.green,colors.cornflowerblue},
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = '',
    separator_highlight = {colors.cornflowerblue,colors.bg},
    highlight = {colors.grey,colors.cornflowerblue}
  }
}


gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = '',
    separator_highlight = {colors.cornflowerblue,colors.bg},
    highlight = {colors.grey,colors.cornflowerblue}
  }
}
