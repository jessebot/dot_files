-- Set barbar's options
require("bufferline").setup({
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = true,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Enables / disables diagnostic symbols
  diagnostics = {
    -- you can use a list
    {enabled = true, icon = '󰋔'}, -- ERROR
    {enabled = false, icon = ''}, -- WARN
    {enabled = false, icon = ''}, -- INFO
    {enabled = true, icon = '󰌵'},  -- HINT
  },

  -- Excludes buffers from the tabline
  exclude_ft = {'dashboard', 'TelescopePrompt'},
  -- exclude_name = {'package.json'},

  -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
  hide = {extensions = true, inactive = false},

  -- Disable highlighting alternate buffers
  highlight_alternate = false,

  -- Disable highlighting file icons in inactive buffers
  highlight_inactive_file_icons = false,

  -- Enable highlighting visible buffers
  highlight_visible = true,

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '󰅗',
  icon_close_tab_modified = '󰽃',
  icon_pinned = '',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 2,

  -- Sets the minimum padding width with which to surround each tab
  minimum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
})
require("barbecue").setup({
  theme = {
      normal = { bg = "NONE", fg = "#bdd8ff" },

      ellipsis = { fg = "#585858" },
      separator = { fg = "#585858" },
      context_operator = { fg = "#fdcd36" },

      modified = { fg = "#ff8d87" },

      context = { fg = "#bdd8ff" },
      basename = { fg = "#bdd8ff", bold = true },
      context_file = { fg = "#bdd8ff" },
      dirname = { fg = "#bdd8ff" },

      context_null = { fg = "#585858" },

      context_string = { fg = "#a8fd57" },
      context_number = { fg = "#f7fb53" },
      context_boolean = { fg = "#fdcd36" },
      context_type_parameter = { fg = "#C1FF87" },

      context_variable = { fg = "#2569aa" },
      context_constant = { fg = "#2ac3de" },
      context_property = { fg = "#5cc9fd" },

      context_module = { fg = "#5f87ff" },
      context_class = { fg = "#7aa2f7" },
      context_function = { fg = "#3d59a1" },
      context_method = { fg = "#6DF2E5" },

      context_namespace = { fg = "#f7fb53" },
      context_package = { fg = "#737aa2" },
      context_field = { fg = "#a3a8f8" },
      context_constructor = { fg = "#565f89" },
      context_enum = { fg = "#f289f9" },
      context_interface = { fg = "#fdcd36" },
      context_array = { fg = "#7dcfff" },
      context_object = { fg = "#d092fc" },
      context_key = { fg = "#5cc9fd" },
      context_enum_member = { fg = "#a8fd57 " },
      context_struct = { fg = "#d092fc" },
      context_event = { fg = "#ff8d87" },
    }
})
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
    lualine_y = {
      'diagnostics',
      'progress',
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
    lualine_z = {
      {
        function()
          return " " .. os.date("%R")
        end,
      },
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
-- this file is for customizations for floating terminals in neovim

local fterm = require("FTerm")

-- create a vim command for FTermOpen
vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })

-- -------------------------- open normal terminal ----------------------------
-- cmatrix must be installed beforehand with brew install cmatrix
local cmatrix = fterm:new({
    ft = 'fterm_cmatrix',
    cmd = "cmatrix",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

vim.api.nvim_create_user_command(
    'Matrix',
    function()
        cmatrix:toggle()
    end,
    { bang = true }
)


-- ---------------------------- open gitui -----------------------------------
-- gitui must be installed beforehand with brew install gitui
local gitui = fterm:new({
    ft = 'fterm_gitui',
    cmd = "gitui",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})


vim.api.nvim_create_user_command(
    'Gitui',
    function()
        gitui:toggle()
    end,
    { bang = true }
)


-- ------------------------------ open k9s -----------------------------------
-- install k9s beforehand: https://k9scli.io/topics/install/
local k9s = fterm:new({
    ft = 'fterm_k9s',
    cmd = "k9s",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

vim.api.nvim_create_user_command(
    'K9s',
    function()
        k9s:toggle()
    end,
    { bang = true }
)


-- https://github.com/nvim-neo-tree/neo-tree.nvim
require("neo-tree").setup(
    {
        close_if_last_window = true, -- Close Neo-tree if it's last window
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        icon = {
            folder_closed = " ",
            folder_open = " ",
            folder_empty = " ",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "",
            highlight = "NeoTreeFileIcon"
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              -- Change type
              added     = " ", -- redundant info if you use git_status_colors on the name
              modified  = " ", -- redundant info if you use git_status_colors on the name
              deleted   = " ",-- can only be used in the git_status source
              renamed   = " ",-- can only be used in the git_status source
              -- Status type
              untracked = " ",
              ignored   = " ",
              unstaged  = " ",
              staged    = " ",
              conflict  = " ",
            }
          },
        }
)
require("scrollbar").setup({
    excluded_filetypes = {
        "prompt",
        "TelescopePrompt",
        "dashboard",
        "dashboardPrompt"
    },
    set_highlights = false,
    handlers = {
        cursor = true,
        diagnostic = true,
        handle = true,
        gitsigns = true,
        -- search = false, -- Requires hlslens
    },
    marks = {
        Error = {
            text = { "!", "!" },
            priority = 2,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = { "", "" },
            priority = 3,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "DiagnosticVirtualTextWarn",
        },
        GitAdd = {
            text = "┆",
            priority = 7,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsAdd",
        },
        GitChange = {
            text = "┆",
            priority = 7,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsChange",
        },
        GitDelete = {
            text = "▁",
            priority = 7,
            gui=nil,
            color = nil,
            cterm=nil,
            color_nr = nil, -- cterm
            highlight = "GitSignsDelete",
        },
    }
})
