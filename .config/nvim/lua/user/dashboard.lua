local db = require("dashboard")
local version = vim.version()

db.session_directory = vim.fn.stdpath("data") .. "/sessions"

db.default_banner = {
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
    "N E O V I M - v " .. version.major .. "." .. version.minor,
}

local icon_color = "Function"
db.custom_center = {
    {
        desc = "Find File                     ",
        shortcut = "f",
        icon = "  ",
        icon_hl = { link = icon_color },
        action = "Telescope find_files",
    },
    {
        desc = "Recents                       ",
        shortcut = "r",
        icon = "  ",
        icon_hl = { link = icon_color },
        action = "Telescope oldfiles",
    },

    {
        desc = "New File                      ",
        shortcut = "n",
        icon = "  ",
        icon_hl = { link = icon_color },
        action = "DashboardNewFile",
    },

    -- { shortcut = "<leader>fm", icon = " ", desc = "Bookmark", action = "Telescope marks" },
    {
        desc = "Load Last Session             ",
        shortcut = "L",
        icon = "  ",
        icon_hl = { link = icon_color },
        action = "SessionLoad",
    },

    {
        desc = "Update Plugins                ",
        shortcut = "u",
        icon = "  ",
        icon_hl = { link = icon_color },
        action = "PackerUpdate",
    },
    {
        desc = "Exit                          ",
        shortcut = "q",
        icon = "  ",
        icon_hl = { link = icon_color },
        action = "exit",
    },
}

db.custom_footer = { "type  :help<Enter>  or  <F1>  for on-line help" }


vim.api.nvim_create_autocmd('Filetype', {
    pattern = 'dashboard',
    group = vim.api.nvim_create_augroup('Dashboard_au', { clear = true }),
    callback = function()
        vim.cmd [[
            hi! link DashboardFooter NonText
            setlocal buftype=nofile
            setlocal nonumber norelativenumber nocursorline noruler
            nnoremap <buffer> f <cmd>Telescope find_files<CR>
            nnoremap <buffer> r <cmd>Telescope oldfiles<CR>
            nnoremap <buffer> n <cmd>DashboardNewFile<CR>
            nnoremap <buffer> <leader>en <cmd>DashboardNewFile<CR>
            nnoremap <buffer> L <cmd>SessionLoad<CR>
            nnoremap <buffer> u <cmd>PackerUpdate<CR>
            nnoremap <buffer> q <cmd>exit<CR>
        ]]
    end
})
