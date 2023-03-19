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
