local db = require("dashboard")
local version = vim.version()

-- db.session_directory = vim.fn.stdpath("data") .. "/sessions"

local icon_color = "Function"
db.setup({
    theme = 'doom',
    config = {
        header = {
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
          "N E O V I M - v " .. version.major .. "." .. version.minor,
          '                                                  ',
        },
        center = {
            {
                icon = "  ",
                icon_hl = { link = icon_color },
                desc = "Find File                     f",
                key = "f",
                action = "Telescope find_files",
            },
            {
                icon = "  ",
                icon_hl = { link = icon_color },
                desc = "Recents                       r",
                key = "r",
                action = "Telescope oldfiles",
            },
            {
                icon = "  ",
                icon_hl = { link = icon_color },
                desc = "New File                      n",
                key = "n",
                action = "DashboardNewFile",
            },

            -- { key = "<leader>fm", icon = " ", desc = "Bookmark", action = "Telescope marks" },
            {
                icon = "  ",
                icon_hl = { link = icon_color },
                desc = "Load Last Session             L",
                key = "L",
                action = "SessionLoad",
            },

            {
                icon = "  ",
                icon_hl = { link = icon_color },
                desc = "Update Plugins                u",
                key = "u",
                action = "PackerUpdate",
            },
            {
                icon = "  ",
                icon_hl = { link = icon_color },
                desc = "Exit                          q",
                key = "q",
                action = "exit",
            },
        },
        footer = {
            "type  :help<Enter> on-line help"
        }
    }
})

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
