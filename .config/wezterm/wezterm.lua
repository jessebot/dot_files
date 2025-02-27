local wezterm = require 'wezterm'
local act = wezterm.action

local config = {
       -- never play a bell sound
       audible_bell = "Disabled",

       -- initial size of the terminal
       initial_cols = 162,
       initial_rows = 50,

       -- font stuff
       -- don't complain if an icon or character is missing
       warn_about_missing_glyphs = false,
       font = wezterm.font_with_fallback { 'mononoki', 'Symbols Nerd Font Mono' },

       font_rules = {
         {
           intensity = 'Bold',
           italic = true,
           font = wezterm.font {
             family = 'Victor Mono',
             weight = 'Bold',
             style = 'Italic',
           },
         },
         {
           italic = true,
           intensity = 'Half',
           font = wezterm.font {
             family = 'Victor Mono',
             weight = 'DemiBold',
             style = 'Italic',
           },
         },
         {
           italic = true,
           intensity = 'Normal',
           font = wezterm.font {
             family = 'Victor Mono',
             style = 'Italic',
           },
         },
       },

       font_size = 12,

       -- window look and feel
       hide_tab_bar_if_only_one_tab = true,
       window_decorations = "RESIZE",
       -- transparency
       window_background_opacity = 0.96,

       -- key mappings
       keys = {
        -- This will create a new split and run your default program inside its
        {
            key = 's',
            mods = 'CTRL',
            action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
        },

        {
            key = 'S',
            mods = 'CTRL',
            action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
        },

        -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
        {
            key = 'LeftArrow',
            mods = 'OPT',
            action = act.SendString '\x1bb'
        },

        -- Make Option-Right equivalent to Alt-f; forward-word
        {
            key = 'RightArrow',
            mods = 'OPT',
            action = act.SendString '\x1bf'
        },
       },


       -- default terminal colors
       colors = {
           -- change color for background to this if you need high contrast: #1b1b29
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
           split = '#6eb3ec',
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
               '#6e77a0',
               '#fe8ea2',
               '#97e178',
               '#f6f76a',
               '#6eb3ec',
               '#ef8ef6',
               '#86f0e4',
               '#dadfe0',
           },
       },

       -- make clickable hyperlinks work
       hyperlink_rules = {

       -- Linkify things that look like URLs and the host has a TLD name.
       -- Compiled-in default. Used if you don't specify any hyperlink_rules.
       {
         regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
         format = '$0',
       },

       -- linkify email addresses
       -- Compiled-in default. Used if you don't specify any hyperlink_rules.
       {
         regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
         format = 'mailto:$0',
       },

       -- file:// URI
       -- Compiled-in default. Used if you don't specify any hyperlink_rules.
       {
         regex = [[\bfile://\S*\b]],
         format = '$0',
       },

       -- Linkify things that look like URLs with numeric addresses as hosts.
       -- E.g. http://127.0.0.1:8000 for a local development server,
       -- or http://192.168.1.1 for the web interface of many routers.
       {
         regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
         format = '$0',
       },
      }
}

-- add ssh_domains only if they're present in a local file
local function file_exists(name)
    local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end


local function add_personal_config()
    local home = os.getenv("HOME")
    if file_exists(home .. '/.config/wezterm/personal_wezterm_config.lua') then
        local personal_config = require 'personal_wezterm_config'
        config["ssh_domains"] = personal_config.ssh_domains
    end
end

pcall(add_personal_config)

return config
