-- ~~~~~~~~~~~~~~~~~~~~~~~ Key Mappings for Neovim ~~~~~~~~~~~~~~~~~~~~~~~~~~

-- leader key is the default modifier key for neovim. We map leader to <Space>
vim.g.mapleader = " "

-- Enter to fold code (collapses code block)
vim.keymap.set('n', '<enter>', 'za')

-- neotree - launches a file browser on the left hand side of the screen
vim.keymap.set(
    'n',
    '<leader>n',
    '<cmd>NeoTreeShowToggle<cr>',
    { desc = "🌳 Neotree - a file browser tree for neovim" }
)

-- ------------------------ terminal windows ----------------------------

-- CTRL+t keybindings to toggle terminal
vim.keymap.set(
    'n',
    '<C-t>',
    '<CMD>ToggleTerm<CR>',
    { desc = "  ToggleTerm - terminal for neovim" }
)
vim.keymap.set(
    't',
    '<C-t>',
    '<C-\\><C-n><CMD>ToggleTerm<CR>',
    { desc = "  ToggleTerm - terminal for neovim" }
)

-- ------------------------ external app windows -----------------------------

-- cmatrix - goofy "The Matrix" terminal wallpaper
vim.keymap.set(
    'n',
    '<leader>M',
    '<cmd>Matrix<cr>',
    { desc = "󰘨  The Matrix™️" }
)

-- gitui - a TUI for git
vim.keymap.set(
    'n',
    '<leader>g',
    '<cmd>Gitui<cr>',
    { desc = "  gitui - terminal UI for git" }
)

-- k9s - a TUI dashboard for k8s
vim.keymap.set(
    'n',
    '<leader>K',
    '<cmd>K9s<cr>',
    { desc = "󱃾  k9s - kubernetes dashboard" }
)

-- bpython - colorful and rich python interpretter
vim.keymap.set(
    'n',
    '<leader>p',
    '<cmd>Bpython<cr>',
    { desc = "  bpython - color + docs in interactive python" }
)

-- ---------------------- Telescope windows ----------------------------
vim.keymap.set(
    'n',
    "<leader>:",
    "<cmd>Telescope commands<cr>",
    { desc = "🔭 All Commands" }
)

vim.keymap.set(
    'n',
    '<leader>H',
    '<cmd>Telescope highlights<CR>',
    { desc = "🔭 Telescope for highlight groups in current buffer" }
)

vim.keymap.set(
    'n',
    '<leader>h',
    '<cmd>Telescope command_history<CR>',
    { desc = "🔭 Telescope for command history" }
)

vim.keymap.set(
    'n',
    "<leader>ff",
    "<cmd>Telescope find_files<cr>",
    { desc = "🔭 Find Files (cwd)" }
)

vim.keymap.set(
    'n',
    "<leader>fr",
    "<cmd>Telescope oldfiles<cr>",
    { desc = "🔭 Files Recently Opened in Neovim" }
)

-- --------------------------- Diagnostics ------------------------------ 
vim.keymap.set(
    "n",
    "<leader>d",
    "<cmd>TroubleToggle<cr>",
    {
        silent = true,
        noremap = true,
        desc = "🐛 Diagnostics for the active buffer"
    }
)
