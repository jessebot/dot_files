-- do not try to indent the starting dashboard
vim.g.indentLine_fileTypeExclude = [['dashboard']]

local db = require("dashboard")

-- ⣿ ⣿  c o l o r s  ⣿ ⣿ --
local icon_color = 'Keyword'
local keymap_color = 'Function'
local description_color = 'String'

-- for printing the neovim version under the image
local version = vim.version()

db.setup({
    theme = 'doom',
    config = {
        header = {
          '                                                  ',
          '                                                  ',
          os.date("  %A, %d-%m-%Y  %H:%M"),
          '                                                  ',
          ' ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
          ' ⣿⣿⣿⠿⢛⡛⣛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
          ' ⣶⣾⣷⣿⣿⣶⣶⣤⣌⣙⣛⡻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
          ' ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣬⡙⠿⠿⠟⠛⢛⣛⠛⠛⠛⠛⠻⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
          ' ⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢛⣉⣩⣵⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣶⣦⣍⣉⣙⡛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟ ',
          ' ⣿⣿⣿⣿⣿⡿⠟⣫⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⠉⠛⣿⣿⣿⣿⣿⣿⡟⢠ ',
          ' ⣿⣿⡟⢉⣱⡶⢟⣉⢥⣮⣭⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣮⣙⠿⠿⠿⠛⢡⣿ ',
          ' ⡿⢋⣴⣿⡏⣠⣿⡁⠀⢸⣿⣿⡎⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⣰⣿⣿ ',
          ' ⣴⣿⣿⣿⡇⠹⣿⣿⣿⣿⡿⢟⣼⣿⣿⣿⣿⠿⠟⣛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡙⣿ ',
          ' ⣿⣿⣿⣿⣿⣷⣬⣭⠭⠵⠶⠿⣟⣛⣭⣷⣶⣴⣿⣟⣻⣦⡝⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢫⣵⣶⠶⢶⣮⣍⢻⣿⣿⣿⣎ ',
          ' ⣿⣿⣿⣿⢻⣭⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣅⠀⢀⣿⣿⡇⢻⣿⣿⣿ ',
          ' ⣿⣿⣿⣿⣮⡃⢀⡀⠀⠀⠀⠀⠉⠛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣮⣍⡻⢿⣿⣿⣿⣿⣿⣧⡹⣿⣿⣿⣿⣿⣿⢇⣾⣿⣿⣿ ',
          ' ⣿⣿⣿⣿⣿⣿⣦⣙⠿⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠛⠿⣿⣿⣿⣿⣷⣬⡻⣿⣿⣿⣿⣷⣮⣭⣉⣉⣩⣴⣿⣿⣿⣿⣿ ',
          ' ⣿⣿⣿⣿⣿⣿⣿⣿⣷⣬⡻⡓⠦⣤⣤⣤⣄⣀⣀⣀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⢿⣿⣎⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
          ' ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡘⠷⣶⣾⣿⣿⡿⠿⠿⠿⢿⣟⣛⣛⣛⣛⣛⣉⣭⣭⣭⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
          ' ⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⡻⣭⣶⣦⣤⣤⣴⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
          ' ⣿⣿⣿⣿⣿⣿⣿⠿⢋⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣫ ',
          ' ⣿⣿⣿⣿⣿⣿⣿⣿⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣵⣿⣿ ',
          ' ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢏⣴⣿⣿⣿⣿ ',
          ' ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢡⣿⣿⣿⣿⣿⣿ ',
          '                                                  ',
          "N E O V I M - v " .. version.major .. "." .. version.minor,
          '                                                  ',
        },
        center = {
            {
                icon = "󱚉  ",
                icon_hl = icon_color,
                desc = "Recents                       ",
                desc_hl = description_color,
                key = "r",
                key_hl = keymap_color,
                action = "Telescope oldfiles",
            },
            {
                icon = "  ",
                icon_hl = icon_color,
                desc = "Find File                     ",
                desc_hl = description_color,
                key = "f",
                key_hl = keymap_color,
                action = "Telescope find_files",
            },

            {
                icon = "  ",
                icon_hl = icon_color,
                desc = "New File                      ",
                desc_hl = description_color,
                key = "n",
                key_hl = keymap_color,
                action = "lua dashNewFile()",
            },
            {
                icon = "  ",
                icon_hl = icon_color,
                desc = "Update Plugins                ",
                desc_hl = description_color,
                key = "u",
                key_hl = keymap_color,
                action = "PackerUpdate",
            },
            {
                icon = "  ",
                icon_hl = icon_color,
                desc = "Exit                          ",
                desc_hl = description_color,
                key = "q",
                key_hl = keymap_color,
                action = "exit",
            },
        },
        footer = {
            "type  :help<Enter> or <F1> for on-line help"
        }
    }
})

-- this is for a floating window prompt for a new file
local Input = require('nui.input')
local event = require('nui.utils.autocmd').event

_G.dashNewFile = function()
   local input= Input({
    position = '50%',
    size = {
      width = 40,
    },
    border = {
      style = 'rounded',
      text = {
        top = ' Create a new file ',
        top_align = 'center',
      },
      padding = { 0, 1 },
    },
    relative = 'editor',
    win_options = {
      winhighlight = 'Normal:String,FloatBorder:VertSplit',
    },
  }, {
    prompt = '',
    default_value = '',
    on_close = function()
      require('notify').notify('New file was not created!', 'error')
    end,
    on_submit = function(value)
      vim.fn.execute('edit ' .. value)
    end,
  })
  input:on(event.BufLeave, function() input:unmount() end)
  input:mount()
end
